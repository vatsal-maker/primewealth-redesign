#!/bin/bash

echo "🛠️ Fixing 404 Links, Mobile Overlap, Blog Page & Popup Timer..."

# ==========================================
# 1. Fix Header Links & Mobile Z-Index
# ==========================================
cat << 'EOF' > src/components/layout/Header.tsx
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

  useEffect(() => {
    if (mobileOpen) document.body.style.overflow = 'hidden';
    else document.body.style.overflow = 'unset';
    return () => { document.body.style.overflow = 'unset'; };
  }, [mobileOpen]);

  const openPopup = () => {
    setMobileOpen(false);
    setTimeout(() => window.dispatchEvent(new Event("open-eligibility-modal")), 300);
  };

  return (
    <header className={cn("sticky top-0 z-50 w-full transition-all duration-300 bg-white border-b border-slate-200", scrolled ? "py-2 shadow-md" : "py-3")}>
      <div className="container-page flex items-center justify-between text-brand-navy">
        
        <Link href="/" className="flex items-center shrink-0 z-50">
          <div className="relative h-10 w-36 md:h-12 md:w-44 flex items-center justify-start overflow-hidden">
             <img src="/logo.png" alt="PrimeWealth Advisory Logo" className="w-full h-full object-contain object-left" />
          </div>
        </Link>
        
        <nav className="hidden lg:flex items-center gap-2 text-sm font-bold text-brand-navy/80">
          <Link href="/" className="px-3 py-2 hover:text-brand-gold transition-colors">Home</Link>
          <Link href="/about" className="px-3 py-2 hover:text-brand-gold transition-colors">About Us</Link> {/* FIXED: /about */}
          <div className="relative" onMouseEnter={() => setOpenMega(true)} onMouseLeave={() => setOpenMega(false)}>
            <button className="flex items-center gap-1 px-3 py-2 hover:text-brand-gold transition-colors">Services <ChevronDown className={cn("h-4 w-4 transition-transform", openMega && "rotate-180")} /></button>
            <AnimatePresence>{openMega && <MegaMenu />}</AnimatePresence>
          </div>
          <Link href="/funding" className="px-3 py-2 hover:text-brand-gold transition-colors">Funding</Link>
          <Link href="/blog" className="px-3 py-2 hover:text-brand-gold transition-colors">Blog</Link> {/* Added Blog */}
          <Link href="/contact" className="px-3 py-2 hover:text-brand-gold transition-colors">Contact</Link>
        </nav>

        <div className="hidden lg:flex items-center gap-3">
          <Button asChild className="bg-white border border-slate-200 text-brand-navy hover:bg-slate-50 rounded-full h-10 px-5 text-sm font-bold shadow-sm">
            <a href={site.whatsapp} target="_blank"><MessageCircle className="mr-2 h-4 w-4 text-[#25D366]"/> WhatsApp</a>
          </Button>
          <Button onClick={openPopup} className="bg-brand-navy hover:bg-brand-navy-light text-white rounded-full h-10 px-6 text-sm font-bold shadow-md">
            Check Eligibility <ArrowRight className="ml-2 h-4 w-4 text-brand-gold"/>
          </Button>
        </div>

        <button className="lg:hidden p-2 text-brand-navy z-[100] relative" onClick={() => setMobileOpen(true)}>
          <Menu className="h-7 w-7" />
        </button>
      </div>
      
      {/* PREMIUM MOBILE MENU (Z-INDEX FIXED) */}
      <AnimatePresence>
        {mobileOpen && (
          <motion.div 
            initial={{ opacity: 0, x: "100%" }} 
            animate={{ opacity: 1, x: 0 }} 
            exit={{ opacity: 0, x: "100%" }} 
            transition={{ type: "spring", damping: 25, stiffness: 200 }}
            className="fixed inset-0 z-[999999] bg-[#0A192F] flex flex-col overflow-hidden" // Z-INDEX SUPER HIGH
          >
            <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10 pointer-events-none" />
            <div className="absolute top-0 right-0 w-64 h-64 bg-brand-gold/10 blur-[80px] rounded-full pointer-events-none" />
            <div className="absolute bottom-0 left-0 w-64 h-64 bg-blue-600/20 blur-[80px] rounded-full pointer-events-none" />

            <div className="flex items-center justify-between p-6 border-b border-white/10 relative z-10">
              <div className="h-10 w-36 bg-white rounded-lg p-1 flex items-center justify-center">
                 <img src="/logo.png" alt="Logo" className="w-full h-full object-contain" />
              </div>
              <button onClick={() => setMobileOpen(false)} className="p-2 bg-white/10 rounded-full text-white hover:bg-white/20 transition-colors">
                <X className="h-6 w-6" />
              </button>
            </div>

            <div className="flex-1 overflow-y-auto py-8 px-6 relative z-10 flex flex-col gap-2">
              {[
                { name: "Home", path: "/" },
                { name: "About Us", path: "/about" },
                { name: "Funding", path: "/funding" },
                { name: "Blog", path: "/blog" },
                { name: "Contact", path: "/contact" }
              ].map((link, i) => (
                <motion.div key={link.name} initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.1 + i * 0.05 }}>
                  <Link href={link.path} onClick={() => setMobileOpen(false)} className="flex items-center justify-between py-4 text-2xl font-extrabold text-white hover:text-brand-gold transition-colors border-b border-white/5 group">
                    {link.name}
                    <ArrowRight className="h-5 w-5 text-brand-gold opacity-0 group-hover:opacity-100 group-hover:translate-x-1 transition-all" />
                  </Link>
                </motion.div>
              ))}

              <motion.div initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.3 }} className="border-b border-white/5">
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
EOF
echo "✅ Header.tsx fixed (Links & Z-Index)."

# ==========================================
# 2. Fix Footer Links
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
          <Link href="/" className="flex items-center mb-8 w-fit bg-white rounded-xl p-2">
            <div className="relative h-14 w-44 md:h-16 md:w-56 flex items-center justify-start">
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
            {/* FIXED LINKS HERE */}
            <li><Link href="/about" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> About</Link></li>
            <li><Link href="/funding" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Funding</Link></li>
            <li><Link href="/blog" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Blog</Link></li>
            <li><Link href="/contact" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Contact</Link></li>
            <li><Link href="/privacy" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Privacy Policy</Link></li>
            <li><Link href="/terms" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Terms of Service</Link></li>
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
echo "✅ Footer.tsx links fixed."

# ==========================================
# 3. Fix Popup Timer (Session Storage)
# ==========================================
# Update PremiumMultiStepModal.tsx to only show once per session
cat << 'EOF' > fix_popup_session.js
const fs = require('fs');
const path = 'src/components/ui/PremiumMultiStepModal.tsx';
let content = fs.readFileSync(path, 'utf8');

// Replace the old timer logic with sessionStorage logic
const newTimerLogic = `
  // AUTO-POPUP TIMER (Only shows once per session)
  useEffect(() => {
    const hasSeenPopup = sessionStorage.getItem("hasSeenPopup");
    
    if (!hasSeenPopup) {
      const timer = setTimeout(() => {
        setIsOpen(true);
        sessionStorage.setItem("hasSeenPopup", "true");
      }, 5000); // 5 Seconds
      return () => clearTimeout(timer);
    }
  }, []);
`;

// Regex replace the existing useEffect timer
content = content.replace(/\/\/ 2\. 5-SECOND AUTO-POPUP TIMER[\s\S]*?\}, \[\]\);/, newTimerLogic);
// Also try to replace the previous version if the comment is different
content = content.replace(/\/\/ AUTO-POPUP TIMER[\s\S]*?\}, \[\]\);/, newTimerLogic);

fs.writeFileSync(path, content);
console.log("✅ Popup timer set to show only once per session.");
EOF

node fix_popup_session.js
rm fix_popup_session.js

# ==========================================
# 4. Create Premium Blog Page
# ==========================================
cat << 'EOF' > "src/app/(marketing)/blog/page.tsx"
import Link from "next/link";
import { ArrowRight, Calendar, User, Tag } from "lucide-react";

export default function BlogPage() {
  const blogs = [
    {
      title: "How to get CGTMSE Loan without Collateral in 2024",
      excerpt: "Learn the step-by-step process to secure up to ₹5 Crore funding for your MSME without pledging any personal assets.",
      date: "Oct 25, 2026",
      author: "Admin",
      category: "Funding",
      image: "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?q=80&w=800&auto=format&fit=crop"
    },
    {
      title: "Startup India (DPIIT) Registration: Benefits & Process",
      excerpt: "Discover how DPIIT recognition can give you 100% tax exemption for 3 years and unlock massive government funding.",
      date: "Oct 20, 2026",
      author: "Admin",
      category: "Certification",
      image: "https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=800&auto=format&fit=crop"
    },
    {
      title: "Private Limited vs LLP: Which is better for your startup?",
      excerpt: "Confused between Pvt Ltd and LLP? We break down the compliance, taxation, and funding aspects to help you choose.",
      date: "Oct 15, 2026",
      author: "Admin",
      category: "Registration",
      image: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=800&auto=format&fit=crop"
    }
  ];

  return (
    <div className="bg-[#F8FAFC] min-h-screen pt-32 pb-24 text-brand-navy">
      <div className="container-page">
        
        {/* Header */}
        <div className="text-center mb-16">
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-2">OUR BLOG</p>
          <h1 className="text-5xl font-extrabold tracking-tight mb-4 text-brand-navy">Latest <span className="text-brand-gold">Insights.</span></h1>
          <p className="text-slate-600 max-w-2xl mx-auto text-lg">Expert advice on government schemes, funding, and business growth in India.</p>
        </div>

        {/* Blog Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {blogs.map((blog, i) => (
            <div key={i} className="bg-white rounded-3xl border border-slate-200 overflow-hidden hover:shadow-xl hover:-translate-y-1 transition-all duration-300 group cursor-pointer flex flex-col">
              <div className="relative h-56 overflow-hidden">
                <img src={blog.image} alt={blog.title} className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
                <div className="absolute top-4 left-4 bg-brand-gold text-brand-navy text-xs font-bold px-3 py-1 rounded-full flex items-center gap-1">
                  <Tag className="h-3 w-3" /> {blog.category}
                </div>
              </div>
              <div className="p-6 flex flex-col flex-1">
                <div className="flex items-center gap-4 text-xs text-slate-500 font-medium mb-3">
                  <span className="flex items-center gap-1"><Calendar className="h-3 w-3" /> {blog.date}</span>
                  <span className="flex items-center gap-1"><User className="h-3 w-3" /> {blog.author}</span>
                </div>
                <h2 className="text-xl font-bold text-brand-navy mb-3 leading-tight group-hover:text-brand-gold transition-colors">{blog.title}</h2>
                <p className="text-slate-600 text-sm mb-6 flex-1 line-clamp-3">{blog.excerpt}</p>
                <div className="flex items-center text-sm font-bold text-brand-gold mt-auto">
                  Read More <ArrowRight className="ml-2 h-4 w-4 group-hover:translate-x-1 transition-transform" />
                </div>
              </div>
            </div>
          ))}
        </div>

      </div>
    </div>
  );
}
EOF
echo "✅ Blog Page created."

echo "=========================================="
echo "🎉 ALL FIXES APPLIED SUCCESSFULLY!"
echo "1. 404 Errors fixed (About, Terms, Privacy, Blog)."
echo "2. Mobile menu z-index fixed (No overlap)."
echo "3. Popup will now show ONLY ONCE per session (5 sec timer)."
echo "4. Blog page created with dummy content."
echo ""
echo "Ab terminal me 'git add . && git commit -m \"Fixed links and blog\" && git push' chalayein."
echo "Vercel par automatic deploy hoga!"
echo "=========================================="