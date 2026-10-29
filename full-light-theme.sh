#!/bin/bash

echo "🎨 Converting Full Website to Light Theme & Adding Live Animations..."

# ==========================================
# 1. UPDATE globals.css (Live Animation + Light Colors)
# ==========================================
cat << 'EOF' > src/app/globals.css
@import "tailwindcss";

@theme {
  --color-brand-blue: #2563eb;
  --color-brand-blue-hover: #1d4ed8;
  --color-surface: #ffffff;
  --color-surface-2: #f8fafc;
  --color-foreground: #0f172a;
  --color-muted: #64748b;
  --color-border: #e2e8f0;
  
  --font-sans: "Inter", ui-sans-serif, system-ui, sans-serif;
}

@layer base {
  * { border-color: var(--color-border); }
  html { scroll-behavior: smooth; -webkit-font-smoothing: antialiased; }
  body { font-family: var(--font-sans); background-color: var(--color-surface-2); color: var(--color-foreground); overflow-x: hidden; }
  ::selection { background: var(--color-brand-blue); color: white; }
}

@utility container-page { width: 100%; max-width: 1280px; margin-inline: auto; padding-inline: 1.5rem; }

/* --- LIVE ANIMATIONS --- */
@keyframes blob {
  0% { transform: translate(0px, 0px) scale(1); }
  33% { transform: translate(30px, -50px) scale(1.1); }
  66% { transform: translate(-20px, 20px) scale(0.9); }
  100% { transform: translate(0px, 0px) scale(1); }
}
.animate-blob { animation: blob 7s infinite; }
.animation-delay-2000 { animation-delay: 2s; }
.animation-delay-4000 { animation-delay: 4s; }

@keyframes marquee-slow {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}
.animate-marquee-slow { animation: marquee-slow 30s linear infinite; }

@keyframes marquee {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}
.animate-marquee { animation: marquee 25s linear infinite; }

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}
.animate-float { animation: float 4s ease-in-out infinite; }

/* Custom Scrollbar */
.custom-scrollbar::-webkit-scrollbar { width: 6px; }
.custom-scrollbar::-webkit-scrollbar-track { background: #f1f5f9; }
.custom-scrollbar::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 10px; }

.text-gradient-blue {
  background: linear-gradient(to right, #2563eb, #3b82f6);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
EOF

echo "✅ globals.css updated (Animations Added)."

# ==========================================
# 2. UPDATE layout.tsx (Root Light Theme)
# ==========================================
cat << 'EOF' > src/app/layout.tsx
import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { Header } from "@/components/layout/Header";
import { Footer } from "@/components/layout/Footer";
import { CustomCursor } from "@/components/ui/CustomCursor";
import { site } from "@/shared/config/site";

const inter = Inter({ subsets: ["latin"], variable: "--font-inter", display: "swap" });

export const metadata: Metadata = {
  metadataBase: new URL(site.url),
  title: `${site.name} — Business Advisory`,
  description: site.description,
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={inter.variable} suppressHydrationWarning data-scroll-behavior="smooth">
      <body className="bg-[#F8FAFC] antialiased text-slate-900 selection:bg-blue-600 selection:text-white">
        <CustomCursor />
        <Header />
        <main id="main">{children}</main>
        <Footer />
      </body>
    </html>
  );
}
EOF

echo "✅ layout.tsx updated."

# ==========================================
# 3. UPDATE Hero.tsx (Removed Box-Grid, Added Live Blobs)
# ==========================================
cat << 'EOF' > src/components/home/Hero.tsx
"use client";
import Link from "next/link";
import { motion } from "motion/react";
import { ArrowRight, MessageCircle, Sparkles, CheckCircle2, User, Bot } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function Hero() {
  return (
    <section className="relative min-h-[90vh] flex items-center bg-white overflow-hidden pt-20 pb-20">
      
      {/* --- LIVE BACKGROUND ANIMATION (Blobs) --- */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none z-0">
        <div className="absolute top-0 -left-4 w-72 h-72 bg-blue-300 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-blob"></div>
        <div className="absolute top-0 -right-4 w-72 h-72 bg-cyan-300 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-blob animation-delay-2000"></div>
        <div className="absolute -bottom-8 left-20 w-72 h-72 bg-indigo-300 rounded-full mix-blend-multiply filter blur-3xl opacity-30 animate-blob animation-delay-4000"></div>
      </div>

      {/* Background Text Watermark */}
      <div className="absolute inset-0 flex items-center justify-center opacity-[0.02] pointer-events-none select-none overflow-hidden z-0">
        <div className="flex whitespace-nowrap animate-marquee-slow text-[200px] font-extrabold text-slate-900 tracking-tighter">
          <span>PRIMEWEALTH ADVISORY</span>
          <span>PRIMEWEALTH ADVISORY</span>
        </div>
      </div>

      <div className="container-page relative z-10 grid lg:grid-cols-2 gap-16 items-center">
        
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.6 }} className="flex flex-col justify-center">
          
          <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/80 backdrop-blur-sm border border-slate-200 text-xs font-bold text-slate-600 mb-8 w-fit shadow-sm">
            <Sparkles className="h-4 w-4 text-blue-600" /> 
            BUSINESS • STARTUP • GOVERNMENT SERVICES
          </div>

          <h1 className="text-5xl sm:text-6xl lg:text-7xl font-extrabold tracking-tight leading-[1.1] mb-6 text-slate-900">
            Grow Your Business <br />
            <span className="text-gradient-blue">With Government Support.</span>
          </h1>

          <p className="text-lg text-slate-600 mb-8 max-w-lg leading-relaxed">
            DPIIT recognition, Section 80-IAC, Udyam / MSME registration, government schemes and funding — <strong className="text-slate-900">one partner, end-to-end.</strong>
          </p>

          <div className="flex flex-col sm:flex-row gap-4 mb-10">
            <Button asChild size="lg" className="h-14 px-8 text-lg rounded-full bg-slate-900 hover:bg-black text-white font-bold transition-all shadow-lg hover:-translate-y-1">
              <Link href="/contact">Check My Eligibility <ArrowRight className="ml-2 h-5 w-5" /></Link>
            </Button>
            <Button asChild size="lg" variant="outline" className="h-14 px-8 text-lg rounded-full bg-white border-slate-300 text-slate-700 hover:bg-slate-50 font-bold">
              <Link href="/contact">Talk to an Expert</Link>
            </Button>
            <Button asChild size="lg" className="h-14 px-8 text-lg rounded-full bg-green-500 hover:bg-green-600 text-white font-bold">
              <a href="https://wa.me/919876543210" target="_blank"><MessageCircle className="mr-2 h-5 w-5" /> WhatsApp</a>
            </Button>
          </div>

          <div className="flex items-center gap-3 bg-white/80 backdrop-blur-sm border border-slate-200 p-3 pr-5 rounded-2xl w-fit shadow-sm">
            <div className="h-10 w-10 bg-blue-50 rounded-xl flex items-center justify-center text-blue-600">
              <CheckCircle2 className="h-5 w-5" />
            </div>
            <div>
              <p className="text-xs font-bold text-blue-600 uppercase tracking-wider">Startup India</p>
              <p className="text-sm font-bold text-slate-800">DPIIT + Tax Exemption</p>
            </div>
          </div>
        </motion.div>

        <div className="relative h-[500px] hidden lg:flex items-center justify-center">
          <div className="relative w-full max-w-[500px] h-full bg-slate-100 rounded-[3rem] border border-slate-200 overflow-hidden shadow-2xl flex items-center justify-center">
            <img src="https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=800&auto=format&fit=crop" alt="Consultation" className="object-cover w-full h-full opacity-90" />
            <div className="absolute inset-0 bg-gradient-to-t from-slate-900/40 to-transparent" />
          </div>
          <motion.div animate={{ y: [0, -10, 0] }} transition={{ repeat: Infinity, duration: 4, ease: "easeInOut" }} className="absolute top-10 -left-6 bg-white px-5 py-3 rounded-2xl rounded-bl-none shadow-xl border border-slate-100 z-20 flex items-center gap-3">
            <div className="bg-slate-100 p-2 rounded-full"><User className="h-4 w-4 text-slate-600" /></div>
            <p className="text-sm font-bold text-slate-800">Need DPIIT + funding.</p>
          </motion.div>
          <motion.div animate={{ y: [0, 10, 0] }} transition={{ repeat: Infinity, duration: 5, ease: "easeInOut", delay: 1 }} className="absolute bottom-20 -right-6 bg-blue-600 text-white px-5 py-3 rounded-2xl rounded-br-none shadow-xl border border-blue-500 z-20 flex items-center gap-3">
            <div className="bg-blue-500 p-2 rounded-full"><Bot className="h-4 w-4 text-white" /></div>
            <p className="text-sm font-bold">Are you registered yet?</p>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ Hero.tsx updated (Live animation added)."

# ==========================================
# 4. UPDATE Header.tsx
# ==========================================
cat << 'EOF' > src/components/layout/Header.tsx
"use client";
import Link from "next/link";
import { useState, useEffect } from "react";
import { Menu, MessageCircle, ArrowRight } from "lucide-react";
import { site } from "@/shared/config/site";
import { Button } from "@/components/ui/Button";
import { cn } from "@/shared/lib/utils";

export function Header() {
  const [scrolled, setScrolled] = useState(false);
  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 10);
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  return (
    <header className={cn("sticky top-0 z-50 w-full transition-all duration-300 bg-white/90 backdrop-blur-md border-b border-slate-200", scrolled ? "py-3 shadow-sm" : "py-4")}>
      <div className="container-page flex items-center justify-between text-slate-900">
        <Link href="/" className="flex items-center gap-2 font-bold text-xl">
          <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-blue-600 text-white shadow-md">PW</div>
          <span className="hidden sm:inline tracking-tight font-extrabold">PrimeWealth</span>
        </Link>
        <nav className="hidden lg:flex items-center gap-6 text-sm font-semibold text-slate-600">
          <Link href="/" className="hover:text-blue-600 transition-colors">Home</Link>
          <Link href="/about" className="hover:text-blue-600 transition-colors">About</Link>
          <Link href="/services" className="hover:text-blue-600 transition-colors">Services</Link>
          <Link href="/funding" className="hover:text-blue-600 transition-colors">Funding</Link>
          <Link href="/contact" className="hover:text-blue-600 transition-colors">Contact</Link>
        </nav>
        <div className="hidden lg:flex items-center gap-3">
          <Button asChild className="bg-green-500 hover:bg-green-600 text-white rounded-full h-10 px-5 text-sm font-bold shadow-sm">
            <a href={site.whatsapp} target="_blank"><MessageCircle className="mr-2 h-4 w-4"/> WhatsApp</a>
          </Button>
          <Button asChild className="bg-blue-600 hover:bg-blue-700 text-white rounded-full h-10 px-6 text-sm font-bold shadow-md">
            <Link href="/contact">Check Eligibility <ArrowRight className="ml-2 h-4 w-4"/></Link>
          </Button>
        </div>
        <button className="lg:hidden p-2"><Menu className="h-6 w-6" /></button>
      </div>
    </header>
  );
}
EOF

echo "✅ Header.tsx updated."

# ==========================================
# 5. UPDATE Footer.tsx
# ==========================================
cat << 'EOF' > src/components/layout/Footer.tsx
import Link from "next/link";
import { site, allServices } from "@/shared/config/site";
import { ArrowRight, Mail, Phone, MapPin } from "lucide-react";

export function Footer() {
  return (
    <footer className="bg-white pt-20 border-t border-slate-200">
      <div className="container-page grid md:grid-cols-2 lg:grid-cols-5 gap-12 pb-16">
        <div className="lg:col-span-2">
          <Link href="/" className="flex items-center gap-2 text-slate-900 font-bold text-2xl mb-6">
            <div className="h-10 w-10 bg-blue-600 rounded-xl flex items-center justify-center text-xl text-white shadow-md">PW</div> 
            PrimeWealth
          </Link>
          <p className="text-sm text-slate-500 mb-8 leading-relaxed max-w-sm">Empowering Indian founders with end-to-end business setup, funding, and compliance solutions.</p>
          <div className="space-y-4 text-sm text-slate-600">
            <p className="flex items-start gap-3"><MapPin className="h-5 w-5 text-blue-600 shrink-0" /> {site.address}</p>
            <p className="flex items-center gap-3"><Phone className="h-4 w-4 text-blue-600" /> {site.phone}</p>
            <p className="flex items-center gap-3"><Mail className="h-4 w-4 text-blue-600" /> {site.email}</p>
          </div>
        </div>
        <div>
          <h4 className="text-slate-900 font-bold mb-6">Services</h4>
          <ul className="space-y-3 text-sm">
            {allServices.slice(0, 6).map((s) => (
              <li key={s.slug}><Link href={`/services/${s.slug}`} className="text-slate-500 hover:text-blue-600 transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> {s.name}</Link></li>
            ))}
          </ul>
        </div>
        <div>
          <h4 className="text-slate-900 font-bold mb-6">Company</h4>
          <ul className="space-y-3 text-sm">
            {["About", "Funding", "Blog", "Contact", "Privacy Policy", "Terms of Service"].map((item) => (
              <li key={item}><Link href={`/${item.toLowerCase().replace(" ", "-")}`} className="text-slate-500 hover:text-blue-600 transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> {item}</Link></li>
            ))}
          </ul>
        </div>
      </div>
      <div className="border-t border-slate-200 py-6 bg-slate-50">
        <div className="container-page flex flex-col md:flex-row justify-between items-center gap-4 text-xs text-slate-500">
          <p>© {new Date().getFullYear()} PrimeWealth Advisory. All rights reserved.</p>
          <p>Made with ❤️ in India</p>
        </div>
      </div>
    </footer>
  );
}
EOF

echo "✅ Footer.tsx updated."

# ==========================================
# 6. UPDATE Stats.tsx
# ==========================================
cat << 'EOF' > src/components/home/Stats.tsx
import { homepageContent } from "@/shared/config/site";
export function Stats() {
  return (
    <section className="py-12 border-b border-slate-200 bg-white">
      <div className="container-page grid grid-cols-2 md:grid-cols-4 gap-8">
        {homepageContent.stats.map((s, i) => (
          <div key={i} className="text-center">
            <p className="text-4xl font-extrabold text-blue-600 mb-2">{s.value}{s.suffix}</p>
            <p className="text-xs font-bold text-slate-500 uppercase tracking-widest">{s.label}</p>
          </div>
        ))}
      </div>
    </section>
  );
}
EOF

echo "✅ Stats.tsx updated."

# ==========================================
# 7. UPDATE ServicesGrid.tsx
# ==========================================
cat << 'EOF' > src/components/home/ServicesGrid.tsx
"use client";
import Link from "next/link";
import { motion } from "motion/react";
import { serviceCategories } from "@/shared/config/site";
import { ArrowRight } from "lucide-react";

export function ServicesGrid() {
  return (
    <section className="py-32 bg-slate-50 relative overflow-hidden">
      <div className="container-page relative z-10">
        <div className="text-center mb-24">
          <motion.p initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-4">SERVICES</motion.p>
          <motion.h2 initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.1 }} className="text-4xl md:text-5xl font-extrabold text-slate-900 tracking-tight">
            Business Solutions for <span className="text-gradient-blue">Startups & MSMEs</span>
          </motion.h2>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {serviceCategories.map((g, i) => (
            <motion.div key={g.code} initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: i * 0.05 }}>
              <Link href="/services">
                <div className="h-full bg-white border border-slate-200 p-8 rounded-[2rem] group cursor-pointer hover:border-blue-600/50 hover:shadow-xl transition-all duration-300">
                  <h3 className="text-xl font-bold text-slate-900 mb-4 group-hover:text-blue-600 transition-colors">{g.code}</h3>
                  <p className="text-sm text-slate-500 leading-relaxed mb-8">{g.desc}</p>
                  <div className="flex items-center text-xs font-bold text-blue-600 uppercase tracking-wider">
                    Explore <ArrowRight className="ml-2 h-4 w-4 group-hover:translate-x-2 transition-transform" />
                  </div>
                </div>
              </Link>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ ServicesGrid.tsx updated."

# ==========================================
# 8. UPDATE Process.tsx
# ==========================================
cat << 'EOF' > src/components/home/Process.tsx
"use client";
import { homepageContent } from "@/shared/config/site";
import { FileSearch, Users, FileCheck, Landmark } from "lucide-react";
import { motion } from "motion/react";

const icons = [FileSearch, Users, FileCheck, Landmark];

export function Process() {
  return (
    <section className="bg-white py-24 relative">
      <div className="container-page">
        <div className="text-center mb-20">
          <p className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-4">PROCESS</p>
          <h2 className="text-4xl md:text-5xl font-extrabold text-slate-900 tracking-tight">How We Secure Your <span className="text-gradient-blue">Funding</span></h2>
        </div>
        <div className="grid md:grid-cols-4 gap-8">
          {homepageContent.process.map((step, i) => {
            const Icon = icons[i];
            return (
              <motion.div key={i} initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: i * 0.1 }} className="text-center">
                <div className="w-20 h-20 mx-auto rounded-2xl bg-blue-50 border border-blue-100 flex items-center justify-center mb-6 relative">
                  <Icon className="h-8 w-8 text-blue-600" />
                  <div className="absolute -top-3 -right-3 w-8 h-8 rounded-full bg-blue-600 text-white text-sm font-bold flex items-center justify-center shadow-md">{i + 1}</div>
                </div>
                <h3 className="text-xl font-bold text-slate-900 mb-2">{step.title}</h3>
                <p className="text-sm text-slate-500 leading-relaxed">{step.desc}</p>
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ Process.tsx updated."

# ==========================================
# 9. UPDATE BentoFeatures.tsx
# ==========================================
cat << 'EOF' > src/components/home/BentoFeatures.tsx
"use client";
import { motion } from "motion/react";
import { Building2, TrendingUp, ShieldCheck, Award } from "lucide-react";
import { homepageContent } from "@/shared/config/site";
import { Reveal } from "@/components/motion/Reveal";

const IconMap: Record<string, any> = { Building2, TrendingUp, ShieldCheck, Award };

export function BentoFeatures() {
  const features = homepageContent?.features || [];
  return (
    <section className="py-32 bg-slate-50">
      <div className="container-page">
        <Reveal>
          <div className="text-center mb-20">
            <h2 className="text-4xl font-extrabold tracking-tight mb-4 text-slate-900">What are you <span className="text-blue-600">looking for?</span></h2>
            <p className="text-xl text-slate-500 max-w-2xl mx-auto">Choose a path and we will guide you through the relevant services.</p>
          </div>
        </Reveal>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {features.map((f: any, i: number) => {
            const Icon = IconMap[f.icon] || Building2;
            return (
              <Reveal key={f.title} delay={i * 0.1}>
                <motion.div whileHover={{ y: -5 }} className="h-full rounded-3xl bg-white border border-slate-200 p-8 flex flex-col hover:shadow-xl transition-all duration-300 group cursor-pointer">
                  <div className="h-12 w-12 rounded-2xl bg-blue-50 flex items-center justify-center text-blue-600 mb-6 group-hover:scale-110 group-hover:bg-blue-600 group-hover:text-white transition-all">
                    <Icon className="h-6 w-6" />
                  </div>
                  <div>
                    <h3 className="text-xl font-bold mb-2 text-slate-900">{f.title}</h3>
                    <p className="text-slate-500 text-sm">{f.desc}</p>
                  </div>
                </motion.div>
              </Reveal>
            );
          })}
        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ BentoFeatures.tsx updated."

# ==========================================
# 10. UPDATE WhyChooseUs.tsx
# ==========================================
cat << 'EOF' > src/components/home/WhyChooseUs.tsx
"use client";
import { motion } from "motion/react";
import { homepageContent } from "@/shared/config/site";
import { CheckCircle2, Headset, RefreshCw, Gift } from "lucide-react";

const icons = [CheckCircle2, Headset, RefreshCw, Gift];

export function WhyChooseUs() {
  return (
    <section className="py-32 bg-white relative">
      <div className="container-page">
        <motion.div initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="text-center mb-24">
          <p className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-4">WHY CHOOSE US</p>
          <h2 className="text-4xl md:text-5xl font-extrabold text-slate-900 tracking-tight">Key Benefits of Our <span className="text-blue-600">Expert Consultation</span></h2>
        </motion.div>
        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6 max-w-6xl mx-auto">
          {homepageContent.whyChooseUs.map((item, i) => {
            const Icon = icons[i];
            return (
              <motion.div key={i} initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ duration: 0.5, delay: i * 0.1 }} className="relative bg-slate-50 border border-slate-200 p-8 rounded-3xl h-full hover:-translate-y-2 hover:shadow-lg transition-all duration-300">
                <div className="w-14 h-14 rounded-2xl bg-white shadow-sm flex items-center justify-center mb-6 border border-slate-100">
                  <Icon className="h-7 w-7 text-blue-600" />
                </div>
                <h3 className="font-bold text-xl text-slate-900 mb-3">{item.title}</h3>
                <p className="text-sm text-slate-500 leading-relaxed">{item.desc}</p>
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ WhyChooseUs.tsx updated."

# ==========================================
# 11. UPDATE Testimonials.tsx
# ==========================================
cat << 'EOF' > src/components/home/Testimonials.tsx
"use client";
import { motion } from "motion/react";
import { homepageContent } from "@/shared/config/site";
import { Star, Quote } from "lucide-react";

export function Testimonials() {
  return (
    <section className="py-32 bg-slate-50 overflow-hidden border-y border-slate-200">
      <div className="container-page mb-16 text-center">
        <motion.h2 initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="text-4xl md:text-5xl font-extrabold text-slate-900 tracking-tight">
          Loved by <span className="text-blue-600">founders.</span>
        </motion.h2>
      </div>
      <div className="relative w-full flex overflow-x-hidden">
        <div className="absolute inset-y-0 left-0 w-32 bg-gradient-to-r from-slate-50 to-transparent z-10" />
        <div className="absolute inset-y-0 right-0 w-32 bg-gradient-to-l from-slate-50 to-transparent z-10" />
        <motion.div className="flex gap-6 px-6 animate-marquee" animate={{ x: ["0%", "-50%"] }} transition={{ repeat: Infinity, ease: "linear", duration: 30 }}>
          {[...homepageContent.testimonials, ...homepageContent.testimonials].map((t, i) => (
            <div key={i} className="w-[400px] shrink-0 bg-white border border-slate-200 p-8 rounded-3xl relative">
              <Quote className="absolute top-8 right-8 h-8 w-8 text-blue-100" />
              <div className="flex gap-1 text-yellow-400 mb-6">{[...Array(5)].map((_, j) => <Star key={j} className="h-4 w-4 fill-current" />)}</div>
              <p className="text-slate-700 text-lg leading-relaxed mb-8">"{t.quote}"</p>
              <div className="flex items-center gap-4">
                <div className="h-12 w-12 rounded-full bg-blue-100 flex items-center justify-center text-blue-700 font-bold text-lg">{t.author[0]}</div>
                <div>
                  <p className="font-bold text-slate-900">{t.author}</p>
                  <p className="text-sm text-slate-500">{t.role}</p>
                </div>
              </div>
            </div>
          ))}
        </motion.div>
      </div>
    </section>
  );
}
EOF

echo "✅ Testimonials.tsx updated."

# ==========================================
# 12. UPDATE FAQ.tsx
# ==========================================
cat << 'EOF' > src/components/home/FAQ.tsx
"use client";
import { homepageContent } from "@/shared/config/site";
import { useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { Plus, Minus } from "lucide-react";

export function FAQ() {
  const [open, setOpen] = useState<number | null>(null);
  return (
    <section className="py-32 bg-white">
      <div className="container-page max-w-3xl mx-auto">
        <div className="text-center mb-16"><h2 className="text-4xl font-extrabold text-slate-900">Frequently Asked Questions</h2></div>
        <div className="space-y-4">
          {homepageContent.faqs.map((faq, i) => (
            <div key={i} className={`border rounded-2xl overflow-hidden transition-all duration-300 ${open === i ? 'bg-blue-50 border-blue-200' : 'bg-slate-50 border-slate-200 hover:border-slate-300'}`}>
              <button className="w-full flex items-center justify-between p-6 text-left font-bold text-lg text-slate-900" onClick={() => setOpen(open === i ? null : i)}>
                {faq.q}
                <div className={`h-8 w-8 rounded-full flex items-center justify-center ${open === i ? 'bg-blue-600 text-white' : 'bg-white text-slate-500'}`}>{open === i ? <Minus className="h-4 w-4" /> : <Plus className="h-4 w-4" />}</div>
              </button>
              <AnimatePresence>{open === i && <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: "auto", opacity: 1 }} exit={{ height: 0, opacity: 0 }} className="px-6 pb-6 text-slate-600 leading-relaxed">{faq.a}</motion.div>}</AnimatePresence>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ FAQ.tsx updated."

# ==========================================
# 13. UPDATE CTASection.tsx
# ==========================================
cat << 'EOF' > src/components/home/CTASection.tsx
import Link from "next/link";
import { Button } from "@/components/ui/Button";
import { Reveal } from "@/components/motion/Reveal";
import { site } from "@/shared/config/site";

export function CTASection() {
  return (
    <section className="container-page py-16 pb-32">
      <Reveal>
        <div className="rounded-3xl bg-gradient-to-br from-blue-600 to-indigo-700 p-10 text-white md:p-16 shadow-2xl relative overflow-hidden">
          <div className="absolute top-0 right-0 w-64 h-64 bg-white/10 rounded-full blur-3xl" />
          <div className="mx-auto max-w-2xl text-center relative z-10">
            <h2 className="text-3xl font-bold tracking-tight sm:text-4xl">Ready to start? Let's map your journey.</h2>
            <p className="mt-3 text-blue-100">Free consultation — no commitment.</p>
            <div className="mt-8 flex flex-wrap justify-center gap-3">
              <Button asChild size="lg" className="bg-white text-blue-700 hover:bg-slate-50"><Link href="/contact">Book Consultation</Link></Button>
              <Button asChild size="lg" className="bg-green-500 text-white hover:bg-green-600 border-none"><a href={site.whatsapp}>Chat on WhatsApp</a></Button>
            </div>
          </div>
        </div>
      </Reveal>
    </section>
  );
}
EOF

echo "✅ CTASection.tsx updated."

# ==========================================
# 14. UPDATE AnimatedIndiaMap.tsx
# ==========================================
cat << 'EOF' > src/components/home/AnimatedIndiaMap.tsx
"use client";
import { useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { MAP_PATHS, FUNDS_DATA } from "@/shared/data/india-map-data";
import { Building2, Landmark, CheckCircle2, TrendingUp } from "lucide-react";

const stateNames: Record<string, string> = {
  gujarat: "Gujarat", maharashtra: "Maharashtra", karnataka: "Karnataka", delhi: "Delhi",
  tamilnadu: "Tamil Nadu", uttarpradesh: "Uttar Pradesh", rajasthan: "Rajasthan",
  madhyapradesh: "Madhya Pradesh", westbengal: "West Bengal", andhrapradesh: "Andhra Pradesh",
  telangana: "Telangana", kerala: "Kerala", odisha: "Odisha", bihar: "Bihar", assam: "Assam",
  punjab: "Punjab", haryana: "Haryana", himachalprades: "Himachal Pradesh", uttarakhand: "Uttarakhand",
  jammuandkashmi: "Jammu & Kashmir", ladakh: "Ladakh"
};

export function AnimatedIndiaMap() {
  const [selectedState, setSelectedState] = useState<string>("gujarat");
  const [industry, setIndustry] = useState<string>("all");

  const currentStateKey = selectedState in FUNDS_DATA.states ? selectedState : "default";
  const currentState = FUNDS_DATA.states[currentStateKey as keyof typeof FUNDS_DATA.states];
  
  const filteredItems = (currentState?.items || []).filter((item: any) => 
    industry === "all" || (item.i || []).includes(industry)
  );

  const centralItems = industry === "all" 
    ? Object.values(FUNDS_DATA.central).flat().filter(Boolean) as any[]
    : (FUNDS_DATA.central[industry as keyof typeof FUNDS_DATA.central] || []);

  return (
    <section className="py-24 bg-slate-50 relative overflow-hidden min-h-screen">
      <div className="container-page relative z-10">
        <div className="text-center mb-12">
          <p className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-2">LIVE FUNDING MAP</p>
          <h2 className="text-4xl md:text-5xl font-extrabold text-slate-900 mb-4">Explore <span className="text-blue-600">Funding</span> by State.</h2>
        </div>

        <div className="flex flex-wrap items-center justify-center gap-3 mb-12">
          {Object.entries(FUNDS_DATA.ind).map(([key, label]) => (
            <button
              key={key}
              onClick={() => setIndustry(key)}
              className={`px-5 py-2.5 rounded-full text-sm font-bold transition-all duration-300 ${
                industry === key
                  ? "bg-blue-600 text-white shadow-md scale-105"
                  : "bg-white text-slate-600 border border-slate-200 hover:text-blue-600 hover:border-blue-300"
              }`}
            >
              {label as string}
            </button>
          ))}
        </div>

        <div className="grid lg:grid-cols-2 gap-12 items-start">
          
          <div className="bg-white border border-slate-200 rounded-[2.5rem] p-6 relative shadow-xl">
            <div className="relative w-full aspect-[1/1.1]">
              <svg viewBox="0 0 600 650" className="w-full h-full drop-shadow-sm">
                {Object.entries(MAP_PATHS).map(([id, d]) => {
                  const isSelected = selectedState === id;
                  const data = FUNDS_DATA.states[id as keyof typeof FUNDS_DATA.states];
                  let count = 0;
                  if (data) count = data.items.filter((i:any) => industry === "all" || i.i.includes(industry)).length;

                  let fill = "#E2E8F0"; // Light gray for 0
                  if (count === 1) fill = "#93C5FD"; // Light blue
                  if (count === 2) fill = "#60A5FA"; // Medium blue
                  if (count >= 3) fill = "#3B82F6"; // Dark blue
                  if (isSelected) fill = "#1D4ED8"; // Navy for selected

                  return (
                    <motion.path
                      key={id}
                      d={d}
                      fill={fill}
                      stroke="#FFFFFF"
                      strokeWidth="1.5"
                      className="cursor-pointer transition-all duration-300 outline-none hover:opacity-80"
                      onClick={() => setSelectedState(id)}
                    />
                  );
                })}
              </svg>
            </div>
            <div className="flex flex-wrap justify-center gap-4 mt-6 text-xs text-slate-500 bg-slate-50 py-3 rounded-xl border border-slate-200">
              <span className="flex items-center gap-1.5"><i className="w-3 h-3 rounded bg-[#E2E8F0] inline-block" /> 0</span>
              <span className="flex items-center gap-1.5"><i className="w-3 h-3 rounded bg-[#93C5FD] inline-block" /> 1</span>
              <span className="flex items-center gap-1.5"><i className="w-3 h-3 rounded bg-[#60A5FA] inline-block" /> 2</span>
              <span className="flex items-center gap-1.5"><i className="w-3 h-3 rounded bg-[#3B82F6] inline-block" /> 3+</span>
            </div>
          </div>

          <div className="bg-white border border-slate-200 rounded-[2.5rem] p-8 h-[700px] overflow-y-auto custom-scrollbar shadow-xl">
            <AnimatePresence mode="wait">
              <motion.div key={selectedState + industry} initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -20 }} transition={{ duration: 0.3 }}>
                <h3 className="text-4xl font-extrabold text-slate-900 mb-2 capitalize">{stateNames[selectedState] || "India"}</h3>
                <p className="text-slate-500 mb-8">Reported state support and central funding options.</p>

                <div className="mb-8">
                  <h4 className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-4 flex items-center gap-2"><Building2 className="h-4 w-4" /> State Programmes ({filteredItems.length})</h4>
                  {filteredItems.length > 0 ? (
                    <div className="space-y-4">
                      {filteredItems.map((item: any, i: number) => (
                        <div key={i} className="bg-slate-50 border border-slate-200 p-5 rounded-2xl">
                          <div className="flex flex-wrap gap-2 mb-3">{(item.i || []).map((tag: string) => (<span key={tag} className="text-[10px] font-bold text-blue-700 bg-blue-100 px-2 py-1 rounded-md uppercase">{FUNDS_DATA.ind[tag as keyof typeof FUNDS_DATA.ind] || tag}</span>))}</div>
                          <p className="font-bold text-slate-900 text-lg mb-1">{item.t}</p>
                          <p className="text-sm text-slate-600">{item.d}</p>
                        </div>
                      ))}
                    </div>
                  ) : (<p className="text-sm text-slate-500 italic bg-slate-50 p-4 rounded-xl border border-slate-200">No specific state programme listed.</p>)}
                </div>

                <div className="mb-8">
                  <h4 className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-4 flex items-center gap-2"><Landmark className="h-4 w-4" /> Central Schemes</h4>
                  <div className="grid gap-3">
                    {centralItems.map((item: any, i: number) => (
                      <div key={i} className="bg-slate-50 p-4 rounded-xl border border-slate-200"><p className="font-bold text-slate-900 text-sm mb-1">{item.n}</p><p className="text-xs text-slate-600">{item.d}</p></div>
                    ))}
                  </div>
                </div>
              </motion.div>
            </AnimatePresence>
          </div>
        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ AnimatedIndiaMap.tsx updated."

# ==========================================
# 15. UPDATE LiveNotifications.tsx
# ==========================================
cat << 'EOF' > src/components/ui/LiveNotifications.tsx
"use client";
import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "motion/react";
import { CheckCircle2, X } from "lucide-react";

const notifications = [
  { name: "Rahul S.", city: "Mumbai", action: "got CGTMSE Loan Approved", amount: "₹50,00,000" },
  { name: "Priya P.", city: "Bangalore", action: "got DPIIT Certificate", amount: "Startup India" },
  { name: "Amit K.", city: "Delhi", action: "registered Private Limited", amount: "7 Days" },
];

export function LiveNotifications() {
  const [active, setActive] = useState<any>(null);
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    let index = 0;
    const showRandomNotification = () => {
      setActive(notifications[index]);
      setIsVisible(true);
      setTimeout(() => setIsVisible(false), 5000);
      index = (index + 1) % notifications.length;
    };
    const initialTimeout = setTimeout(showRandomNotification, 3000);
    const interval = setInterval(showRandomNotification, 12000);
    return () => { clearTimeout(initialTimeout); clearInterval(interval); };
  }, []);

  return (
    <div className="fixed bottom-6 left-6 z-50">
      <AnimatePresence>
        {isVisible && active && (
          <motion.div initial={{ opacity: 0, x: -50, y: 20 }} animate={{ opacity: 1, x: 0, y: 0 }} exit={{ opacity: 0, x: -50, y: 20 }} className="bg-white border border-slate-200 p-4 rounded-2xl shadow-2xl flex items-center gap-4 w-[320px] relative">
            <div className="h-12 w-12 rounded-full bg-green-50 flex items-center justify-center shrink-0"><CheckCircle2 className="h-6 w-6 text-green-500" /></div>
            <div className="flex-1">
              <p className="text-sm text-slate-600"><span className="font-bold text-slate-900">{active.name}</span> from {active.city} {active.action}.</p>
              <p className="text-lg font-extrabold text-blue-600 mt-1">{active.amount}</p>
            </div>
            <button onClick={() => setIsVisible(false)} className="text-slate-400 hover:text-slate-700"><X className="h-4 w-4" /></button>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
EOF

echo "✅ LiveNotifications.tsx updated."

# ==========================================
# 16. UPDATE CustomCursor.tsx (From Gold to Blue)
# ==========================================
cat << 'EOF' > src/components/ui/CustomCursor.tsx
"use client";
import { useEffect, useState } from "react";
import { motion, useMotionValue, useSpring } from "motion/react";

export function CustomCursor() {
  const [isVisible, setIsVisible] = useState(false);
  const cursorX = useMotionValue(-100);
  const cursorY = useMotionValue(-100);
  const springConfig = { damping: 25, stiffness: 300, mass: 0.5 };
  const cursorXSpring = useSpring(cursorX, springConfig);
  const cursorYSpring = useSpring(cursorY, springConfig);

  useEffect(() => {
    if (window.matchMedia("(pointer: coarse)").matches) return;
    const moveCursor = (e: MouseEvent) => {
      cursorX.set(e.clientX - 16);
      cursorY.set(e.clientY - 16);
      if (!isVisible) setIsVisible(true);
    };
    const handleMouseLeave = () => setIsVisible(false);
    const handleMouseEnter = () => setIsVisible(true);
    window.addEventListener("mousemove", moveCursor);
    document.body.addEventListener("mouseleave", handleMouseLeave);
    document.body.addEventListener("mouseenter", handleMouseEnter);
    return () => {
      window.removeEventListener("mousemove", moveCursor);
      document.body.removeEventListener("mouseleave", handleMouseLeave);
      document.body.removeEventListener("mouseenter", handleMouseEnter);
    };
  }, [cursorX, cursorY, isVisible]);

  if (!isVisible) return null;

  return (
    <motion.div className="fixed top-0 left-0 w-8 h-8 rounded-full border border-blue-500 bg-blue-500/10 backdrop-blur-sm pointer-events-none z-[9999] flex items-center justify-center" style={{ x: cursorXSpring, y: cursorYSpring }}>
      <div className="w-1.5 h-1.5 bg-blue-600 rounded-full" />
    </motion.div>
  );
}
EOF

echo "✅ CustomCursor.tsx updated."

echo "=========================================="
echo "🎉 FULL LIGHT THEME APPLIED SUCCESSFULLY!"
echo "Ab terminal me 'npm run dev' chala kar dekho."
echo "=========================================="