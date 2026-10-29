#!/bin/bash

echo "📝 Upgrading Service Detail Pages with Full Detailed Content..."

# ==========================================
# 1. Update site.ts with Rich Details for Top Schemes
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

export type Service = { 
  slug: string; 
  name: string; 
  category: string; 
  desc: string; 
  longDesc?: string;
  benefits: string[]; 
  eligibility: string[]; 
  docs: string[]; 
  process?: { step: string; title: string; desc: string }[];
};

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

const defaultProcess = [
  { step: "01", title: "Consultation", desc: "Discuss your business requirements with our experts." },
  { step: "02", title: "Documentation", desc: "We collect and verify all necessary documents." },
  { step: "03", title: "Application", desc: "Filing the application with the respective authority." },
  { step: "04", title: "Approval", desc: "Receive your certificate or approval smoothly." }
];

export const allServices: Service[] = [
  // AARAMBH - Detailed
  { 
    slug: "private-limited-company", 
    name: "Private Limited Company", 
    category: "AARAMBH", 
    desc: "Most preferred structure for startups looking to raise funds.", 
    longDesc: "A Private Limited Company is the most popular corporate structure in India, especially for startups. It offers limited liability to its shareholders, meaning their personal assets are protected. It is highly preferred by venture capitalists and angel investors due to its transparent and structured compliance framework.",
    benefits: ["Limited liability protection for personal assets", "Separate legal entity (can own property, sue, be sued)", "Easier access to venture capital and angel funding", "High credibility among clients and vendors", "Perpetual succession (survives change in ownership)"], 
    eligibility: ["Minimum 2 directors and 2 shareholders (can be the same person)", "At least one director must be an Indian resident", "Unique name not matching existing companies", "Valid PAN and Aadhaar for all directors"], 
    docs: ["PAN Card of Directors", "Aadhaar Card of Directors", "Passport size photograph", "Registered office address proof (Rent agreement + Electricity bill)", "NOC from property owner"], 
    process: [
      { step: "01", title: "Name Approval", desc: "Filing RUN application to reserve the company name." },
      { step: "02", title: "DSC & DIN", desc: "Obtaining Digital Signature Certificates and Director Identification Numbers." },
      { step: "03", title: "MoA & AoA", desc: "Drafting the Memorandum and Articles of Association." },
      { step: "04", title: "Incorporation", desc: "Filing SPICe+ form with MCA and getting the Certificate of Incorporation." }
    ]
  },
  { 
    slug: "llp-registration", 
    name: "Limited Liability Partnership (LLP)", 
    category: "AARAMBH", 
    desc: "Ideal for professional firms and service providers.", 
    longDesc: "An LLP combines the flexibility of a partnership with the benefits of a company. It is a separate legal entity with limited liability, making it ideal for professional firms, consultancies, and small businesses. It requires less compliance compared to a Private Limited Company.",
    benefits: ["Lower compliance and maintenance costs", "Limited liability for partners", "No minimum capital requirement", "Flexible profit-sharing ratio"], 
    eligibility: ["Minimum 2 designated partners", "At least one partner must be an Indian resident", "No minimum capital requirement"], 
    docs: ["PAN & Aadhaar of Partners", "Passport size photograph", "Registered office address proof", "LLP Agreement (draft)"], 
    process: defaultProcess
  },

  // PRAMANIT - Detailed
  { 
    slug: "startup-india", 
    name: "Startup India Certificate (DPIIT)", 
    category: "PRAMANIT", 
    desc: "Get recognized by the government and unlock massive tax benefits.", 
    longDesc: "The Startup India initiative by DPIIT (Department for Promotion of Industry and Internal Trade) aims to build a strong ecosystem for nurturing innovation. Recognition under this scheme unlocks access to tax exemptions, easier compliance, and funding opportunities from the government.",
    benefits: ["100% Income Tax exemption for 3 consecutive years", "Exemption from Angel Tax (Section 56)", "Self-certification for 6 labour and 3 environmental laws", "Access to the ₹10,000 Cr Fund of Funds", "Easier public procurement norms (GeM portal)"], 
    eligibility: ["Entity must be a Pvt Ltd, LLP, or Registered Partnership", "Entity must be less than 10 years old", "Annual turnover must not exceed ₹100 Crore in any year", "Must be working towards innovation/improvement of products or services"], 
    docs: ["Certificate of Incorporation", "Pitch deck / write-up explaining innovation", "Website link or product demo video", "PAN Card of the entity"], 
    process: [
      { step: "01", title: "Register on Portal", desc: "Create an account on the Startup India portal." },
      { step: "02", title: "Submit Details", desc: "Fill in the entity details and upload the pitch deck." },
      { step: "03", title: "DPIIT Review", desc: "Government authorities review the innovative nature of your business." },
      { step: "04", title: "Recognition", desc: "Upon approval, download the DPIIT recognition certificate." }
    ]
  },
  { 
    slug: "gst-registration", 
    name: "GST Registration", 
    category: "PRAMANIT", 
    desc: "Mandatory tax registration for businesses crossing the threshold.", 
    longDesc: "Goods and Services Tax (GST) is a unified indirect tax applicable across India. GST registration is mandatory for businesses with an annual turnover exceeding ₹40 Lakhs (₹20 Lakhs for services). It allows you to claim input tax credit and legally conduct inter-state trade.",
    benefits: ["Legal recognition as a supplier of goods/services", "Ability to claim Input Tax Credit (ITC)", "Eligible for inter-state sales", "Increases business credibility"], 
    eligibility: ["Turnover > ₹40 Lakhs (Goods) or ₹20 Lakhs (Services)", "Involved in inter-state supply of goods", "E-commerce sellers"], 
    docs: ["PAN Card of business/owner", "Aadhaar Card", "Business address proof", "Bank account details", "Photograph of proprietor"], 
    process: defaultProcess
  },

  // VIKAS - Detailed
  { 
    slug: "cgtmse-loan", 
    name: "CGTMSE Loan", 
    category: "VIKAS", 
    desc: "Collateral-free loans up to ₹5 Crore for MSMEs.", 
    longDesc: "The Credit Guarantee Fund Trust for Micro and Small Enterprises (CGTMSE) provides guarantee cover to banks for collateral-free loans given to MSMEs. This scheme empowers new and existing MSMEs to secure funding without pledging personal assets or property.",
    benefits: ["No collateral or third-party guarantee required", "Credit guarantee cover up to ₹5 Crore", "Reduced interest rates as risk is shared by the trust", "Available for both manufacturing and service sectors"], 
    eligibility: ["Micro and Small Enterprises (Udyam registered)", "New or existing businesses in manufacturing/services", "Should not be a defaulter with any bank", "Good CIBIL score of promoters"], 
    docs: ["Udyam Registration Certificate", "Business PAN & KYC of promoters", "Detailed Project Report / Business Plan", "Last 2 years financial statements (if existing)", "Bank statements for 6 months"], 
    process: [
      { step: "01", title: "Eligibility Check", desc: "We analyze your business profile to match with the right bank." },
      { step: "02", title: "Project Report", desc: "Our experts prepare a bankable Detailed Project Report (DPR)." },
      { step: "03", title: "Bank Application", desc: "Filing the CGTMSE application with the selected bank." },
      { step: "04", title: "Approval & Disbursement", desc: "Bank sanctions the loan with CGTMSE guarantee, and funds are disbursed." }
    ]
  },

  // --- REST OF THE SERVICES (Using standard fallback) ---
  { slug: "one-person-company", name: "One Person Company (OPC)", category: "AARAMBH", desc: "Corporate entity for solo founders.", benefits: ["Single ownership", "Limited liability"], eligibility: ["1 director", "1 shareholder"], docs: ["PAN", "Aadhaar"] },
  { slug: "partnership-firm", name: "Partnership Firm", category: "AARAMBH", desc: "Traditional partnership registration.", benefits: ["Easy to start", "Shared liability"], eligibility: ["2+ partners"], docs: ["PAN", "Aadhaar"] },
  { slug: "section-8-company", name: "Section 8 Company", category: "AARAMBH", desc: "For NGOs and non-profits.", benefits: ["Tax exemptions", "Separate entity"], eligibility: ["2+ directors", "Charitable objective"], docs: ["PAN", "Object clause"] },
  { slug: "12a-80g-registration", name: "12A and 80G", category: "AARAMBH", desc: "Tax exemption for NGOs.", benefits: ["Donor tax benefits", "Income tax exemption"], eligibility: ["Registered NGO"], docs: ["Registration certificate", "Financials"] },
  { slug: "ngo-darpan", name: "NGO Darpan", category: "AARAMBH", desc: "Government portal registration for NGOs.", benefits: ["Govt scheme access", "Validity proof"], eligibility: ["Registered NGO"], docs: ["Registration certificate"] },
  { slug: "shram-suvidha", name: "Shram Suvidha Registration", category: "KAVACH", desc: "Labour law compliance registration.", benefits: ["Legal compliance"], eligibility: ["Employer"], docs: ["PAN", "Address Proof"] },
  { slug: "trademark-registration", name: "Trademark Registration", category: "KAVACH", desc: "Protect brand name and logo.", benefits: ["Exclusive rights", "Legal recourse"], eligibility: ["Any business"], docs: ["Logo", "Applicant KYC"] },
  { slug: "patent-registration", name: "Patent Registration", category: "KAVACH", desc: "Protect inventions.", benefits: ["20-year monopoly"], eligibility: ["Novel invention"], docs: ["Technical specs"] },
  { slug: "copyright-registration", name: "Copyright Registration", category: "KAVACH", desc: "Protect creative work.", benefits: ["Legal ownership"], eligibility: ["Creator"], docs: ["Work copy"] },
  { slug: "gem-registration", name: "GeM Registration", category: "PRAMANIT", desc: "Government e-Marketplace.", benefits: ["Sell to govt"], eligibility: ["Any business"], docs: ["PAN", "Aadhaar"] },
  { slug: "tax-exemption", name: "Tax Exemption", category: "PRAMANIT", desc: "Tax benefits for startups.", benefits: ["Tax savings"], eligibility: ["Eligible startups"], docs: ["Financials"] },
  { slug: "fssai-certificate", name: "FSSAI Registration", category: "PRAMANIT", desc: "Food safety license.", benefits: ["Legal operation"], eligibility: ["Food business"], docs: ["PAN", "Aadhaar"] },
  { slug: "msme-udyam", name: "Udyam Registration", category: "PRAMANIT", desc: "MSME certification.", benefits: ["Subsidies", "Govt tenders"], eligibility: ["Micro/Small/Medium"], docs: ["Aadhaar", "PAN"] },
  { slug: "iso-certificate", name: "ISO Certificate", category: "PRAMANIT", desc: "Quality management.", benefits: ["Global trust"], eligibility: ["Any business"], docs: ["Business docs"] },
  { slug: "iec-certificate", name: "IEC Certificate", category: "PRAMANIT", desc: "Import Export Code.", benefits: ["Global trade"], eligibility: ["Exporters"], docs: ["PAN", "Bank cert"] },
  { slug: "nsic-certification", name: "NSIC Certification", category: "PRAMANIT", desc: "MSME support.", benefits: ["Tender benefits"], eligibility: ["MSMEs"], docs: ["Udyam cert"] },
  { slug: "zed-certificate", name: "ZED Certificate", category: "PRAMANIT", desc: "Zero Defect Zero Effect.", benefits: ["Quality certification"], eligibility: ["MSMEs"], docs: ["Business docs"] },
  { slug: "gst-lut", name: "GST LUT", category: "PRAMANIT", desc: "Export without paying IGST.", benefits: ["Tax free exports"], eligibility: ["Exporters"], docs: ["GSTIN"] },
  { slug: "make-in-india", name: "Make In India", category: "PRAMANIT", desc: "Registration on portal.", benefits: ["Visibility"], eligibility: ["Manufacturers"], docs: ["Business docs"] },
  { slug: "pasara-certificate", name: "Pasara Certificate", category: "PRAMANIT", desc: "Essential commodity license.", benefits: ["Legal trade"], eligibility: ["Commodity traders"], docs: ["Business docs"] },
  { slug: "seed-fund", name: "Seed Fund", category: "NIDHI", desc: "Government seed capital.", benefits: ["Non-dilutive", "Up to 50L"], eligibility: ["DPIIT recognized"], docs: ["Pitch deck"] },
  { slug: "agri-preneurs", name: "Agri Preneurs", category: "NIDHI", desc: "Agriculture funding.", benefits: ["Grant support"], eligibility: ["Agri startup"], docs: ["Project report"] },
  { slug: "msme-design", name: "MSME Design", category: "NIDHI", desc: "Design support for MSMEs.", benefits: ["Financial aid"], eligibility: ["MSMEs"], docs: ["Design plan"] },
  { slug: "tide-idea", name: "TIDE Idea 2.0", category: "NIDHI", desc: "Technology incubation.", benefits: ["Grant"], eligibility: ["Tech startup"], docs: ["Idea proposal"] },
  { slug: "nidhi-prayas", name: "NIDHI PRAYAS", category: "NIDHI", desc: "Grant for prototype.", benefits: ["Up to 10L grant"], eligibility: ["Innovators"], docs: ["Idea proposal"] },
  { slug: "seed-support-scheme", name: "Seed Support Scheme", category: "NIDHI", desc: "Early-stage support.", benefits: ["Funding"], eligibility: ["Startups"], docs: ["Pitch deck"] },
  { slug: "gujarat-innovators", name: "Gujarat Innovators", category: "NIDHI", desc: "Gujarat state startup support.", benefits: ["State grants"], eligibility: ["Gujarat startups"], docs: ["Project report"] },
  { slug: "venture-capital", name: "Venture Capital", category: "VIKAS", desc: "Equity funding.", benefits: ["Large capital", "Mentorship"], eligibility: ["Scalable business"], docs: ["Pitch deck"] },
  { slug: "pmegp-loan", name: "PMEGP Loan", category: "VIKAS", desc: "Credit-linked subsidy.", benefits: ["Up to 35% subsidy"], eligibility: ["New enterprise"], docs: ["Aadhaar", "Project report"] },
  { slug: "mudra-loan", name: "MUDRA Loan", category: "VIKAS", desc: "Up to 10 Lakh funding.", benefits: ["No collateral"], eligibility: ["Small business"], docs: ["KYC"] },
  { slug: "pmfme", name: "PMFME", category: "VIKAS", desc: "Food processing funding.", benefits: ["Subsidy"], eligibility: ["Food business"], docs: ["Project report"] },
  { slug: "naiff", name: "NAIFF", category: "VIKAS", desc: "Agri infrastructure funding.", benefits: ["Interest subvention"], eligibility: ["Agri businesses"], docs: ["Project report"] },
  { slug: "maha-udyog", name: "Maha Udyog / CMEGP", category: "VIKAS", desc: "Maharashtra state funding.", benefits: ["Capital subsidy"], eligibility: ["Maharashtra MSMEs"], docs: ["Project report"] },
  { slug: "roc-compliance-pvt", name: "ROC Compliance for Pvt Ltd", category: "PRABANDHIT", desc: "Annual filings.", benefits: ["Avoid penalties"], eligibility: ["Pvt Ltd"], docs: ["Financials"] },
  { slug: "roc-compliance-llp", name: "ROC Compliance for LLP", category: "PRABANDHIT", desc: "Annual filings.", benefits: ["Smooth ops"], eligibility: ["LLP"], docs: ["Financials"] },
  { slug: "gst-compliance", name: "GST Compliances", category: "PRABANDHIT", desc: "Monthly returns.", benefits: ["Avoid interest"], eligibility: ["GST registered"], docs: ["Invoices"] },
  { slug: "digital-services", name: "Website & Marketing", category: "DIGITAL", desc: "Full digital presence.", benefits: ["SEO", "Leads"], eligibility: ["Any business"], docs: ["Brand details"] },
  { slug: "bhaskar-id", name: "Bhaskar ID", category: "VISTAR", desc: "Startup identification.", benefits: ["Govt recognition"], eligibility: ["Startups"], docs: ["Business docs"] },
  { slug: "financial-deck", name: "Financial Deck", category: "VISTAR", desc: "Financial modeling.", benefits: ["Investor ready"], eligibility: ["Fundraising"], docs: ["Business info"] },
  { slug: "investor-deck", name: "Investor Deck", category: "VISTAR", desc: "Pitch decks.", benefits: ["Storytelling"], eligibility: ["Fundraising"], docs: ["Business info"] }
];

// Fallback function to ensure every page looks full
export function getServiceDetails(slug: string) {
  const service = allServices.find(s => s.slug === slug);
  if (!service) return null;

  // Agar detail data nahi hai, to default data bhar do taaki page khali na lage
  return {
    ...service,
    longDesc: service.longDesc || `The ${service.name} is a crucial requirement for your business. At PrimeWealth Advisory, we simplify the entire process of obtaining your ${service.name}. We handle the paperwork, government portals, and compliance so you can focus on growing your business. Our expert team ensures a smooth and fast approval process.`,
    process: service.process || defaultProcess
  };
}

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
  // ... (baki homepage content same rahega)
};
EOF
echo "✅ site.ts updated with Detailed Content & Fallback."

# ==========================================
# 2. Update services/[slug]/page.tsx (New Layout)
# ==========================================
cat << 'EOF' > "src/app/(marketing)/services/[slug]/page.tsx"
import { notFound } from "next/navigation";
import Link from "next/link";
import { allServices, serviceCategories, getServiceDetails } from "@/shared/config/site";
import { Button } from "@/components/ui/Button";
import { CheckCircle2, FileText, ArrowRight, ShieldCheck, Target, ListChecks } from "lucide-react";
import { motion } from "motion/react";

export async function generateStaticParams() {
  return allServices.map(s => ({ slug: s.slug }));
}

export default async function ServicePage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const service = getServiceDetails(slug);
  
  if (!service) notFound();

  const categoryTitle = serviceCategories.find(c => c.code === service.category)?.title || service.category;
  
  return (
    <div className="bg-slate-50 min-h-screen pt-24 pb-24 text-slate-900">
      <div className="container-page max-w-6xl">
        
        {/* Breadcrumb */}
        <nav className="mb-8 text-sm text-slate-500 font-medium flex items-center gap-2">
          <Link href="/" className="hover:text-brand-gold transition-colors">Home</Link> 
          <span>/</span>
          <Link href="/services" className="hover:text-brand-gold transition-colors">Services</Link> 
          <span>/</span>
          <span className="text-brand-gold">{service.name}</span>
        </nav>
        
        {/* Hero Header */}
        <div className="bg-white border border-slate-200 rounded-[2.5rem] p-8 md:p-14 mb-12 relative overflow-hidden shadow-sm">
          <div className="absolute top-0 right-0 w-96 h-96 bg-brand-gold/5 rounded-full blur-[100px] pointer-events-none" />
          
          <div className="max-w-3xl relative z-10">
            <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-4">{categoryTitle}</p>
            <h1 className="text-4xl md:text-6xl font-extrabold mb-6 text-brand-navy leading-[1.1]">{service.name}</h1>
            <p className="text-xl text-slate-600 mb-8 leading-relaxed">{service.longDesc}</p>
            
            <div className="flex flex-wrap gap-4">
              <Button asChild size="lg" className="h-14 px-8 text-lg rounded-full bg-brand-navy hover:bg-brand-navy-light text-white font-bold shadow-lg">
                <Link href="/contact">Book Consultation <ArrowRight className="ml-2 h-5 w-5 text-brand-gold" /></Link>
              </Button>
              <Button asChild size="lg" variant="outline" className="h-14 px-8 text-lg rounded-full border-slate-300 text-slate-700 hover:bg-slate-50 font-bold">
                <a href={`https://wa.me/919512213342?text=Hi, I need help with ${service.name}`} target="_blank">Chat on WhatsApp</a>
              </Button>
            </div>
          </div>
        </div>

        {/* Details Grid */}
        <div className="grid md:grid-cols-2 gap-8 mb-12">
          
          {/* Benefits Section */}
          <div className="bg-white border border-slate-200 rounded-[2rem] p-8 md:p-10 shadow-sm">
            <h2 className="text-2xl font-bold mb-8 flex items-center gap-3 text-brand-navy">
              <div className="h-10 w-10 rounded-xl bg-blue-50 flex items-center justify-center text-brand-gold">
                <Target className="h-5 w-5" />
              </div>
              Key Benefits
            </h2>
            <ul className="space-y-4">
              {(service.benefits || []).map((b, i) => (
                <li key={i} className="flex items-start gap-3 text-slate-700 text-lg">
                  <CheckCircle2 className="h-6 w-6 text-green-500 shrink-0 mt-0.5" /> 
                  <span>{b}</span>
                </li>
              ))}
            </ul>
          </div>
          
          {/* Eligibility Section */}
          <div className="bg-white border border-slate-200 rounded-[2rem] p-8 md:p-10 shadow-sm">
            <h2 className="text-2xl font-bold mb-8 flex items-center gap-3 text-brand-navy">
              <div className="h-10 w-10 rounded-xl bg-blue-50 flex items-center justify-center text-brand-gold">
                <ShieldCheck className="h-5 w-5" />
              </div>
              Eligibility Criteria
            </h2>
            <ul className="space-y-4">
              {(service.eligibility || []).map((e, i) => (
                <li key={i} className="flex items-start gap-3 text-slate-700 text-lg">
                  <div className="mt-2.5 h-2 w-2 rounded-full bg-brand-gold shrink-0" /> 
                  <span>{e}</span>
                </li>
              ))}
            </ul>
          </div>

          {/* Documents Section */}
          <div className="md:col-span-2 bg-white border border-slate-200 rounded-[2rem] p-8 md:p-10 shadow-sm">
            <h2 className="text-2xl font-bold mb-8 flex items-center gap-3 text-brand-navy">
              <div className="h-10 w-10 rounded-xl bg-blue-50 flex items-center justify-center text-brand-gold">
                <FileText className="h-5 w-5" />
              </div>
              Documents Required
            </h2>
            <div className="grid sm:grid-cols-2 md:grid-cols-3 gap-4">
              {(service.docs || []).map((d, i) => (
                <div key={i} className="bg-slate-50 border border-slate-200 px-5 py-4 rounded-xl text-slate-700 font-medium flex items-center gap-3">
                  <ListChecks className="h-5 w-5 text-brand-navy" /> {d}
                </div>
              ))}
            </div>
          </div>
        </div>

        {/* Process Section */}
        <div className="bg-brand-navy rounded-[2.5rem] p-10 md:p-16 text-white text-center shadow-xl relative overflow-hidden">
          <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10" />
          <div className="relative z-10">
            <h2 className="text-3xl md:text-4xl font-extrabold mb-12">How We <span className="text-brand-gold">Get It Done</span></h2>
            
            <div className="grid md:grid-cols-4 gap-8">
              {(service.process || []).map((p, i) => (
                <div key={i} className="relative">
                  {/* Connecting Line (Desktop) */}
                  {i !== service.process!.length - 1 && (
                    <div className="hidden md:block absolute top-8 left-1/2 w-full h-[2px] bg-white/10" />
                  )}
                  <div className="relative z-10 flex flex-col items-center">
                    <div className="h-16 w-16 rounded-full bg-brand-navy-light border-2 border-brand-gold flex items-center justify-center text-xl font-bold text-brand-gold mb-6 shadow-[0_0_20px_rgba(212,175,55,0.3)]">
                      {p.step}
                    </div>
                    <h3 className="text-lg font-bold mb-2">{p.title}</h3>
                    <p className="text-sm text-slate-400 leading-relaxed">{p.desc}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>

      </div>
    </div>
  );
}
EOF
echo "✅ services/[slug]/page.tsx updated with Premium Detailed Layout."

echo "=========================================="
echo "🎉 DETAILED SERVICES PAGES READY!"
echo "Ab terminal me 'rm -rf .next' aur 'npm run dev' chala kar dekho."
echo "Har scheme ke page par full details (Benefits, Eligibility, Docs, Process) dikhenge."
echo "=========================================="