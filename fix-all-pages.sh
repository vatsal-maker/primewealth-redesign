#!/bin/bash

echo "🎨 Fixing ALL Pages & Components to Light Theme..."

# ==========================================
# 1. Home Page (Cleanup)
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
import { AnimatedIndiaMap } from "@/components/home/AnimatedIndiaMap";
import { LiveNotifications } from "@/components/ui/LiveNotifications";
import { AIChatWidget } from "@/components/ui/AIChatWidget";

export default function HomePage() {
  return (
    <main className="relative bg-transparent min-h-screen text-slate-900">
      <Hero />
      <Stats />
      <ServicesGrid />
      <AnimatedIndiaMap />
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
echo "✅ Home Page updated."

# ==========================================
# 2. Services Page
# ==========================================
cat << 'EOF' > "src/app/(marketing)/services/page.tsx"
import Link from "next/link";
import { serviceCategories, allServices } from "@/shared/config/site";
import { ArrowRight } from "lucide-react";

export default function ServicesPage() {
  return (
    <div className="bg-slate-50 min-h-screen pt-32 pb-24 text-slate-900">
      <div className="container-page">
        <div className="text-center mb-20">
          <p className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-2">ALL SERVICES</p>
          <h1 className="text-5xl font-extrabold tracking-tight mb-4 text-slate-900">Everything We <span className="text-blue-600">Do.</span></h1>
          <p className="text-slate-600 max-w-2xl mx-auto text-lg">Explore our complete suite of business advisory services.</p>
        </div>
        
        <div className="space-y-24">
          {serviceCategories.map((g) => (
            <div key={g.code} id={g.code}>
              <div className="mb-8 border-l-4 border-blue-600 pl-4">
                <p className="text-sm font-bold text-blue-600 tracking-widest uppercase">{g.code}</p>
                <h2 className="text-3xl font-bold mt-1">{g.title}</h2>
              </div>
              
              <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
                {allServices.filter(s => s.category === g.code).map((s) => (
                  <Link key={s.slug} href={`/services/${s.slug}`}>
                    <div className="group h-full bg-white border border-slate-200 p-8 rounded-3xl hover:border-blue-300 hover:shadow-xl transition-all duration-300">
                      <h3 className="text-xl font-bold mb-3 group-hover:text-blue-600 transition-colors">{s.name}</h3>
                      <p className="text-slate-500 text-sm leading-relaxed mb-6 line-clamp-3">{s.desc}</p>
                      <div className="flex items-center text-sm font-bold text-blue-600">
                        View Details <ArrowRight className="ml-2 h-4 w-4 group-hover:translate-x-2 transition-transform" />
                      </div>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
EOF
echo "✅ Services Page updated."

# ==========================================
# 3. Service [slug] Page
# ==========================================
cat << 'EOF' > "src/app/(marketing)/services/[slug]/page.tsx"
import { notFound } from "next/navigation";
import Link from "next/link";
import { allServices, serviceCategories } from "@/shared/config/site";
import { Button } from "@/components/ui/Button";
import { CheckCircle2, FileText, CheckSquare } from "lucide-react";

export async function generateStaticParams() {
  return allServices.map(s => ({ slug: s.slug }));
}

export default async function ServicePage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const s = allServices.find(x => x.slug === slug);
  if (!s) notFound();

  const categoryTitle = serviceCategories.find(c => c.code === s.category)?.title || s.category;
  
  return (
    <div className="bg-slate-50 min-h-screen pt-32 pb-24 text-slate-900">
      <div className="container-page max-w-5xl">
        <nav className="mb-8 text-sm text-slate-500 font-medium">
          <Link href="/" className="hover:text-blue-600">Home</Link> / <Link href="/services" className="hover:text-blue-600">Services</Link> / <span className="text-blue-600">{s.name}</span>
        </nav>
        
        <div className="bg-white border border-slate-200 rounded-[2rem] p-10 md:p-16 mb-12 relative overflow-hidden shadow-sm">
          <p className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-4">{categoryTitle}</p>
          <h1 className="text-4xl md:text-6xl font-extrabold mb-6 relative z-10 text-slate-900">{s.name}</h1>
          <p className="text-xl text-slate-600 max-w-2xl mb-10 relative z-10">{s.desc}</p>
          <Button asChild size="lg" className="h-14 px-8 text-lg rounded-full bg-blue-600 hover:bg-blue-700 text-white font-bold shadow-lg">
            <Link href="/contact">Book Consultation</Link>
          </Button>
        </div>
        
        <div className="grid md:grid-cols-2 gap-8">
          <div className="bg-white border border-slate-200 rounded-3xl p-8 shadow-sm">
            <h2 className="text-2xl font-bold mb-6 flex items-center gap-3 text-slate-900"><CheckCircle2 className="text-blue-600" /> Key Benefits</h2>
            <ul className="space-y-4">
              {(s.benefits || []).map(b => (
                <li key={b} className="flex items-start gap-3 text-slate-600">
                  <div className="mt-1.5 h-2 w-2 rounded-full bg-blue-600 shrink-0" /> {b}
                </li>
              ))}
            </ul>
          </div>
          
          <div className="bg-white border border-slate-200 rounded-3xl p-8 shadow-sm">
            <h2 className="text-2xl font-bold mb-6 flex items-center gap-3 text-slate-900"><CheckSquare className="text-blue-600" /> Eligibility</h2>
            <ul className="space-y-4">
              {(s.eligibility || []).map(e => (
                <li key={e} className="flex items-start gap-3 text-slate-600">
                  <div className="mt-1.5 h-2 w-2 rounded-full bg-blue-600 shrink-0" /> {e}
                </li>
              ))}
            </ul>
          </div>
          
          <div className="md:col-span-2 bg-white border border-slate-200 rounded-3xl p-8 shadow-sm">
            <h2 className="text-2xl font-bold mb-6 flex items-center gap-3 text-slate-900"><FileText className="text-blue-600" /> Documents Required</h2>
            <div className="grid sm:grid-cols-2 gap-4">
              {(s.docs || []).map(d => (
                <div key={d} className="bg-slate-50 border border-slate-200 px-4 py-3 rounded-xl text-slate-700 text-sm font-medium">{d}</div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
EOF
echo "✅ Service Details Page updated."

# ==========================================
# 4. About Page
# ==========================================
cat << 'EOF' > "src/app/(marketing)/about/page.tsx"
"use client";
import { motion } from "motion/react";
import { CheckCircle2, ShieldCheck, Zap, Users, ArrowRight } from "lucide-react";
import { Button } from "@/components/ui/Button";
import Link from "next/link";
import { CountUp } from "@/components/motion/CountUp";

const coreValues = [
  { icon: ShieldCheck, title: "100% Transparency", desc: "No hidden fees. No fake promises. Just honest, data-driven advice for your business." },
  { icon: Zap, title: "Lightning Fast", desc: "We value your time. Company registration in 7 days, certificates in 48 hours." },
  { icon: Users, title: "Founder First", desc: "We are not just consultants; we are your co-founders in this journey." },
];

const stats = [
  { value: 10000, suffix: "+", label: "Businesses Guided" },
  { value: 500, suffix: "Cr+", label: "Funding Facilitated" },
  { value: 50, suffix: "+", label: "Expert Advisors" },
  { value: 99, suffix: "%", label: "Success Rate" },
];

export default function AboutPage() {
  return (
    <div className="bg-white min-h-screen text-slate-900 overflow-hidden">
      <section className="relative pt-40 pb-20 px-6">
        <div className="container-page max-w-5xl text-center relative z-10">
          <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-6">
            About PrimeWealth Advisory
          </motion.p>
          <motion.h1 initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }} className="text-5xl md:text-7xl font-extrabold tracking-tight leading-[1.1] mb-8 text-slate-900">
            We don't just register.<br/>
            We <span className="text-blue-600">Build Empires.</span>
          </motion.h1>
          <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }} className="text-xl text-slate-600 max-w-3xl mx-auto leading-relaxed">
            PrimeWealth Advisory is the growth partner for India's most ambitious entrepreneurs. From legal setup to securing crores in funding, we walk the journey with you.
          </motion.p>
        </div>
      </section>

      <section className="py-24 bg-slate-50">
        <div className="container-page grid md:grid-cols-2 gap-16 items-center">
          <motion.div initial={{ opacity: 0, x: -50 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }} className="relative rounded-[2.5rem] overflow-hidden border border-slate-200 shadow-xl h-[500px]">
            <img src="https://images.unsplash.com/photo-1600880292203-757bb62b4baf?q=80&w=1000&auto=format&fit=crop" alt="Business Consulting" className="w-full h-full object-cover" />
          </motion.div>

          <motion.div initial={{ opacity: 0, x: 50 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }} transition={{ duration: 0.6 }}>
            <h2 className="text-4xl font-bold mb-6">Our Mission</h2>
            <p className="text-lg text-slate-600 leading-relaxed mb-8">
              To democratize access to government funding and compliance for every Indian startup, regardless of their background. We believe every founder deserves a fair chance to scale without getting stuck in bureaucratic red tape.
            </p>
            <ul className="space-y-4 mb-8">
              {["100% Transparent Process", "No Hidden Fees", "End-to-End Support", "Govt. Certified Experts"].map((item, i) => (
                <li key={i} className="flex items-center gap-3 text-lg font-medium text-slate-800">
                  <CheckCircle2 className="h-6 w-6 text-blue-600 shrink-0" /> {item}
                </li>
              ))}
            </ul>
            <Button asChild className="h-14 px-8 rounded-full bg-blue-600 hover:bg-blue-700 text-white font-bold transition-all shadow-lg">
              <Link href="/contact">Talk to our Experts <ArrowRight className="ml-2 h-5 w-5" /></Link>
            </Button>
          </motion.div>
        </div>
      </section>

      <section className="py-20 border-y border-slate-200 bg-white">
        <div className="container-page grid grid-cols-2 md:grid-cols-4 gap-8">
          {stats.map((s, i) => (
            <div key={i} className="text-center">
              <p className="text-5xl font-extrabold text-blue-600 mb-2"><CountUp to={s.value} suffix={s.suffix} /></p>
              <p className="text-sm font-bold text-slate-500 uppercase tracking-widest">{s.label}</p>
            </div>
          ))}
        </div>
      </section>

      <section className="py-32 bg-slate-50">
        <div className="container-page">
          <div className="text-center mb-20">
            <h2 className="text-4xl font-bold mb-4">Our Core <span className="text-blue-600">Values</span></h2>
          </div>
          <div className="grid md:grid-cols-3 gap-8">
            {coreValues.map((v, i) => (
              <div key={i} className="bg-white border border-slate-200 p-10 rounded-[2.5rem] shadow-sm hover:shadow-xl transition-all">
                <div className="h-16 w-16 rounded-2xl bg-blue-50 flex items-center justify-center mb-8">
                  <v.icon className="h-8 w-8 text-blue-600" />
                </div>
                <h3 className="text-2xl font-bold mb-3">{v.title}</h3>
                <p className="text-slate-600 leading-relaxed">{v.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
EOF
echo "✅ About Page updated."

# ==========================================
# 5. Contact Page
# ==========================================
cat << 'EOF' > "src/app/(marketing)/contact/page.tsx"
"use client";
import { MultiStepForm } from "@/components/contact/MultiStepForm";
import { site } from "@/shared/config/site";
import { Phone, Mail, MapPin, Clock } from "lucide-react";
import { motion } from "motion/react";

export default function ContactPage() {
  return (
    <div className="bg-slate-50 min-h-screen pt-32 pb-24 text-slate-900 relative overflow-hidden">
      <div className="container-page relative z-10">
        <div className="text-center mb-16">
          <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-4">CONTACT US</motion.p>
          <motion.h1 initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }} className="text-5xl md:text-6xl font-extrabold tracking-tight mb-6 text-slate-900">
            Let's Build Your <span className="text-blue-600">Empire.</span>
          </motion.h1>
        </div>
        <div className="grid lg:grid-cols-5 gap-12 items-start max-w-6xl mx-auto">
          <motion.div initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.2 }} className="lg:col-span-2 space-y-8">
            <div className="bg-white border border-slate-200 p-8 rounded-3xl shadow-sm">
              <h3 className="text-xl font-bold text-slate-900 mb-6">Direct Contact</h3>
              <ul className="space-y-6">
                <li className="flex items-start gap-4">
                  <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0"><Phone className="h-5 w-5 text-blue-600" /></div>
                  <div><p className="text-sm text-slate-500 font-medium mb-1">Call Us</p><a href={`tel:${site.phone}`} className="text-lg font-bold text-slate-900 hover:text-blue-600 transition-colors">{site.phone}</a></div>
                </li>
                <li className="flex items-start gap-4">
                  <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0"><Mail className="h-5 w-5 text-blue-600" /></div>
                  <div><p className="text-sm text-slate-500 font-medium mb-1">Email Us</p><a href={`mailto:${site.email}`} className="text-lg font-bold text-slate-900 hover:text-blue-600 transition-colors">{site.email}</a></div>
                </li>
                <li className="flex items-start gap-4">
                  <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0"><MapPin className="h-5 w-5 text-blue-600" /></div>
                  <div><p className="text-sm text-slate-500 font-medium mb-1">Head Office</p><p className="text-sm font-medium text-slate-700 leading-relaxed">{site.address}</p></div>
                </li>
              </ul>
            </div>
            <div className="bg-white border border-slate-200 p-8 rounded-3xl flex items-center gap-4 shadow-sm">
              <Clock className="h-8 w-8 text-blue-600" />
              <div><p className="text-sm text-slate-500 font-medium">Working Hours</p><p className="text-slate-900 font-bold">Mon - Sat, 10:00 AM - 7:00 PM</p></div>
            </div>
          </motion.div>
          <motion.div initial={{ opacity: 0, x: 30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.3 }} className="lg:col-span-3">
            <MultiStepForm />
          </motion.div>
        </div>
      </div>
    </div>
  );
}
EOF
echo "✅ Contact Page updated."

# ==========================================
# 6. Funding Page
# ==========================================
cat << 'EOF' > "src/app/(marketing)/funding/page.tsx"
"use client";
import { AnimatedIndiaMap } from "@/components/home/AnimatedIndiaMap";

export default function FundingPage() {
  return (
    <div className="bg-white min-h-screen pt-20 pb-24">
      <AnimatedIndiaMap />
    </div>
  );
}
EOF
echo "✅ Funding Page updated."

# ==========================================
# 7. Privacy & Terms Pages
# ==========================================
cat << 'EOF' > "src/app/(marketing)/privacy/page.tsx"
export default function PrivacyPage() {
  return (
    <div className="bg-white min-h-screen pt-32 pb-24 text-slate-900">
      <div className="container-page max-w-4xl">
        <h1 className="text-4xl font-extrabold mb-8">Privacy Policy</h1>
        <div className="space-y-6 text-slate-600">
          <p>Your privacy is important to us.</p>
          <h2 className="text-2xl font-bold text-slate-900 mt-8">1. Data Collection</h2>
          <p>We collect personal information like Name, Email, and Phone number when you fill out our forms or contact us.</p>
          <h2 className="text-2xl font-bold text-slate-900 mt-8">2. Data Usage</h2>
          <p>Your data is used solely to provide our advisory services and will never be sold to third parties.</p>
        </div>
      </div>
    </div>
  );
}
EOF

cat << 'EOF' > "src/app/(marketing)/terms/page.tsx"
export default function TermsPage() {
  return (
    <div className="bg-white min-h-screen pt-32 pb-24 text-slate-900">
      <div className="container-page max-w-4xl">
        <h1 className="text-4xl font-extrabold mb-8">Terms of Service</h1>
        <div className="space-y-6 text-slate-600">
          <p>Welcome to PrimeWealth Advisory. By accessing our website, you agree to these terms.</p>
          <h2 className="text-2xl font-bold text-slate-900 mt-8">1. Services</h2>
          <p>We provide business advisory, registration, and funding assistance. All services are subject to government approval and eligibility.</p>
          <h2 className="text-2xl font-bold text-slate-900 mt-8">2. Disclaimers</h2>
          <p>PrimeWealth Advisory is not a government agency. Funding and subsidies are subject to authority discretion.</p>
        </div>
      </div>
    </div>
  );
}
EOF
echo "✅ Privacy & Terms Pages updated."

# ==========================================
# 8. MultiStepForm.tsx (Light Theme)
# ==========================================
cat << 'EOF' > src/components/contact/MultiStepForm.tsx
"use client";
import { useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { ArrowRight, CheckCircle2, ChevronLeft, Building2, Landmark, ShieldCheck, FileCheck } from "lucide-react";
import { Button } from "@/components/ui/Button";

const steps = [
  { id: 1, title: "What do you need help with?" },
  { id: 2, title: "What is your business stage?" },
  { id: 3, title: "Let's get you connected." },
];

const services = [
  { id: "reg", icon: Building2, title: "Company Registration", desc: "Pvt Ltd, LLP, OPC setup" },
  { id: "fund", icon: Landmark, title: "Funding & Loans", desc: "CGTMSE, PMEGP, MUDRA" },
  { id: "cert", icon: ShieldCheck, title: "Certifications", desc: "Startup India, GST, ISO" },
  { id: "comp", icon: FileCheck, title: "Compliance", desc: "ROC, GST, Annual filings" },
];

const stages = [
  { id: "idea", title: "Just an Idea", desc: "Pre-revenue, looking to start" },
  { id: "startup", title: "Registered Startup", desc: "Pvt Ltd/LLP, looking to grow" },
  { id: "msme", title: "Established MSME", desc: "Operational, looking to scale" },
];

export function MultiStepForm() {
  const [step, setStep] = useState(1);
  const [formData, setFormData] = useState({ service: "", stage: "", name: "", phone: "", email: "" });
  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleNext = () => setStep((s) => Math.min(s + 1, 3));
  const handleBack = () => setStep((s) => Math.max(s - 1, 1));

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setTimeout(() => setIsSubmitted(true), 1000);
  };

  if (isSubmitted) {
    return (
      <motion.div initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} className="text-center py-16 bg-white rounded-[2.5rem] border border-slate-200 shadow-sm">
        <div className="h-24 w-24 rounded-full bg-green-50 flex items-center justify-center mx-auto mb-6">
          <CheckCircle2 className="h-12 w-12 text-green-500" />
        </div>
        <h3 className="text-3xl font-bold text-slate-900 mb-4">Request Received!</h3>
        <p className="text-slate-500 mb-8">Our experts will call you within 24 hours.</p>
        <Button onClick={() => { setIsSubmitted(false); setStep(1); }} variant="outline" className="rounded-full">Submit Another Request</Button>
      </motion.div>
    );
  }

  return (
    <div className="bg-white border border-slate-200 rounded-[2.5rem] p-8 md:p-12 shadow-xl relative overflow-hidden">
      <div className="absolute top-0 left-0 w-full h-1 bg-slate-100">
        <motion.div className="h-full bg-blue-600" initial={{ width: "33%" }} animate={{ width: `${(step / 3) * 100}%` }} transition={{ duration: 0.3 }} />
      </div>

      <div className="flex justify-between items-center mb-8 pt-4">
        <p className="text-sm font-bold text-blue-600 uppercase tracking-widest">Step {step} of 3</p>
        <p className="text-xs text-slate-400 font-medium">{Math.round((step/3)*100)}% Complete</p>
      </div>

      <AnimatePresence mode="wait">
        <motion.div key={step} initial={{ opacity: 0, x: step === 1 ? 50 : -50 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: step === 3 ? -50 : 50 }} transition={{ duration: 0.3 }} className="min-h-[350px]">
          <h2 className="text-3xl md:text-4xl font-extrabold text-slate-900 mb-8">{steps[step - 1].title}</h2>

          {step === 1 && (
            <div className="grid sm:grid-cols-2 gap-4">
              {services.map((s) => (
                <button key={s.id} onClick={() => { setFormData({ ...formData, service: s.title }); handleNext(); }} className={`text-left p-6 rounded-2xl border transition-all duration-300 group ${formData.service === s.title ? "border-blue-600 bg-blue-50" : "border-slate-200 bg-slate-50 hover:border-blue-300"}`}>
                  <s.icon className="h-8 w-8 text-blue-600 mb-4 group-hover:scale-110 transition-transform" />
                  <h3 className="text-lg font-bold text-slate-900 mb-1">{s.title}</h3>
                  <p className="text-sm text-slate-500">{s.desc}</p>
                </button>
              ))}
            </div>
          )}

          {step === 2 && (
            <div className="space-y-4">
              {stages.map((s) => (
                <button key={s.id} onClick={() => { setFormData({ ...formData, stage: s.title }); handleNext(); }} className={`w-full flex items-center justify-between p-6 rounded-2xl border transition-all duration-300 group ${formData.stage === s.title ? "border-blue-600 bg-blue-50" : "border-slate-200 bg-slate-50 hover:border-blue-300"}`}>
                  <div className="text-left">
                    <h3 className="text-lg font-bold text-slate-900 group-hover:text-blue-600 transition-colors">{s.title}</h3>
                    <p className="text-sm text-slate-500">{s.desc}</p>
                  </div>
                  <ArrowRight className="h-5 w-5 text-slate-400 group-hover:text-blue-600 group-hover:translate-x-2 transition-all" />
                </button>
              ))}
            </div>
          )}

          {step === 3 && (
            <form onSubmit={handleSubmit} className="space-y-4">
              <div className="grid sm:grid-cols-2 gap-4">
                <div>
                  <label className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-2 block">Full Name</label>
                  <input required type="text" value={formData.name} onChange={e => setFormData({...formData, name: e.target.value})} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-slate-900 focus:outline-none focus:border-blue-500" placeholder="John Doe" />
                </div>
                <div>
                  <label className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-2 block">Phone</label>
                  <input required type="tel" value={formData.phone} onChange={e => setFormData({...formData, phone: e.target.value})} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-slate-900 focus:outline-none focus:border-blue-500" placeholder="+91 98765 43210" />
                </div>
              </div>
              <div>
                <label className="text-xs font-bold text-slate-500 uppercase tracking-wider mb-2 block">Email Address</label>
                <input required type="email" value={formData.email} onChange={e => setFormData({...formData, email: e.target.value})} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-slate-900 focus:outline-none focus:border-blue-500" placeholder="john@startup.com" />
              </div>
              <div className="pt-4 flex items-center gap-4">
                <Button type="button" onClick={handleBack} variant="outline" className="h-14 px-6 rounded-xl border-slate-200 text-slate-600 hover:text-slate-900"><ChevronLeft className="h-4 w-4 mr-2"/> Back</Button>
                <Button type="submit" className="flex-1 h-14 rounded-xl bg-blue-600 text-white font-bold text-lg hover:bg-blue-700 transition-all shadow-lg">Submit Request</Button>
              </div>
            </form>
          )}
        </motion.div>
      </AnimatePresence>
    </div>
  );
}
EOF
echo "✅ MultiStepForm updated."

# ==========================================
# 9. AIChatWidget.tsx (Light Theme)
# ==========================================
cat << 'EOF' > src/components/ui/AIChatWidget.tsx
"use client";
import { useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { MessageSquare, X, Send, Bot } from "lucide-react";

type Message = { role: "ai" | "user"; text: string; options?: string[] };

export function AIChatWidget() {
  const [isOpen, setIsOpen] = useState(false);
  const [messages, setMessages] = useState<Message[]>([
    { role: "ai", text: "Hi! I'm PrimeWealth AI. How can I help you today?", options: ["Funding/Loans", "Company Registration", "Certifications"] }
  ]);

  const handleOptionClick = (option: string) => {
    const newMessages = [...messages, { role: "user" as const, text: option }];
    setMessages(newMessages);

    setTimeout(() => {
      if (option === "Funding/Loans") {
        setMessages([...newMessages, { role: "ai", text: "Great! We offer CGTMSE, PMEGP, and MUDRA loans. Do you have an MSME/Udyam certificate?", options: ["Yes", "No"] }]);
      } else if (option === "Company Registration") {
        setMessages([...newMessages, { role: "ai", text: "We can register your Pvt Ltd, LLP, or OPC in 7 days. Would you like a free consultation?", options: ["Book Consultation", "View Pricing"] }]);
      } else if (option === "Certifications") {
        setMessages([...newMessages, { role: "ai", text: "We help with Startup India, GST, ISO, and FSSAI. Which one do you need?", options: ["Startup India", "GST/FSSAI"] }]);
      } else {
        setMessages([...newMessages, { role: "ai", text: "Perfect. Our expert will contact you shortly. You can also WhatsApp us directly for faster response!", options: ["Close Chat"] }]);
      }
    }, 1000);
  };

  return (
    <div className="fixed bottom-6 right-6 z-50 flex flex-col items-end">
      <AnimatePresence>
        {isOpen && (
          <motion.div initial={{ opacity: 0, y: 20, scale: 0.95 }} animate={{ opacity: 1, y: 0, scale: 1 }} exit={{ opacity: 0, y: 20, scale: 0.95 }} className="bg-white border border-slate-200 rounded-2xl shadow-2xl w-[350px] overflow-hidden mb-4 flex flex-col">
            <div className="bg-slate-50 p-4 flex items-center justify-between border-b border-slate-200">
              <div className="flex items-center gap-3">
                <div className="h-8 w-8 rounded-full bg-blue-600 flex items-center justify-center"><Bot className="h-5 w-5 text-white" /></div>
                <div>
                  <p className="text-sm font-bold text-slate-900">PrimeWealth AI</p>
                  <p className="text-[10px] text-green-600 flex items-center gap-1"><span className="w-1.5 h-1.5 rounded-full bg-green-500 animate-pulse" /> Online</p>
                </div>
              </div>
              <button onClick={() => setIsOpen(false)} className="text-slate-400 hover:text-slate-700"><X className="h-5 w-5" /></button>
            </div>
            <div className="p-4 h-[300px] overflow-y-auto flex flex-col gap-4 custom-scrollbar bg-white">
              {messages.map((msg, i) => (
                <div key={i} className={`flex ${msg.role === "user" ? "justify-end" : "justify-start"}`}>
                  <div className={`max-w-[80%] p-3 rounded-xl text-sm ${msg.role === "user" ? "bg-blue-600 text-white rounded-tr-sm" : "bg-slate-100 text-slate-800 border border-slate-200 rounded-tl-sm"}`}>{msg.text}</div>
                </div>
              ))}
              {messages[messages.length - 1].options && (
                <div className="flex flex-wrap gap-2 mt-2">
                  {messages[messages.length - 1].options?.map((opt) => (
                    <button key={opt} onClick={() => handleOptionClick(opt)} className="text-xs bg-white border border-slate-200 hover:border-blue-500 hover:text-blue-600 text-slate-700 px-3 py-1.5 rounded-full transition-colors">{opt}</button>
                  ))}
                </div>
              )}
            </div>
            <div className="p-3 border-t border-slate-200 bg-slate-50">
              <div className="flex items-center gap-2 bg-white rounded-full p-1 border border-slate-200">
                <input type="text" placeholder="Type a message..." className="bg-transparent text-sm w-full outline-none px-3 text-slate-900 placeholder:text-slate-400" disabled />
                <button className="bg-blue-600 p-2 rounded-full text-white"><Send className="h-4 w-4" /></button>
              </div>
            </div>
          </motion.div>
        )}
      </AnimatePresence>
      <motion.button whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }} onClick={() => setIsOpen(!isOpen)} className="h-16 w-16 bg-blue-600 rounded-full flex items-center justify-center shadow-[0_10px_30px_rgba(37,99,235,0.3)] relative">
        {isOpen ? <X className="h-7 w-7 text-white" /> : <MessageSquare className="h-7 w-7 text-white" />}
      </motion.button>
    </div>
  );
}
EOF
echo "✅ AIChatWidget updated."

# ==========================================
# 10. Header.tsx (Adding Mobile Menu Back)
# ==========================================
cat << 'EOF' > src/components/layout/Header.tsx
"use client";
import Link from "next/link";
import { useState, useEffect } from "react";
import { Menu, MessageCircle, ArrowRight, X } from "lucide-react";
import { site } from "@/shared/config/site";
import { Button } from "@/components/ui/Button";
import { cn } from "@/shared/lib/utils";
import { motion, AnimatePresence } from "motion/react";

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
          <Button asChild className="bg-blue-600 hover:bg-blue-700 text-white rounded-full h-10 px-6 text-sm font-bold shadow-md">
            <Link href="/contact">Check Eligibility <ArrowRight className="ml-2 h-4 w-4"/></Link>
          </Button>
        </div>
        <button className="lg:hidden p-2" onClick={() => setMobileOpen(true)}><Menu className="h-6 w-6" /></button>
      </div>

      <AnimatePresence>
        {mobileOpen && (
          <motion.div initial={{ x: "100%" }} animate={{ x: 0 }} exit={{ x: "100%" }} className="fixed inset-y-0 right-0 w-[80%] max-w-sm bg-white shadow-2xl p-6 z-[100] border-l border-slate-200">
            <button onClick={() => setMobileOpen(false)} className="mb-8 font-bold text-slate-900 flex items-center gap-2"><X className="h-5 w-5" /> Close</button>
            <div className="flex flex-col gap-4 text-slate-900">
              {["Home", "About", "Services", "Funding", "Contact"].map(i => (
                <Link key={i} href={i==="Home"?"/":`/${i.toLowerCase()}`} onClick={() => setMobileOpen(false)} className="text-lg font-medium hover:text-blue-600">{i}</Link>
              ))}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
    </header>
  );
}
EOF
echo "✅ Header.tsx (Mobile Menu added) updated."

echo "=========================================="
echo "🎉 ALL PAGES AND COMPONENTS FIXED TO LIGHT THEME!"
echo "Ab terminal me 'npm run dev' chala kar dekho."
echo "=========================================="