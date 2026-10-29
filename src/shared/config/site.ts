export const site = {
  name: "PrimeWealth Advisory",
  tagline: "Buland Sapno Ke Saath — आपकी सफलता, हमारी ज़िम्मेदारी",
  description: "From Registration to Investor Pitch — We Power Every Stage of Your Business Journey.",
  url: "https://www.primewealthadvisory.com",
  phone: "+91 9879595434",
  email: "info@primewealthadvisory.com",
  whatsapp: "https://wa.me/919879595434",
  address: "920, 9th Floor, Loha Bhavan, Opp. Old Gujarat Highcourt, Nr. Ratnadeep Complex, Income-tax, Ashram Road, Ahmedabad - 380009",
  disclaimer: "PrimeWealth Advisory provides consultancy services only and is not affiliated with any government agency/body."
};

export type Service = { slug: string; name: string; category: string; shortDesc: string; longDesc: string; benefits: string[]; eligibility: string[]; documents: string[]; process: { step: number; title: string; desc: string }[]; faqs: { q: string; a: string }[]; timeline: string; taxSaving?: string; authority?: string; prerequisite?: string; };

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

export const allServices = [
  // AARAMBH
  { slug: "private-limited-company", name: "Private Limited Company", category: "AARAMBH", timeline: "7-10 Days" },
  { slug: "one-person-company", name: "One Person Company (OPC)", category: "AARAMBH", timeline: "7-10 Days" },
  { slug: "llp-registration", name: "Limited Liability Partnership (LLP)", category: "AARAMBH", timeline: "10-15 Days" },
  { slug: "partnership-firm", name: "Partnership Firm", category: "AARAMBH", timeline: "7-10 Days" },
  { slug: "section-8-company", name: "Section 8 Company", category: "AARAMBH", timeline: "15-20 Days" },
  { slug: "12a-80g-registration", name: "12A and 80G", category: "AARAMBH", timeline: "15-30 Days" },
  { slug: "ngo-darpan", name: "NGO Darpan", category: "AARAMBH", timeline: "7-10 Days" },
  
  // KAVACH
  { slug: "shram-suvidha", name: "Shram Suvidha Registration", category: "KAVACH", timeline: "7-10 Days" },
  { slug: "trademark-registration", name: "Trademark Registration", category: "KAVACH", timeline: "12-18 Months" },
  { slug: "patent-registration", name: "Patent Registration", category: "KAVACH", timeline: "2-5 Years" },
  { slug: "copyright-registration", name: "Copyright Registration", category: "KAVACH", timeline: "6-12 Months" },
  
  // PRAMANIT
  { slug: "startup-india", name: "Startup India (DPIIT)", category: "PRAMANIT", timeline: "72 Hours" }, // <-- STARTUP INDIA 72 HOURS
  { slug: "gem-registration", name: "GeM Registration", category: "PRAMANIT", timeline: "1-2 Days" },
  { slug: "tax-exemption", name: "Tax Exemption (80IAC)", category: "PRAMANIT", timeline: "3-6 Months" }, // <-- TAX EXEMPTION 3-6 MONTHS
  { slug: "gst-registration", name: "GST Registration", category: "PRAMANIT", timeline: "7-10 Days" },
  { slug: "fssai-certificate", name: "FSSAI Registration", category: "PRAMANIT", timeline: "7-10 Days" },
  { slug: "msme-udyam", name: "Udyam Registration", category: "PRAMANIT", timeline: "1-2 Days" },
  { slug: "iso-certificate", name: "ISO Certificate", category: "PRAMANIT", timeline: "15-30 Days" },
  { slug: "iec-certificate", name: "IEC Certificate", category: "PRAMANIT", timeline: "3-5 Days" },
  { slug: "nsic-certification", name: "NSIC Certification", category: "PRAMANIT", timeline: "15-20 Days" },
  { slug: "zed-certificate", name: "ZED Certificate", category: "PRAMANIT", timeline: "30-60 Days" },
  { slug: "gst-lut", name: "GST LUT", category: "PRAMANIT", timeline: "1-2 Days" },
  { slug: "make-in-india", name: "Make In India", category: "PRAMANIT", timeline: "3-5 Days" },
  { slug: "pasara-certificate", name: "Pasara Certificate", category: "PRAMANIT", timeline: "15-30 Days" },
  
  // NIDHI
  { slug: "seed-fund", name: "Seed Fund", category: "NIDHI", timeline: "30-60 Days" },
  { slug: "agri-preneurs", name: "Agri Preneurs", category: "NIDHI", timeline: "30-45 Days" },
  { slug: "msme-design", name: "MSME Design", category: "NIDHI", timeline: "30-60 Days" },
  { slug: "tide-idea", name: "TIDE Idea 2.0", category: "NIDHI", timeline: "30-45 Days" },
  { slug: "nidhi-prayas", name: "NIDHI PRAYAS", category: "NIDHI", timeline: "45-60 Days" },
  { slug: "seed-support-scheme", name: "Seed Support Scheme", category: "NIDHI", timeline: "60 Days" },
  { slug: "gujarat-innovators", name: "Gujarat Innovators", category: "NIDHI", timeline: "30-45 Days" },
  
  // VIKAS
  { slug: "venture-capital", name: "Venture Capital", category: "VIKAS", timeline: "3-6 Months" },
  { slug: "cgtmse-loan", name: "CGTMSE Loan", category: "VIKAS", timeline: "30-45 Days" },
  { slug: "pmegp-loan", name: "PMEGP Loan", category: "VIKAS", timeline: "30-45 Days" },
  { slug: "mudra-loan", name: "MUDRA Loan", category: "VIKAS", timeline: "7-15 Days" },
  { slug: "pmfme", name: "PMFME", category: "VIKAS", timeline: "45 Days" },
  { slug: "naiff", name: "NAIFF", category: "VIKAS", timeline: "30-60 Days" },
  { slug: "maha-udyog", name: "Maha Udyog / CMEGP", category: "VIKAS", timeline: "30-45 Days" },
  
  // PRABANDHIT
  { slug: "roc-compliance-pvt", name: "ROC Compliance for Pvt Ltd", category: "PRABANDHIT", timeline: "Ongoing" },
  { slug: "roc-compliance-llp", name: "ROC Compliance for LLP", category: "PRABANDHIT", timeline: "Ongoing" },
  { slug: "gst-compliance", name: "GST Compliances", category: "PRABANDHIT", timeline: "Monthly" },
  
  // DIGITAL
  { slug: "digital-services", name: "Website & Marketing", category: "DIGITAL", timeline: "15-30 Days" },
  
  // VISTAR
  { slug: "bhaskar-id", name: "Bhaskar ID", category: "VISTAR", timeline: "15 Days" },
  { slug: "financial-deck", name: "Financial Deck", category: "VISTAR", timeline: "7-10 Days" },
  { slug: "investor-deck", name: "Investor Deck", category: "VISTAR", timeline: "7-10 Days" }
] as any[];

export function getServiceDetails(slug: string) {
  const service = allServices.find(s => s.slug === slug);
  if (!service) return null;
  
  const baseName = service.name;
  return {
    ...service,
    shortDesc: `Get your ${baseName} done professionally and fast.`,
    longDesc: `The ${baseName} is a crucial requirement for your business in India. It provides legal recognition, credibility, and unlocks various benefits from the government. At PrimeWealth Advisory, we simplify the entire process. We handle the paperwork, government portals, and compliance so you can focus on growing your business.`,
    benefits: ["100% Legal Compliance and Protection", "Enhanced Credibility Among Clients", "Unlocks Access to Government Schemes", "Smooth Business Operations", "Expert Guidance at Every Step"],
    eligibility: ["Business must be registered in India", "Valid PAN and Aadhaar of Directors/Partners", "Compliant with all basic requirements", "No pending defaults with the department"],
    documents: ["PAN Card of business/directors", "Aadhaar Card", "Certificate of Incorporation (if applicable)", "Business Address Proof", "Financial Statements (if existing)", "Digital Signature Certificate"],
    process: [{ step: 1, title: "Consultation", desc: "Discuss your business needs with our experts." }, { step: 2, title: "Documentation", desc: "We collect and verify all necessary documents." }, { step: 3, title: "Application Filing", desc: "Filing the application with the respective authority." }, { step: 4, title: "Approval", desc: "Receive your certificate smoothly." }],
    faqs: [{ q: "How long does this process take?", a: `Typically, it takes ${service.timeline || '72 hours'} depending on the service.` }, { q: "Is my data secure?", a: "Absolutely. We follow strict data privacy protocols." }],
    timeline: service.timeline || "7-10 Days", // Fallback
    authority: "Respective Authority",
    prerequisite: "Basic KYC"
  };
}


export const homepageContent = {
  hero: {
    badge: "🇮🇳 Trusted by 1000+ Businesses Across India",
    title: "Buland Sapno Ke Saath",
    highlight: "PrimeWealth Advisory",
    subtitle: "आपकी सफलता, हमारी ज़िम्मेदारी",
    description: "From Registration to Investor Pitch — We Power Every Stage of Your Business Journey.",
    multiLang: "प्राइमवेल्थ | પ્રાઇમવેલ્થ"
  },
  stats: [
    { label: "Clients Served", value: 1000, suffix: "+" },
    { label: "Combined Exp.", value: 4, suffix: "+ Yrs" },
    { label: "Success Rate", value: 95, suffix: "%" },
    { label: "Google Rating", value: 4.9, suffix: "/ 5.0" },
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
