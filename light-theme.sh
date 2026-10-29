#!/bin/bash

echo "🎨 Applying Light Theme & New Hero Section..."

# ==========================================
# 1. UPDATE globals.css
# ==========================================
cat << 'EOF' > src/app/globals.css
@import "tailwindcss";

@theme {
  /* Naye Light Theme Colors */
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
  /* Light Theme Base */
  body { font-family: var(--font-sans); background-color: var(--color-surface); color: var(--color-foreground); overflow-x: hidden; }
  ::selection { background: var(--color-brand-blue); color: white; }
}

@utility container-page { width: 100%; max-width: 1280px; margin-inline: auto; padding-inline: 1.5rem; }

/* Custom Animations */
@keyframes marquee-slow {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}
.animate-marquee-slow { animation: marquee-slow 30s linear infinite; }

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}
.animate-float { animation: float 4s ease-in-out infinite; }

/* Background Grid Pattern */
.bg-grid-pattern {
  background-size: 40px 40px;
  background-image: linear-gradient(to right, rgba(0, 0, 0, 0.03) 1px, transparent 1px),
                    linear-gradient(to bottom, rgba(0, 0, 0, 0.03) 1px, transparent 1px);
}

/* Text Gradient */
.text-gradient-blue {
  background: linear-gradient(to right, #2563eb, #3b82f6);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}
EOF

echo "✅ globals.css updated."

# ==========================================
# 2. UPDATE Header.tsx
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
  const [mobileOpen, setMobileOpen] = useState(false);

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
          <Button asChild className="bg-blue-600 hover:bg-blue-700 text-white rounded-full h-10 px-6 text-sm font-bold shadow-md shadow-blue-500/20">
            <Link href="/contact">Check Eligibility <ArrowRight className="ml-2 h-4 w-4"/></Link>
          </Button>
        </div>
        <button className="lg:hidden p-2" onClick={() => setMobileOpen(true)}><Menu className="h-6 w-6" /></button>
      </div>
    </header>
  );
}
EOF

echo "✅ Header.tsx updated."

# ==========================================
# 3. UPDATE Hero.tsx
# ==========================================
cat << 'EOF' > src/components/home/Hero.tsx
"use client";
import Link from "next/link";
import { motion } from "motion/react";
import { ArrowRight, MessageCircle, Sparkles, CheckCircle2, User, Bot } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function Hero() {
  return (
    <section className="relative min-h-[90vh] flex items-center bg-[#F8FAFC] overflow-hidden pt-20 pb-20">
      {/* 1. Background Moving Text (Watermark) */}
      <div className="absolute inset-0 flex items-center justify-center opacity-[0.03] pointer-events-none select-none overflow-hidden">
        <div className="flex whitespace-nowrap animate-marquee-slow text-[200px] font-extrabold text-slate-900 tracking-tighter">
          <span>PRIMEWEALTH ADVISORY</span>
          <span>PRIMEWEALTH ADVISORY</span>
        </div>
      </div>

      {/* 2. Background Grid Pattern */}
      <div className="absolute inset-0 bg-grid-pattern opacity-60 pointer-events-none" />

      <div className="container-page relative z-10 grid lg:grid-cols-2 gap-16 items-center">
        
        {/* Left Side: Text & Buttons */}
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ duration: 0.6 }} className="flex flex-col justify-center">
          
          <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white border border-slate-200 text-xs font-bold text-slate-600 mb-8 w-fit shadow-sm">
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

          <div className="flex items-center gap-3 bg-white border border-slate-200 p-3 pr-5 rounded-2xl w-fit shadow-sm">
            <div className="h-10 w-10 bg-blue-50 rounded-xl flex items-center justify-center text-blue-600">
              <CheckCircle2 className="h-5 w-5" />
            </div>
            <div>
              <p className="text-xs font-bold text-blue-600 uppercase tracking-wider">Startup India</p>
              <p className="text-sm font-bold text-slate-800">DPIIT + Tax Exemption</p>
            </div>
          </div>
        </motion.div>

        {/* Right Side: Chat & 3D Illustration Area */}
        <div className="relative h-[500px] hidden lg:flex items-center justify-center">
          
          <div className="relative w-full max-w-[500px] h-full bg-slate-100 rounded-[3rem] border border-slate-200 overflow-hidden shadow-2xl flex items-center justify-center">
            <img 
              src="https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=800&auto=format&fit=crop" 
              alt="Consultation"
              className="object-cover w-full h-full opacity-90"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-slate-900/40 to-transparent" />
          </div>

          <motion.div 
            animate={{ y: [0, -10, 0] }} transition={{ repeat: Infinity, duration: 4, ease: "easeInOut" }}
            className="absolute top-10 -left-6 bg-white px-5 py-3 rounded-2xl rounded-bl-none shadow-xl border border-slate-100 z-20 flex items-center gap-3"
          >
            <div className="bg-slate-100 p-2 rounded-full"><User className="h-4 w-4 text-slate-600" /></div>
            <p className="text-sm font-bold text-slate-800">Need DPIIT + funding.</p>
          </motion.div>

          <motion.div 
            animate={{ y: [0, 10, 0] }} transition={{ repeat: Infinity, duration: 5, ease: "easeInOut", delay: 1 }}
            className="absolute bottom-20 -right-6 bg-blue-600 text-white px-5 py-3 rounded-2xl rounded-br-none shadow-xl border border-blue-500 z-20 flex items-center gap-3"
          >
            <div className="bg-blue-500 p-2 rounded-full"><Bot className="h-4 w-4 text-white" /></div>
            <p className="text-sm font-bold">Are you registered yet?</p>
          </motion.div>

          <motion.div 
            animate={{ y: [0, -8, 0] }} transition={{ repeat: Infinity, duration: 3.5, ease: "easeInOut", delay: 0.5 }}
            className="absolute top-1/2 -right-4 bg-[#D4AF37] text-slate-900 px-4 py-2 rounded-full shadow-lg z-20 flex items-center gap-2 font-bold text-sm"
          >
            <CheckCircle2 className="h-4 w-4" /> Free eligibility first.
          </motion.div>
        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ Hero.tsx updated."

echo "=========================================="
echo "🎉 LIGHT THEME APPLIED SUCCESSFULLY!"
echo "Ab terminal me 'npm run dev' chala kar dekho."
echo "=========================================="