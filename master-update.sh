#!/bin/bash

echo "👑 Applying Master Data Update (All Services & Details)..."

# ==========================================
# 1. Update site.ts (Master Data)
# ==========================================
cat << 'EOF' > src/shared/config/site.ts
export const site = {
  name: "PrimeWealth Advisory",
  tagline: "Buland Sapno Ke Saath — आपकी सफलता, हमारी ज़िम्मेदारी",
  description: "From Registration to Investor Pitch — We Power Every Stage of Your Business Journey.",
  url: "https://www.primewealthadvisory.com",
  phone: "+91 9512213342",
  email: "info@primewealthadvisory.com",
  whatsapp: "https://wa.me/919512213342",
  address: "C-1131, Siddhi Vinayak Tower-A, B/H D.C.P. Office, SG Highway, Makarba, Ahmedabad, Gujarat – 380051",
  disclaimer: "PrimeWealth Advisory provides consultancy services only and is not affiliated with any government agency/body."
};

export type Service = { slug: string; name: string; category: string; desc: string; benefits: string[]; eligibility: string[]; docs: string[]; };

export const serviceCategories = [
  { code: "AARAMBH", title: "Company Registration", desc: "Start your business legally with expert incorporation services." },
  { code: "KAVACH", title: "IP & Legal Protection", desc: "Protect your brand, ideas, and intellectual property." },
  { code: "PRAMANIT", title: "Certifications", desc: "Get recognized with essential government certifications." },
  { code: "NIDHI", title: "Grants & Schemes", desc: "Access non-repayable grants and startup support." },
  { code: "VIKAS", title: "Funding & Loans", desc: "Secure capital with government-backed loan schemes." },
  { code: "PRABANDHIT", title: "Compliances", desc: "Stay compliant with ROC, GST, and annual filings." },
  { code: "DIGITAL", title: "Web & Marketing", desc: "Build your online presence and generate leads." },
  { code: "VISTAR", title: "Brand & Growth", desc: "Scale your business with pitch decks and branding." }
];

export const allServices: Service[] = [
  // AARAMBH
  { slug: "private-limited-company", name: "Private Limited Company", category: "AARAMBH", desc: "Most preferred structure for startups.", benefits: ["Limited liability", "Separate legal entity", "VC funding"], eligibility: ["2+ directors", "2+ shareholders"], docs: ["PAN", "Aadhaar", "Address Proof"] },
  { slug: "one-person-company", name: "One Person Company (OPC)", category: "AARAMBH", desc: "Corporate entity for solo founders.", benefits: ["Single ownership", "Limited liability"], eligibility: ["1 director", "1 shareholder"], docs: ["PAN", "Aadhaar"] },
  { slug: "llp-registration", name: "Limited Liability Partnership (LLP)", category: "AARAMBH", desc: "Ideal for professional firms.", benefits: ["Lower compliance", "Flexible management"], eligibility: ["2+ partners"], docs: ["PAN", "Aadhaar", "LLP Agreement"] },
  { slug: "partnership-firm", name: "Partnership Firm", category: "AARAMBH", desc: "Traditional partnership registration.", benefits: ["Easy to start", "Shared liability"], eligibility: ["2+ partners"], docs: ["PAN", "Aadhaar"] },
  { slug: "section-8-company", name: "Section 8 Company", category: "AARAMBH", desc: "For NGOs and non-profits.", benefits: ["Tax exemptions", "Separate entity"], eligibility: ["2+ directors", "Charitable objective"], docs: ["PAN", "Object clause"] },
  { slug: "12a-80g-registration", name: "12A and 80G", category: "AARAMBH", desc: "Tax exemption for NGOs.", benefits: ["Donor tax benefits", "Income tax exemption"], eligibility: ["Registered NGO"], docs: ["Registration certificate", "Financials"] },
  { slug: "ngo-darpan", name: "NGO Darpan", category: "AARAMBH", desc: "Government portal registration for NGOs.", benefits: ["Govt scheme access", "Validity proof"], eligibility: ["Registered NGO"], docs: ["Registration certificate"] },

  // KAVACH
  { slug: "shram-suvidha", name: "Shram Suvidha Registration", category: "KAVACH", desc: "Labour law compliance registration.", benefits: ["Legal compliance"], eligibility: ["Employer"], docs: ["PAN", "Address Proof"] },
  { slug: "trademark-registration", name: "Trademark Registration", category: "KAVACH", desc: "Protect brand name and logo.", benefits: ["Exclusive rights", "Legal recourse"], eligibility: ["Any business"], docs: ["Logo", "Applicant KYC"] },
  { slug: "patent-registration", name: "Patent Registration", category: "KAVACH", desc: "Protect inventions.", benefits: ["20-year monopoly"], eligibility: ["Novel invention"], docs: ["Technical specs"] },
  { slug: "copyright-registration", name: "Copyright Registration", category: "KAVACH", desc: "Protect creative work.", benefits: ["Legal ownership"], eligibility: ["Creator"], docs: ["Work copy"] },

  // PRAMANIT
  { slug: "startup-india", name: "Startup India Certificate (DPIIT)", category: "PRAMANIT", desc: "DPIIT recognition.", benefits: ["Tax holiday", "Angel tax exemption"], eligibility: ["Pvt Ltd / LLP"], docs: ["Pitch deck"] },
  { slug: "gem-registration", name: "GeM Registration", category: "PRAMANIT", desc: "Government e-Marketplace.", benefits: ["Sell to govt"], eligibility: ["Any business"], docs: ["PAN", "Aadhaar"] },
  { slug: "tax-exemption", name: "Tax Exemption", category: "PRAMANIT", desc: "Tax benefits for startups.", benefits: ["Tax savings"], eligibility: ["Eligible startups"], docs: ["Financials"] },
  { slug: "gst-registration", name: "GST Registration", category: "PRAMANIT", desc: "Mandatory tax registration.", benefits: ["Input tax credit"], eligibility: ["Turnover > 40L"], docs: ["PAN", "Address Proof"] },
  { slug: "fssai-certificate", name: "FSSAI Registration", category: "PRAMANIT", desc: "Food safety license.", benefits: ["Legal operation"], eligibility: ["Food business"], docs: ["PAN", "Aadhaar"] },
  { slug: "msme-udyam", name: "Udyam Registration", category: "PRAMANIT", desc: "MSME certification.", benefits: ["Subsidies", "Govt tenders"], eligibility: ["Micro/Small/Medium"], docs: ["Aadhaar", "PAN"] },
  { slug: "iso-certificate", name: "ISO Certificate", category: "PRAMANIT", desc: "Quality management.", benefits: ["Global trust"], eligibility: ["Any business"], docs: ["Business docs"] },
  { slug: "iec-certificate", name: "IEC Certificate", category: "PRAMANIT", desc: "Import Export Code.", benefits: ["Global trade"], eligibility: ["Exporters"], docs: ["PAN", "Bank cert"] },
  { slug: "nsic-certification", name: "NSIC Certification", category: "PRAMANIT", desc: "MSME support.", benefits: ["Tender benefits"], eligibility: ["MSMEs"], docs: ["Udyam cert"] },
  { slug: "zed-certificate", name: "ZED Certificate", category: "PRAMANIT", desc: "Zero Defect Zero Effect.", benefits: ["Quality certification"], eligibility: ["MSMEs"], docs: ["Business docs"] },
  { slug: "gst-lut", name: "GST LUT", category: "PRAMANIT", desc: "Export without paying IGST.", benefits: ["Tax free exports"], eligibility: ["Exporters"], docs: ["GSTIN"] },
  { slug: "make-in-india", name: "Make In India", category: "PRAMANIT", desc: "Registration on portal.", benefits: ["Visibility"], eligibility: ["Manufacturers"], docs: ["Business docs"] },
  { slug: "pasara-certificate", name: "Pasara Certificate", category: "PRAMANIT", desc: "Essential commodity license.", benefits: ["Legal trade"], eligibility: ["Commodity traders"], docs: ["Business docs"] },

  // NIDHI
  { slug: "seed-fund", name: "Seed Fund", category: "NIDHI", desc: "Government seed capital.", benefits: ["Non-dilutive", "Up to 50L"], eligibility: ["DPIIT recognized"], docs: ["Pitch deck"] },
  { slug: "agri-preneurs", name: "Agri Preneurs", category: "NIDHI", desc: "Agriculture funding.", benefits: ["Grant support"], eligibility: ["Agri startup"], docs: ["Project report"] },
  { slug: "msme-design", name: "MSME Design", category: "NIDHI", desc: "Design support for MSMEs.", benefits: ["Financial aid"], eligibility: ["MSMEs"], docs: ["Design plan"] },
  { slug: "tide-idea", name: "TIDE Idea 2.0", category: "NIDHI", desc: "Technology incubation.", benefits: ["Grant"], eligibility: ["Tech startup"], docs: ["Idea proposal"] },
  { slug: "nidhi-prayas", name: "NIDHI PRAYAS", category: "NIDHI", desc: "Grant for prototype.", benefits: ["Up to 10L grant"], eligibility: ["Innovators"], docs: ["Idea proposal"] },
  { slug: "seed-support-scheme", name: "Seed Support Scheme", category: "NIDHI", desc: "Early-stage support.", benefits: ["Funding"], eligibility: ["Startups"], docs: ["Pitch deck"] },
  { slug: "gujarat-innovators", name: "Gujarat Innovators", category: "NIDHI", desc: "Gujarat state startup support.", benefits: ["State grants"], eligibility: ["Gujarat startups"], docs: ["Project report"] },

  // VIKAS
  { slug: "venture-capital", name: "Venture Capital", category: "VIKAS", desc: "Equity funding.", benefits: ["Large capital", "Mentorship"], eligibility: ["Scalable business"], docs: ["Pitch deck"] },
  { slug: "cgtmse-loan", name: "CGTMSE Loan", category: "VIKAS", desc: "Collateral-free loans.", benefits: ["No collateral", "Govt guarantee"], eligibility: ["MSMEs"], docs: ["KYC", "Project report"] },
  { slug: "pmegp-loan", name: "PMEGP Loan", category: "VIKAS", desc: "Credit-linked subsidy.", benefits: ["Up to 35% subsidy"], eligibility: ["New enterprise"], docs: ["Aadhaar", "Project report"] },
  { slug: "mudra-loan", name: "MUDRA Loan", category: "VIKAS", desc: "Up to 10 Lakh funding.", benefits: ["No collateral"], eligibility: ["Small business"], docs: ["KYC"] },
  { slug: "pmfme", name: "PMFME", category: "VIKAS", desc: "Food processing funding.", benefits: ["Subsidy"], eligibility: ["Food business"], docs: ["Project report"] },
  { slug: "naiff", name: "NAIFF", category: "VIKAS", desc: "Agri infrastructure funding.", benefits: ["Interest subvention"], eligibility: ["Agri businesses"], docs: ["Project report"] },
  { slug: "maha-udyog", name: "Maha Udyog / CMEGP", category: "VIKAS", desc: "Maharashtra state funding.", benefits: ["Capital subsidy"], eligibility: ["Maharashtra MSMEs"], docs: ["Project report"] },

  // PRABANDHIT
  { slug: "roc-compliance-pvt", name: "ROC Compliance for Pvt Ltd", category: "PRABANDHIT", desc: "Annual filings.", benefits: ["Avoid penalties"], eligibility: ["Pvt Ltd"], docs: ["Financials"] },
  { slug: "roc-compliance-llp", name: "ROC Compliance for LLP", category: "PRABANDHIT", desc: "Annual filings.", benefits: ["Smooth ops"], eligibility: ["LLP"], docs: ["Financials"] },
  { slug: "gst-compliance", name: "GST Compliances", category: "PRABANDHIT", desc: "Monthly returns.", benefits: ["Avoid interest"], eligibility: ["GST registered"], docs: ["Invoices"] },

  // DIGITAL
  { slug: "digital-services", name: "Website & Marketing", category: "DIGITAL", desc: "Full digital presence.", benefits: ["SEO", "Leads"], eligibility: ["Any business"], docs: ["Brand details"] },

  // VISTAR (Others)
  { slug: "bhaskar-id", name: "Bhaskar ID", category: "VISTAR", desc: "Startup identification.", benefits: ["Govt recognition"], eligibility: ["Startups"], docs: ["Business docs"] },
  { slug: "financial-deck", name: "Financial Deck", category: "VISTAR", desc: "Financial modeling.", benefits: ["Investor ready"], eligibility: ["Fundraising"], docs: ["Business info"] },
  { slug: "investor-deck", name: "Investor Deck", category: "VISTAR", desc: "Pitch decks.", benefits: ["Storytelling"], eligibility: ["Fundraising"], docs: ["Business info"] }
];

export const homepageContent = {
  hero: {
    badge: "🏆 Trusted by 1000+ Businesses Across India",
    title: "Buland Sapno Ke Saath",
    highlight: "PrimeWealth Advisory",
    subtitle: "आपकी सफलता, हमारी जिम्मेदारी",
    description: "From Registration to Investor Pitch — We Power Every Stage of Your Business Journey.",
  },
  stats: [
    { label: "Clients Served", value: 1000, suffix: "+" },
    { label: "Combined Exp.", value: 4, suffix: "+ Yrs" },
    { label: "Success Rate", value: 94, suffix: "%" },
    { label: "Google Rating", value: 4.7, suffix: "/ 5.0" },
  ],
  features: [
    { icon: "Building2", title: "Company Registration", desc: "Private Limited, LLP, OPC, and partnership registration." },
    { icon: "Award", title: "Get Government Certification", desc: "DPIIT, ISO, GST, FSSAI, and 80-IAC recognition." },
    { icon: "TrendingUp", title: "Find a Government Scheme", desc: "Discover collateral-free loans and subsidies." },
    { icon: "ShieldCheck", title: "Improve Business Compliance", desc: "ROC, GST filings, and annual compliance." },
  ],
  process: [
    { step: "01", title: "Quick Application", desc: "Fill a simple 3-minute form with basic business details.", time: "3 mins" },
    { step: "02", title: "Expert Consultation", desc: "Our funding experts analyse your needs and match you with the most suitable government schemes.", time: "24 hrs" },
    { step: "03", title: "Documentation", desc: "We help prepare and submit all required documents — project report, financials, and bank filings.", time: "3-5 days" },
    { step: "04", title: "Approval & Disbursement", desc: "Get approved and receive funds directly in your bank account.", time: "30-45 Days" },
  ],
  whyChooseUs: [
    { title: "Clients First", desc: "Your goals are our top priority. Personalized solutions for every client." },
    { title: "24 × 7 Support", desc: "Round-the-clock enquiry response and expert guidance whenever you need it." },
    { title: "Regular Updates", desc: "Timely business and funding scheme updates so you never miss an opportunity." },
    { title: "Association Incentives", desc: "Exclusive long-term partnership benefits for repeat and referral clients." },
  ],
  testimonials: [
    { quote: "We had a fantastic experience for our startup's registration and funding needs. The team is incredibly prompt and efficient.", author: "Tirthanjan Banerjee", role: "Startup Founder" },
    { quote: "Their service is incredibly fast. The employees are very humble and supportive, making the whole process smooth.", author: "Adarsh Singhania", role: "Business Owner" },
    { quote: "I was super impressed with the whole team who guided and assisted in the smooth completion of the process within 2 days.", author: "Parshuram Wagh", role: "Entrepreneur" },
    { quote: "Their team was knowledgeable and responsive, helping me navigate every step of the Startup India certification process.", author: "Meenakshi", role: "MSME Owner" },
  ],
  faqs: [
    { q: "What is PrimeWealth Advisory?", a: "We help startups and MSMEs with registration, certifications, funding, and compliance." },
    { q: "How long does company registration take?", a: "Typically 7-10 working days." },
    { q: "Do you provide collateral-free loans?", a: "Yes, via CGTMSE and MUDRA schemes." },
    { q: "Is my data secure?", a: "Absolutely. We follow strict data privacy protocols." },
  ]
};
EOF
echo "✅ site.ts updated with all master services and data."

# ==========================================
# 2. Update Header.tsx Mega Menu
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
        
        <Link href="/" className="flex items-center shrink-0">
          <div className="relative h-14 w-36 md:h-16 md:w-48 flex items-center justify-start overflow-hidden">
             <img src="/logo.png" alt="PrimeWealth Advisory Logo" className="w-full h-full object-contain object-left" />
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
  // Organizing exact categories into 4 columns based on master prompt
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
    { title: "DIGITAL", items: allServices.filter(s => s.category === "DIGITAL") },
    { title: "VISTAR (Other)", items: allServices.filter(s => s.category === "VISTAR") }
  ];

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
echo "✅ Header.tsx updated with correct Mega Menu layout."

# ==========================================
# 3. Update Footer.tsx (Add Disclaimer)
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
      
      {/* DISCLAIMER SECTION */}
      <div className="border-t border-white/10 py-6 bg-[#050B14]">
        <div className="container-page">
          <p className="text-xs text-slate-500 text-center mb-4">{site.disclaimer}</p>
          <div className="flex flex-col md:flex-row justify-between items-center gap-4 text-xs text-slate-500">
            <p>© {new Date().getFullYear()} PrimeWealth Advisory. All rights reserved.</p>
            <p>Made with ❤️ in India</p>
          </div>
        </div>
      </div>
    </footer>
  );
}
EOF
echo "✅ Footer.tsx updated with official disclaimer."

echo "=========================================="
echo "🎉 MASTER UPDATE APPLIED SUCCESSFULLY!"
echo "Ab terminal me 'rm -rf .next' aur 'npm run dev' chala kar dekho."
echo "=========================================="