#!/bin/bash

echo "👑 Applying Navy & Gold Premium Theme with Custom Logo..."

# ==========================================
# 1. Update globals.css (Navy & Gold Colors)
# ==========================================
cat << 'EOF' > src/app/globals.css
@import "tailwindcss";

@theme {
  /* Logo Colors */
  --color-brand-navy: #0A192F;       
  --color-brand-navy-light: #112240; 
  --color-brand-gold: #D4AF37;       
  --color-brand-gold-light: #F3E5AB; 
  --color-brand-gold-dark: #B8860B;  
  
  --font-sans: "Inter", ui-sans-serif, system-ui, sans-serif;
}

@layer base {
  * { border-color: rgba(212, 175, 55, 0.15); }
  html { scroll-behavior: smooth; -webkit-font-smoothing: antialiased; }
  body { font-family: var(--font-sans); background-color: #FAFAFA; color: #0f172a; overflow-x: hidden; }
  ::selection { background: var(--color-brand-gold); color: var(--color-brand-navy); }
}

@utility container-page { width: 100%; max-width: 1280px; margin-inline: auto; padding-inline: 1.5rem; }

/* --- ANIMATIONS --- */
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

/* Text Gradient (Gold) */
.text-gradient-gold {
  background: linear-gradient(to right, #F3E5AB, #D4AF37, #B8860B);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
EOF
echo "✅ globals.css updated."

# ==========================================
# 2. Update Header.tsx (Adding Logo Image)
# ==========================================
cat << 'EOF' > src/components/layout/Header.tsx
"use client";
import Link from "next/link";
import { useState, useEffect } from "react";
import { Menu, ChevronDown, MessageCircle, ArrowRight, X } from "lucide-react";
import { site, allServices } from "@/shared/config/site";
import { Button } from "@/components/ui/Button";
import { cn } from "@/shared/lib/utils";
import { motion, AnimatePresence } from "motion/react";

export function Header() {
  const [scrolled, setScrolled] = useState(false);
  const [openMega, setOpenMega] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 10);
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  return (
    <header className={cn("sticky top-0 z-50 w-full transition-all duration-300 bg-white border-b border-slate-200", scrolled ? "py-3 shadow-md" : "py-4")}>
      <div className="container-page flex items-center justify-between text-brand-navy">
        
        {/* LOGO IMAGE */}
        <Link href="/" className="flex items-center gap-3">
          <img src="/logo.png" alt="PrimeWealth Advisory Logo" className="h-10 w-auto object-contain" />
        </Link>
        
        <nav className="hidden lg:flex items-center gap-2 text-sm font-bold text-brand-navy/80">
          <Link href="/" className="px-3 py-2 hover:text-brand-gold transition-colors">Home</Link>
          <Link href="/about" className="px-3 py-2 hover:text-brand-gold transition-colors">About</Link>
          <div className="relative" onMouseEnter={() => setOpenMega(true)} onMouseLeave={() => setOpenMega(false)}>
            <button className="flex items-center gap-1 px-3 py-2 hover:text-brand-gold transition-colors">Services <ChevronDown className={cn("h-4 w-4 transition-transform", openMega && "rotate-180")} /></button>
            <AnimatePresence>{openMega && <MegaMenu />}</AnimatePresence>
          </div>
          <Link href="/funding" className="px-3 py-2 hover:text-brand-gold transition-colors">Funding</Link>
          <Link href="/contact" className="px-3 py-2 hover:text-brand-gold transition-colors">Contact</Link>
        </nav>

        <div className="hidden lg:flex items-center gap-3">
          <Button asChild className="bg-brand-navy hover:bg-brand-navy-light text-white rounded-full h-10 px-5 text-sm font-bold shadow-md">
            <a href={site.whatsapp} target="_blank"><MessageCircle className="mr-2 h-4 w-4 text-brand-gold"/> WhatsApp</a>
          </Button>
          <Button asChild className="bg-brand-gold hover:bg-brand-gold-dark text-brand-navy rounded-full h-10 px-6 text-sm font-bold shadow-lg">
            <Link href="/contact">Get Started <ArrowRight className="ml-2 h-4 w-4"/></Link>
          </Button>
        </div>
        <button className="lg:hidden p-2" onClick={() => setMobileOpen(true)}><Menu className="h-6 w-6" /></button>
      </div>
      
      {/* Mobile Menu (Simplified for brevity) */}
      <AnimatePresence>
        {mobileOpen && (
          <motion.div initial={{ x: "100%" }} animate={{ x: 0 }} exit={{ x: "100%" }} className="fixed inset-y-0 right-0 w-[80%] max-w-sm bg-white shadow-2xl p-6 z-[100] border-l border-slate-200">
            <button onClick={() => setMobileOpen(false)} className="mb-8 font-bold text-brand-navy flex items-center gap-2"><X className="h-5 w-5" /> Close</button>
            <div className="flex flex-col gap-4 text-brand-navy">
              {["Home", "About", "Services", "Funding", "Contact"].map(i => (
                <Link key={i} href={i==="Home"?"/":`/${i.toLowerCase()}`} onClick={() => setMobileOpen(false)} className="text-lg font-bold hover:text-brand-gold">{i}</Link>
              ))}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
}

function MegaMenu() {
  const col1 = [{ title: "AARAMBH", items: allServices.filter(s => s.category === "AARAMBH") }, { title: "KAVACH", items: allServices.filter(s => s.category === "KAVACH") }];
  const col2 = [{ title: "PRAMANIT", items: allServices.filter(s => s.category === "PRAMANIT") }];
  const col3 = [{ title: "NIDHI", items: allServices.filter(s => s.category === "NIDHI") }, { title: "VIKAS", items: allServices.filter(s => s.category === "VIKAS") }];
  const col4 = [{ title: "PRABANDHIT", items: allServices.filter(s => s.category === "PRABANDHIT") }, { title: "DIGITAL", items: allServices.filter(s => s.category === "DIGITAL") }];

  return (
    <motion.div initial={{ opacity: 0, y: 15 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: 15 }} className="absolute left-1/2 top-full w-[min(1000px,calc(100vw-2rem))] -translate-x-1/2 pt-4">
      <div className="rounded-3xl border border-slate-200 bg-white p-8 shadow-2xl">
        <div className="grid grid-cols-4 gap-8">
          {[col1, col2, col3, col4].map((column, idx) => (
            <div key={idx} className="space-y-8">
              {column.map((group) => (
                <div key={group.title}>
                  <h4 className="text-xs font-bold text-brand-gold mb-3 uppercase tracking-widest flex items-center gap-2"><span className="w-1.5 h-1.5 rounded-full bg-brand-gold" /> {group.title}</h4>
                  <ul className="space-y-2">
                    {group.items.map((item) => (
                      <li key={item.slug}><Link href={`/services/${item.slug}`} className="text-sm font-medium text-slate-600 hover:text-brand-gold transition-all flex items-center group"><span className="w-0 overflow-hidden group-hover:w-4 transition-all duration-300 flex items-center text-brand-gold"><ArrowRight className="h-3 w-3" /></span>{item.name}</Link></li>
                    ))}
                  </ul>
                </div>
              ))}
            </div>
          ))}
        </div>
      </div>
    </motion.div>
  );
}
EOF
echo "✅ Header.tsx updated with Logo."

# ==========================================
# 3. Update Hero.tsx (Exact Text + Navy/Gold)
# ==========================================
cat << 'EOF' > src/components/home/Hero.tsx
"use client";
import Link from "next/link";
import { motion } from "motion/react";
import { ArrowRight, MessageCircle, ShieldCheck, CheckCircle2, User, Bot } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function Hero() {
  return (
    <section className="relative min-h-[95vh] flex items-center bg-brand-navy overflow-hidden pt-20 pb-20">
      
      {/* Background Glow */}
      <div className="absolute top-0 left-1/4 w-[800px] h-[800px] bg-brand-gold/5 rounded-full blur-[150px] mix-blend-screen pointer-events-none" />
      
      <div className="container-page relative z-10 grid lg:grid-cols-2 gap-16 items-center">
        
        {/* Left Side: Text Content */}
        <motion.div initial="hidden" animate="visible" variants={{ hidden: { opacity: 0 }, visible: { opacity: 1, transition: { staggerChildren: 0.15 } } }} className="flex flex-col justify-center text-center lg:text-left">
          
          {/* Top Badge */}
          <motion.div variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-white/5 border border-white/10 text-sm font-bold text-brand-gold mb-8 w-fit mx-auto lg:mx-0 backdrop-blur-md shadow-sm">
            <span className="text-xl">🇮🇳</span> Trusted by 1000+ Businesses Across India
          </motion.div>

          {/* Subheading */}
          <motion.p variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="text-xl sm:text-2xl font-bold text-slate-300 mb-2 tracking-wide">
            Buland Sapno Ke Saath
          </motion.p>

          {/* Main Heading */}
          <motion.h1 variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="text-6xl sm:text-7xl lg:text-[5.5rem] font-extrabold tracking-tight leading-[1.05] mb-4 text-white">
            PrimeWealth <br />
            <span className="text-gradient-gold">Advisory</span>
          </motion.h1>

          {/* Hindi Tagline & Multilingual */}
          <motion.div variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="flex flex-col sm:flex-row items-center justify-center lg:justify-start gap-4 mb-6">
            <h2 className="text-2xl sm:text-3xl font-extrabold text-white">आपकी सफलता, हमारी ज़िम्मेदारी</h2>
            <div className="h-6 w-px bg-white/20 hidden sm:block"></div>
            <p className="text-sm font-bold text-brand-gold tracking-widest">प्राइमवेल्थ | પ્રાઇમવેલ્થ</p>
          </motion.div>

          {/* Description */}
          <motion.p variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="text-lg text-slate-400 mb-8 max-w-lg mx-auto lg:mx-0 leading-relaxed">
            From Registration to Investor Pitch — We Power Every Stage of Your Business Journey.
          </motion.p>

          {/* Action Buttons */}
          <motion.div variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="flex flex-col sm:flex-row justify-center lg:justify-start gap-4 mb-10">
            <Button asChild size="lg" className="h-14 px-8 text-lg rounded-full bg-brand-gold hover:bg-brand-gold-dark text-brand-navy font-bold transition-all shadow-[0_0_30px_rgba(212,175,55,0.3)] hover:-translate-y-1">
              <Link href="/contact">Check My Eligibility <ArrowRight className="ml-2 h-5 w-5" /></Link>
            </Button>
            <Button asChild size="lg" className="h-14 px-8 text-lg rounded-full bg-white/5 border border-white/10 text-white hover:bg-white/10 font-bold backdrop-blur-md transition-all">
              <a href="https://wa.me/919876543210" target="_blank"><MessageCircle className="mr-2 h-5 w-5 text-[#25D366]" /> WhatsApp Us</a>
            </Button>
          </motion.div>

          {/* Trust Badge Bottom */}
          <motion.div variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="flex items-center gap-3 bg-white/5 border border-white/10 p-3 pr-6 rounded-2xl w-fit mx-auto lg:mx-0 backdrop-blur-sm shadow-sm">
            <div className="h-10 w-10 bg-brand-gold/10 rounded-xl flex items-center justify-center text-brand-gold">
              <CheckCircle2 className="h-5 w-5" />
            </div>
            <div className="text-left">
              <p className="text-[10px] font-bold text-brand-gold uppercase tracking-widest">Startup India</p>
              <p className="text-sm font-extrabold text-white">DPIIT + Tax Exemption</p>
            </div>
          </motion.div>
        </motion.div>

        {/* Right Side: Image & Floating Chat Bubbles */}
        <div className="relative h-[550px] hidden lg:flex items-center justify-center">
          <motion.div initial={{ opacity: 0, scale: 0.95 }} animate={{ opacity: 1, scale: 1 }} transition={{ duration: 0.8, delay: 0.3 }} className="relative w-full max-w-[500px] h-full bg-brand-navy-light rounded-[3rem] border border-white/10 overflow-hidden shadow-2xl flex items-center justify-center">
            <img src="https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=800&auto=format&fit=crop" alt="Business Consultation" className="object-cover w-full h-full opacity-90" />
            <div className="absolute inset-0 bg-gradient-to-t from-brand-navy to-transparent opacity-60" />
          </motion.div>

          <motion.div initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.8 }} className="absolute top-12 -left-8 z-20">
            <motion.div animate={{ y: [0, -10, 0] }} transition={{ repeat: Infinity, duration: 4, ease: "easeInOut" }} className="bg-white px-5 py-3 rounded-2xl rounded-bl-none shadow-2xl border border-slate-100 flex items-center gap-3">
              <div className="bg-slate-100 p-2 rounded-full"><User className="h-4 w-4 text-brand-navy" /></div>
              <p className="text-sm font-bold text-brand-navy">Need DPIIT + funding.</p>
            </motion.div>
          </motion.div>

          <motion.div initial={{ opacity: 0, x: 30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 1 }} className="absolute bottom-24 -right-8 z-20">
            <motion.div animate={{ y: [0, 10, 0] }} transition={{ repeat: Infinity, duration: 5, ease: "easeInOut", delay: 1 }} className="bg-brand-gold text-brand-navy px-5 py-3 rounded-2xl rounded-br-none shadow-[0_15px_40px_rgba(212,175,55,0.3)] border border-brand-gold-light flex items-center gap-3">
              <div className="bg-brand-gold-light p-2 rounded-full"><Bot className="h-4 w-4 text-brand-navy" /></div>
              <p className="text-sm font-bold">Are you registered yet?</p>
            </motion.div>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
EOF
echo "✅ Hero.tsx updated."

# ==========================================
# 4. Update Footer.tsx (Navy Theme + Logo)
# ==========================================
cat << 'EOF' > src/components/layout/Footer.tsx
import Link from "next/link";
import { site, allServices } from "@/shared/config/site";
import { ArrowRight, Mail, Phone, MapPin } from "lucide-react";

export function Footer() {
  return (
    <footer className="bg-brand-navy pt-20 border-t border-white/10">
      <div className="container-page grid md:grid-cols-2 lg:grid-cols-5 gap-12 pb-16">
        <div className="lg:col-span-2">
          <Link href="/" className="flex items-center gap-3 mb-6">
            <img src="/logo.png" alt="PrimeWealth Advisory" className="h-12 w-auto bg-white rounded-lg p-1" />
          </Link>
          <p className="text-sm text-slate-400 mb-8 leading-relaxed max-w-sm">Empowering Indian founders with end-to-end business setup, funding, and compliance solutions.</p>
          <div className="space-y-4 text-sm text-slate-300">
            <p className="flex items-start gap-3"><MapPin className="h-5 w-5 text-brand-gold shrink-0" /> {site.address}</p>
            <p className="flex items-center gap-3"><Phone className="h-4 w-4 text-brand-gold" /> {site.phone}</p>
            <p className="flex items-center gap-3"><Mail className="h-4 w-4 text-brand-gold" /> {site.email}</p>
          </div>
        </div>
        <div>
          <h4 className="text-white font-bold mb-6">Services</h4>
          <ul className="space-y-3 text-sm">
            {allServices.slice(0, 6).map((s) => (
              <li key={s.slug}><Link href={`/services/${s.slug}`} className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> {s.name}</Link></li>
            ))}
          </ul>
        </div>
        <div>
          <h4 className="text-white font-bold mb-6">Company</h4>
          <ul className="space-y-3 text-sm">
            {["About", "Funding", "Blog", "Contact", "Privacy Policy", "Terms of Service"].map((item) => (
              <li key={item}><Link href={`/${item.toLowerCase().replace(" ", "-")}`} className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> {item}</Link></li>
            ))}
          </ul>
        </div>
      </div>
      <div className="border-t border-white/10 py-6 bg-[#050B14]">
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
# 5. Update Button.tsx (Gold & Navy Variants)
# ==========================================
cat << 'EOF' > src/components/ui/Button.tsx
import { cva, type VariantProps } from "class-variance-authority";
import { Slot } from "@radix-ui/react-slot";
import { forwardRef } from "react";
import { cn } from "@/shared/lib/utils";

const buttonVariants = cva(
  "inline-flex items-center justify-center gap-2 rounded-md font-medium transition-all duration-200 focus-visible:outline-none disabled:opacity-50",
  {
    variants: {
      variant: {
        primary: "bg-brand-navy text-white hover:bg-brand-navy-light shadow-sm",
        gold: "bg-brand-gold text-brand-navy hover:bg-brand-gold-dark shadow-lg",
        secondary: "bg-white text-brand-navy border border-slate-200 hover:bg-slate-50",
        ghost: "text-slate-600 hover:text-brand-gold hover:bg-slate-50",
        whatsapp: "bg-[#25D366] text-white hover:bg-[#1eb857]",
      },
      size: { sm: "h-9 px-3 text-sm", md: "h-11 px-5 text-sm", lg: "h-12 px-6 text-base", icon: "h-10 w-10" },
    },
    defaultVariants: { variant: "gold", size: "md" },
  }
);

export interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement>, VariantProps<typeof buttonVariants> { asChild?: boolean; }

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, asChild = false, ...props }, ref) => {
    const Comp = asChild ? Slot : "button";
    return <Comp ref={ref} className={cn(buttonVariants({ variant, size }), className)} {...props} />;
  }
);
Button.displayName = "Button";
EOF
echo "✅ Button.tsx updated."

# ==========================================
# 6. Update ServicesGrid (Gold Accents)
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
          <motion.p initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-4">SERVICES</motion.p>
          <motion.h2 initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.1 }} className="text-4xl md:text-5xl font-extrabold text-brand-navy tracking-tight">
            Business Solutions for <span className="text-gradient-gold">Startups & MSMEs</span>
          </motion.h2>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {serviceCategories.map((g, i) => (
            <motion.div key={g.code} initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: i * 0.05 }}>
              <Link href="/services">
                <div className="h-full bg-white border border-slate-200 p-8 rounded-[2rem] group cursor-pointer hover:border-brand-gold/50 hover:shadow-xl transition-all duration-300">
                  <h3 className="text-xl font-bold text-brand-navy mb-4 group-hover:text-brand-gold transition-colors">{g.code}</h3>
                  <p className="text-sm text-slate-500 leading-relaxed mb-8">{g.desc}</p>
                  <div className="flex items-center text-xs font-bold text-brand-gold uppercase tracking-wider">
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
echo "✅ ServicesGrid updated."

echo "=========================================="
echo "🎉 NAVY & GOLD THEME APPLIED SUCCESSFULLY!"
echo "⚠️ IMPORTANT: Apna logo 'logo.png' naam se public folder me save karna mat bhoolna."
echo "Ab terminal me 'rm -rf .next' aur 'npm run dev' chala kar dekho."
echo "=========================================="