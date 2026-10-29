"use client";
import Link from "next/link";
import { useState, useEffect } from "react";
import { Menu, ChevronDown, MessageCircle, ArrowRight, X, Phone, ShieldCheck } from "lucide-react";
import { site, allServices } from "@/shared/config/site";
import { Button } from "@/components/ui/Button";
import { cn } from "@/shared/lib/utils";
import { motion, AnimatePresence } from "motion/react";

export function Header() {
  const [scrolled, setScrolled] = useState(false);
  const [openMega, setOpenMega] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);
  const [mobileServicesOpen, setMobileServicesOpen] = useState(false);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 10);
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  // Close mobile menu on resize
  useEffect(() => {
    const handleResize = () => { if (window.innerWidth >= 1024) setMobileOpen(false); };
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  // Lock body scroll & hide floating buttons when menu is open
  useEffect(() => {
    if (mobileOpen) {
      document.body.style.overflow = 'hidden';
      document.body.classList.add("mobile-menu-active");
    } else {
      document.body.style.overflow = 'auto';
      document.body.classList.remove("mobile-menu-active");
    }
    return () => {
      document.body.style.overflow = 'auto';
      document.body.classList.remove("mobile-menu-active");
    };
  }, [mobileOpen]);

  const openPopup = () => {
    setMobileOpen(false);
    setTimeout(() => window.dispatchEvent(new Event("open-eligibility-modal")), 300);
  };

  return (
    <header className={cn("sticky top-0 w-full transition-all duration-300 bg-white border-b border-slate-200", scrolled ? "py-2 shadow-md" : "py-3", mobileOpen ? "z-[999999]" : "z-50")}>
      <div className="container-page flex items-center justify-between text-brand-navy">
        
        {/* Logo */}
        <Link href="/" className="flex items-center shrink-0 z-50">
          <div className="relative h-10 w-32 md:h-12 md:w-44 flex items-center justify-start overflow-hidden">
             <img src="/logo.png" alt="PrimeWealth Advisory Logo" className="w-full h-full object-contain object-left" />
          </div>
        </Link>
        
        {/* Desktop Nav */}
        <nav className="hidden lg:flex items-center gap-2 text-sm font-bold text-brand-navy/80">
          <Link href="/" className="px-3 py-2 hover:text-brand-gold transition-colors">Home</Link>
          <Link href="/about" className="px-3 py-2 hover:text-brand-gold transition-colors">About Us</Link>
          <div className="relative" onMouseEnter={() => setOpenMega(true)} onMouseLeave={() => setOpenMega(false)}>
            <button className="flex items-center gap-1 px-3 py-2 hover:text-brand-gold transition-colors">Services <ChevronDown className={cn("h-4 w-4 transition-transform", openMega && "rotate-180")} /></button>
            <AnimatePresence>{openMega && <MegaMenu />}</AnimatePresence>
          </div>
          <Link href="/funding" className="px-3 py-2 hover:text-brand-gold transition-colors">Funding</Link>
          <Link href="/contact" className="px-3 py-2 hover:text-brand-gold transition-colors">Contact</Link>
        </nav>

        {/* Desktop Buttons */}
        <div className="hidden lg:flex items-center gap-3">
          <Button asChild className="bg-white border border-slate-200 text-brand-navy hover:bg-slate-50 rounded-full h-10 px-5 text-sm font-bold shadow-sm">
            <a href={site.whatsapp} target="_blank"><MessageCircle className="mr-2 h-4 w-4 text-[#25D366]"/> WhatsApp</a>
          </Button>
          <Button onClick={openPopup} className="bg-brand-navy hover:bg-brand-navy-light text-white rounded-full h-10 px-6 text-sm font-bold shadow-md">
            Check Eligibility <ArrowRight className="ml-2 h-4 w-4 text-brand-gold"/>
          </Button>
        </div>

        {/* Mobile Right Actions (Blinking WhatsApp + Menu) */}
        <div className="flex items-center gap-3 lg:hidden z-50 relative">
          {/* WhatsApp with Ping Animation */}
          <a 
            href={site.whatsapp} 
            target="_blank" 
            rel="noopener noreferrer" 
            className="relative flex items-center justify-center h-10 w-10 bg-[#25D366] rounded-full shadow-lg"
          >
            <span className="absolute inset-0 rounded-full bg-[#25D366] animate-ping opacity-75"></span>
            <MessageCircle className="h-5 w-5 text-white relative z-10" />
          </a>

          <button className="p-1 text-brand-navy" onClick={() => setMobileOpen(true)}>
            <Menu className="h-7 w-7" />
          </button>
        </div>
      </div>
      
      {/* PREMIUM MOBILE MENU */}
      <AnimatePresence>
        {mobileOpen && (
          <motion.div 
            initial={{ opacity: 0, x: "100%" }} 
            animate={{ opacity: 1, x: 0 }} 
            exit={{ opacity: 0, x: "100%" }} 
            transition={{ type: "spring", damping: 25, stiffness: 200 }}
            className="fixed inset-0 z-[99999] bg-[#0A192F] flex flex-col overflow-hidden"
          >
            <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10 pointer-events-none" />
            <div className="absolute top-0 right-0 w-64 h-64 bg-brand-gold/10 blur-[80px] rounded-full pointer-events-none" />
            <div className="absolute bottom-0 left-0 w-64 h-64 bg-blue-600/20 blur-[80px] rounded-full pointer-events-none" />

            <div className="flex items-center justify-between p-6 border-b border-white/10 relative z-10">
              <div className="h-10 w-32 bg-white rounded-lg p-1 flex items-center justify-center">
                 <img src="/logo.png" alt="Logo" className="w-full h-full object-contain" />
              </div>
              <button onClick={() => setMobileOpen(false)} className="p-2 bg-white/10 rounded-full text-white hover:bg-white/20 transition-colors">
                <X className="h-6 w-6" />
              </button>
            </div>

            <div className="flex-1 overflow-y-auto py-8 px-6 relative z-10 flex flex-col gap-2">
              {["Home", "About Us", "Funding", "Contact"].map((link, i) => (
                <motion.div key={link} initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.1 + i * 0.05 }}>
                  <Link 
                    href={link === "Home" ? "/" : `/${link.toLowerCase().replace(" ", "-")}`} 
                    onClick={() => setMobileOpen(false)}
                    className="flex items-center justify-between py-4 text-2xl font-extrabold text-white hover:text-brand-gold transition-colors border-b border-white/5 group"
                  >
                    {link}
                    <ArrowRight className="h-5 w-5 text-brand-gold opacity-0 group-hover:opacity-100 group-hover:translate-x-1 transition-all" />
                  </Link>
                </motion.div>
              ))}

              <motion.div initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.2 }} className="border-b border-white/5">
                <button onClick={() => setMobileServicesOpen(!mobileServicesOpen)} className="w-full flex items-center justify-between py-4 text-2xl font-extrabold text-white hover:text-brand-gold transition-colors">
                  Services
                  <ChevronDown className={cn("h-5 w-5 text-brand-gold transition-transform duration-300", mobileServicesOpen && "rotate-180")} />
                </button>
                
                <AnimatePresence>
                  {mobileServicesOpen && (
                    <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: "auto", opacity: 1 }} exit={{ height: 0, opacity: 0 }} className="overflow-hidden">
                      <div className="pb-4 flex flex-col gap-3 pl-4">
                         {["Company Registration", "Funding & Loans", "Certifications", "Compliance & Tax"].map((sub, i) => (
                            <Link key={i} href="/services" onClick={() => setMobileOpen(false)} className="text-slate-300 font-medium hover:text-brand-gold flex items-center gap-2">
                               <span className="w-1.5 h-1.5 rounded-full bg-brand-gold" /> {sub}
                            </Link>
                         ))}
                         <Link href="/services" onClick={() => setMobileOpen(false)} className="text-brand-gold text-sm font-bold mt-2 flex items-center gap-1">
                            View All Services <ArrowRight className="h-4 w-4" />
                         </Link>
                      </div>
                    </motion.div>
                  )}
                </AnimatePresence>
              </motion.div>
            </div>

            <div className="p-6 border-t border-white/10 relative z-10 bg-[#0A192F]/90 backdrop-blur-md">
              <div className="flex gap-3 mb-4">
                 <Button asChild className="flex-1 bg-green-500 hover:bg-green-600 text-white rounded-xl h-12 font-bold shadow-lg">
                   <a href={site.whatsapp} target="_blank"><MessageCircle className="mr-2 h-4 w-4" /> WhatsApp</a>
                 </Button>
                 <Button asChild className="flex-1 bg-white text-brand-navy hover:bg-slate-100 rounded-xl h-12 font-bold shadow-lg">
                   <a href={`tel:${site.phone}`}><Phone className="mr-2 h-4 w-4" /> Call Us</a>
                 </Button>
              </div>
              <Button onClick={openPopup} className="w-full h-14 rounded-xl bg-gradient-to-r from-brand-gold to-brand-gold-dark text-brand-navy font-extrabold text-lg shadow-[0_0_20px_rgba(212,175,55,0.3)] hover:scale-[1.02] transition-transform flex items-center justify-center gap-2">
                Check Eligibility <ShieldCheck className="h-5 w-5" />
              </Button>
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
  const col4 = [{ title: "PRABANDHIT", items: allServices.filter(s => s.category === "PRABANDHIT") }, { title: "DIGITAL", items: allServices.filter(s => s.category === "DIGITAL") }, {title: "VISTAR", items: allServices.filter(s => s.category === "VISTAR")}];

  return (
    <motion.div initial={{ opacity: 0, y: 15 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: 15 }} className="absolute left-1/2 top-full w-[min(1000px,calc(100vw-2rem))] -translate-x-1/2 pt-4">
      <div className="rounded-3xl border border-slate-200 bg-white p-8 shadow-2xl max-h-[80vh] overflow-y-auto custom-scrollbar">
        <div className="grid grid-cols-4 gap-8">
          {[col1, col2, col3, col4].map((column, idx) => (
            <div key={idx} className="space-y-8">
              {column.map((group) => (
                <div key={group.title}>
                  <h4 className="text-xs font-bold text-brand-gold mb-3 uppercase tracking-widest flex items-center gap-2"><span className="w-1.5 h-1.5 rounded-full bg-brand-gold" /> {group.title}</h4>
                  <ul className="space-y-2">
                    {group.items.map((item: any) => (
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
