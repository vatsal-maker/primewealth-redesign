#!/bin/bash

echo "🔄 Restoring Home Page to Light Theme..."

# ==========================================
# 1. Restore Hero.tsx (Light Theme with Live Blobs)
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
      
      {/* LIVE BACKGROUND ANIMATION (Blobs) */}
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
echo "✅ Hero.tsx restored to Light Theme."

# ==========================================
# 2. Restore ServicesGrid.tsx (Light Theme)
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
echo "✅ ServicesGrid.tsx restored to Light Theme."

# ==========================================
# 3. Restore Footer.tsx (Light Theme)
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
echo "✅ Footer.tsx restored to Light Theme."

# ==========================================
# 4. Restore page.tsx (Old Homepage Layout)
# ==========================================
cat << 'EOF' > src/app/page.tsx
import { Hero } from "@/components/home/Hero";
import { Stats } from "@/components/home/Stats";
import { BentoFeatures } from "@/components/home/BentoFeatures";
import { Process } from "@/components/home/Process";
import { WhyChooseUs } from "@/components/home/WhyChooseUs";
import { Testimonials } from "@/components/home/Testimonials";
import { FAQ } from "@/components/home/FAQ";
import { CTASection } from "@/components/home/CTASection";
import { ServicesGrid } from "@/components/home/ServicesGrid";
import { LiveFundingDashboard } from "@/components/home/LiveFundingDashboard";
import { LiveNotifications } from "@/components/ui/LiveNotifications";
import { AIChatWidget } from "@/components/ui/AIChatWidget";

export default function HomePage() {
  return (
    <main className="relative bg-transparent min-h-screen text-slate-900">
      <Hero />
      <Stats />
      <ServicesGrid />
      <LiveFundingDashboard />
      <BentoFeatures />
      <Process />
      <WhyChooseUs />
      <Testimonials />
      <FAQ />
      <CTASection />
      <LiveNotifications />
      <AIChatWidget />
    </main>
  );
}
EOF
echo "✅ page.tsx restored (Front page is back to Light Theme)."

echo "=========================================="
echo "🎉 HOME PAGE RESTORED SUCCESSFULLY!"
echo "Ab terminal me 'rm -rf .next' aur 'npm run dev' chala kar dekho."
echo "Baaki pages (About, Services, Funding) par naya premium design apply rahega."
echo "=========================================="