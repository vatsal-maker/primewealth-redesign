#!/bin/bash

echo "🖼️ Removing Text & Making Logo Bigger..."

# ==========================================
# 1. Update Header.tsx (Remove Text, Bigger Logo)
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
    <header className={cn("sticky top-0 z-50 w-full transition-all duration-300 bg-white border-b border-slate-200", scrolled ? "py-2 shadow-md" : "py-3")}>
      <div className="container-page flex items-center justify-between text-brand-navy">
        
        {/* ONLY LOGO - SIZE INCREASED */}
        <Link href="/" className="flex items-center shrink-0">
          <div className="relative h-14 w-36 md:h-16 md:w-48 flex items-center justify-start overflow-hidden">
             <img 
               src="/logo.png" 
               alt="PrimeWealth Advisory Logo" 
               className="w-full h-full object-contain object-left" 
             />
          </div>
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
echo "✅ Header.tsx updated (Text removed, Logo bigger)."

# ==========================================
# 2. Update Footer.tsx (Remove Text, Bigger Logo)
# ==========================================
cat << 'EOF' > src/components/layout/Footer.tsx
import Link from "next/link";
import { site, allServices } from "@/shared/config/site";
import { ArrowRight, Mail, Phone, MapPin } from "lucide-react";

export function Footer() {
  return (
    <footer className="bg-brand-navy pt-20 border-t border-white/10 relative z-10">
      <div className="container-page grid md:grid-cols-2 lg:grid-cols-5 gap-12 pb-16">
        <div className="lg:col-span-2">
          
          {/* ONLY LOGO - SIZE INCREASED */}
          <Link href="/" className="flex items-center mb-8 w-fit bg-white rounded-xl p-2">
            <div className="relative h-16 w-44 md:h-20 md:w-56 flex items-center justify-start">
              <img src="/logo.png" alt="PrimeWealth Advisory" className="w-full h-full object-contain object-left" />
            </div>
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
echo "✅ Footer.tsx updated (Text removed, Logo bigger)."

echo "=========================================="
echo "🎉 TEXT REMOVED & LOGO SIZE INCREASED!"
echo "Ab terminal me 'rm -rf .next' aur 'npm run dev' chala kar dekho."
echo "=========================================="