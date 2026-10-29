#!/bin/bash

echo "🛠️ Fixing Mega Menu & Header to Light Theme..."

cat << 'EOF' > src/components/layout/Header.tsx
"use client";
import Link from "next/link";
import { useState, useEffect } from "react";
import { Menu, ChevronDown, MessageCircle, ArrowRight, X } from "lucide-react";
import { site, allServices, serviceCategories } from "@/shared/config/site";
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
      <div className="container-page flex items-center justify-between text-slate-900">
        
        {/* Logo Area - Aap yahan apna logo image laga sakte hain */}
        <Link href="/" className="flex items-center gap-2 font-bold text-xl">
          <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-blue-600 text-white shadow-md">PW</div>
          <span className="hidden sm:inline tracking-tight font-extrabold text-slate-900">PrimeWealth</span>
        </Link>
        
        {/* Desktop Nav */}
        <nav className="hidden lg:flex items-center gap-2 text-sm font-semibold text-slate-700">
          <Link href="/" className="px-3 py-2 hover:text-blue-600 transition-colors">Home</Link>
          <Link href="/about" className="px-3 py-2 hover:text-blue-600 transition-colors">About Us</Link>
          
          {/* Mega Menu Trigger */}
          <div className="relative" onMouseEnter={() => setOpenMega(true)} onMouseLeave={() => setOpenMega(false)}>
            <button className="flex items-center gap-1 px-3 py-2 hover:text-blue-600 transition-colors">
              Services <ChevronDown className={cn("h-4 w-4 transition-transform duration-300", openMega && "rotate-180")} />
            </button>
            <AnimatePresence>{openMega && <MegaMenu />}</AnimatePresence>
          </div>
          
          <Link href="/funding" className="px-3 py-2 hover:text-blue-600 transition-colors">Funding</Link>
          <Link href="/blog" className="px-3 py-2 hover:text-blue-600 transition-colors">Blog</Link>
          <Link href="/contact" className="px-3 py-2 hover:text-blue-600 transition-colors">Contact</Link>
        </nav>

        {/* Buttons */}
        <div className="hidden lg:flex items-center gap-3">
          <Button asChild className="bg-green-500 hover:bg-green-600 text-white rounded-full h-10 px-5 text-sm font-bold shadow-sm">
            <a href={site.whatsapp} target="_blank"><MessageCircle className="mr-2 h-4 w-4"/> WhatsApp</a>
          </Button>
          <Button asChild className="bg-blue-600 hover:bg-blue-700 text-white rounded-full h-10 px-6 text-sm font-bold shadow-md shadow-blue-500/20">
            <Link href="/contact">Get Started <ArrowRight className="ml-2 h-4 w-4"/></Link>
          </Button>
        </div>

        <button className="lg:hidden p-2 text-slate-900" onClick={() => setMobileOpen(true)}><Menu className="h-6 w-6" /></button>
      </div>

      {/* Mobile Menu */}
      <AnimatePresence>
        {mobileOpen && (
          <motion.div initial={{ x: "100%" }} animate={{ x: 0 }} exit={{ x: "100%" }} className="fixed inset-y-0 right-0 w-[80%] max-w-sm bg-white shadow-2xl p-6 z-[100] border-l border-slate-200 overflow-y-auto">
            <button onClick={() => setMobileOpen(false)} className="mb-8 font-bold text-slate-900 flex items-center gap-2"><X className="h-5 w-5" /> Close</button>
            <div className="flex flex-col gap-4 text-slate-900">
              {["Home", "About", "Services", "Funding", "Blog", "Contact"].map(i => (
                <Link key={i} href={i==="Home"?"/":`/${i.toLowerCase()}`} onClick={() => setMobileOpen(false)} className="text-lg font-medium hover:text-blue-600">{i}</Link>
              ))}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
}

// --- THE FIXED MEGA MENU ---
function MegaMenu() {
  const col1 = [
    { title: "AARAMBH", items: allServices.filter(s => s.category === "AARAMBH") },
    { title: "KAVACH", items: allServices.filter(s => s.category === "KAVACH") }
  ];
  const col2 = [
    { title: "PRAMANIT", items: allServices.filter(s => s.category === "PRAMANIT") }
  ];
  const col3 = [
    { title: "NIDHI", items: allServices.filter(s => s.category === "NIDHI") },
    { title: "VIKAS", items: allServices.filter(s => s.category === "VIKAS") }
  ];
  const col4 = [
    { title: "PRABANDHIT", items: allServices.filter(s => s.category === "PRABANDHIT") },
    { title: "DIGITAL", items: allServices.filter(s => s.category === "DIGITAL") }
  ];

  return (
    <motion.div 
      initial={{ opacity: 0, y: 15, scale: 0.98 }}
      animate={{ opacity: 1, y: 0, scale: 1 }}
      exit={{ opacity: 0, y: 15, scale: 0.98 }}
      transition={{ duration: 0.2, ease: "easeOut" }}
      className="absolute left-1/2 top-full w-[min(1000px,calc(100vw-2rem))] -translate-x-1/2 pt-4"
    >
      {/* White Background & Shadow for Mega Menu */}
      <div className="rounded-3xl border border-slate-200 bg-white p-8 shadow-[0_20px_50px_rgba(0,0,0,0.1)] relative overflow-hidden">
        
        <div className="grid grid-cols-4 gap-8 relative z-10">
          {[col1, col2, col3, col4].map((column, idx) => (
            <div key={idx} className="space-y-8">
              {column.map((group) => (
                <div key={group.title}>
                  {/* Heading Blue Color */}
                  <h4 className="text-xs font-bold text-blue-600 mb-3 uppercase tracking-widest flex items-center gap-2">
                    <span className="w-1.5 h-1.5 rounded-full bg-blue-600" /> {group.title}
                  </h4>
                  <ul className="space-y-2">
                    {group.items.map((item) => (
                      <li key={item.slug}>
                        <Link 
                          href={`/services/${item.slug}`} 
                          className="text-sm text-slate-600 hover:text-blue-600 transition-all flex items-center group"
                        >
                          <span className="w-0 overflow-hidden group-hover:w-4 transition-all duration-300 flex items-center text-blue-600">
                            <ArrowRight className="h-3 w-3" />
                          </span>
                          {item.name}
                        </Link>
                      </li>
                    ))}
                  </ul>
                </div>
              ))}
            </div>
          ))}
        </div>

        {/* Bottom CTA */}
        <div className="mt-8 pt-6 border-t border-slate-100 flex items-center justify-between relative z-10">
          <p className="text-sm text-slate-500">Need help choosing the right service?</p>
          <Button asChild className="bg-blue-50 text-blue-600 hover:bg-blue-600 hover:text-white rounded-full h-10 px-6 transition-all">
            <Link href="/contact">Talk to an Expert</Link>
          </Button>
        </div>
      </div>
    </motion.div>
  );
}
EOF

echo "✅ Header & Mega Menu Fixed!"
echo "=========================================="
echo "⚠️ IMPORTANT: Browser ka purana cache hatane ke liye ye chalayein:"
echo "rm -rf .next"
echo "Aur phir 'npm run dev' chala kar dekhein."