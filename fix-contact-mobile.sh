#!/bin/bash

echo "📱 Fixing Contact Page & Form Mobile Responsiveness..."

# ==========================================
# 1. Update Contact Page (Stack on Mobile)
# ==========================================
cat << 'EOF' > "src/app/(marketing)/contact/page.tsx"
"use client";
import { MultiStepForm } from "@/components/contact/MultiStepForm";
import { site } from "@/shared/config/site";
import { Phone, Mail, MapPin, Clock } from "lucide-react";
import { motion } from "motion/react";

export default function ContactPage() {
  return (
    <div className="bg-[#F8FAFC] min-h-screen pt-24 md:pt-32 pb-24 text-brand-navy relative overflow-hidden">
      <div className="container-page relative z-10">
        
        <div className="text-center mb-12 md:mb-16">
          <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-xs md:text-sm font-bold text-brand-gold uppercase tracking-widest mb-3 md:mb-4">CONTACT US</motion.p>
          <motion.h1 initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }} className="text-4xl md:text-6xl font-extrabold tracking-tight mb-4 md:mb-6 text-brand-navy">
            Let's Build Your <span className="text-brand-gold">Empire.</span>
          </motion.h1>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-5 gap-8 lg:gap-12 items-start max-w-6xl mx-auto">
          
          {/* Left Side: Contact Info */}
          <motion.div initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.2 }} className="lg:col-span-2 space-y-6 md:space-y-8 w-full">
            
            <div className="bg-white border border-slate-200 p-6 md:p-8 rounded-3xl shadow-sm">
              <h3 className="text-xl font-bold text-brand-navy mb-6">Direct Contact</h3>
              <ul className="space-y-6">
                <li className="flex items-start gap-4">
                  <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0"><Phone className="h-5 w-5 text-brand-gold" /></div>
                  <div className="overflow-hidden"><p className="text-sm text-slate-500 font-medium mb-1">Call Us</p><a href={`tel:${site.phone}`} className="text-base md:text-lg font-bold text-brand-navy hover:text-brand-gold transition-colors break-words">{site.phone}</a></div>
                </li>
                <li className="flex items-start gap-4">
                  <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0"><Mail className="h-5 w-5 text-brand-gold" /></div>
                  <div className="overflow-hidden"><p className="text-sm text-slate-500 font-medium mb-1">Email Us</p><a href={`mailto:${site.email}`} className="text-base md:text-lg font-bold text-brand-navy hover:text-brand-gold transition-colors break-words">{site.email}</a></div>
                </li>
                <li className="flex items-start gap-4">
                  <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0"><MapPin className="h-5 w-5 text-brand-gold" /></div>
                  <div><p className="text-sm text-slate-500 font-medium mb-1">Head Office</p><p className="text-sm font-medium text-slate-700 leading-relaxed">{site.address}</p></div>
                </li>
              </ul>
            </div>

            <div className="bg-white border border-slate-200 p-6 md:p-8 rounded-3xl flex items-center gap-4 shadow-sm">
              <Clock className="h-8 w-8 text-brand-gold shrink-0" />
              <div><p className="text-sm text-slate-500 font-medium">Working Hours</p><p className="text-sm md:text-base text-brand-navy font-bold">Mon - Sat, 9:30 AM - 6:30 PM</p></div>
            </div>
          </motion.div>

          {/* Right Side: Form */}
          <motion.div initial={{ opacity: 0, x: 30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.3 }} className="lg:col-span-3 w-full">
            <MultiStepForm />
          </motion.div>

        </div>
      </div>
    </div>
  );
}
EOF
echo "✅ Contact Page layout fixed."

# ==========================================
# 2. Update MultiStepForm (Responsive padding & buttons)
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
      <motion.div initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} className="text-center py-16 bg-white rounded-[2rem] border border-slate-200 shadow-sm px-4">
        <div className="h-20 w-20 md:h-24 md:w-24 rounded-full bg-green-50 flex items-center justify-center mx-auto mb-6">
          <CheckCircle2 className="h-10 w-10 md:h-12 md:w-12 text-green-500" />
        </div>
        <h3 className="text-2xl md:text-3xl font-bold text-brand-navy mb-4">Request Received!</h3>
        <p className="text-slate-500 mb-8 text-sm md:text-base">Our experts will call you within 24 hours.</p>
        <Button onClick={() => { setIsSubmitted(false); setStep(1); }} variant="outline" className="rounded-full">Submit Another Request</Button>
      </motion.div>
    );
  }

  return (
    <div className="bg-white border border-slate-200 rounded-[2rem] p-5 md:p-10 shadow-xl relative overflow-hidden">
      <div className="absolute top-0 left-0 w-full h-1 bg-slate-100">
        <motion.div className="h-full bg-brand-gold" initial={{ width: "33%" }} animate={{ width: `${(step / 3) * 100}%` }} transition={{ duration: 0.3 }} />
      </div>

      <div className="flex justify-between items-center mb-6 md:mb-8 pt-2 md:pt-4">
        <p className="text-xs md:text-sm font-bold text-brand-gold uppercase tracking-widest">Step {step} of 3</p>
        <p className="text-[10px] md:text-xs text-slate-400 font-medium">{Math.round((step/3)*100)}% Complete</p>
      </div>

      <AnimatePresence mode="wait">
        <motion.div key={step} initial={{ opacity: 0, x: step === 1 ? 50 : -50 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: step === 3 ? -50 : 50 }} transition={{ duration: 0.3 }} className="min-h-[280px] md:min-h-[350px]">
          <h2 className="text-xl md:text-3xl font-extrabold text-brand-navy mb-6 md:mb-8">{steps[step - 1].title}</h2>

          {step === 1 && (
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 md:gap-4">
              {services.map((s) => (
                <button key={s.id} onClick={() => { setFormData({ ...formData, service: s.title }); handleNext(); }} className={`text-left p-4 md:p-6 rounded-xl md:rounded-2xl border transition-all duration-300 group ${formData.service === s.title ? "border-brand-gold bg-brand-gold/5" : "border-slate-200 bg-slate-50 hover:border-brand-gold/50"}`}>
                  <s.icon className="h-6 w-6 md:h-8 md:w-8 text-brand-gold mb-3 md:mb-4 group-hover:scale-110 transition-transform" />
                  <h3 className="text-base md:text-lg font-bold text-brand-navy mb-1">{s.title}</h3>
                  <p className="text-xs md:text-sm text-slate-500">{s.desc}</p>
                </button>
              ))}
            </div>
          )}

          {step === 2 && (
            <div className="space-y-3 md:space-y-4">
              {stages.map((s) => (
                <button key={s.id} onClick={() => { setFormData({ ...formData, stage: s.title }); handleNext(); }} className={`w-full flex items-center justify-between p-4 md:p-6 rounded-xl md:rounded-2xl border transition-all duration-300 group ${formData.stage === s.title ? "border-brand-gold bg-brand-gold/5" : "border-slate-200 bg-slate-50 hover:border-brand-gold/50"}`}>
                  <div className="text-left pr-4">
                    <h3 className="text-base md:text-lg font-bold text-brand-navy group-hover:text-brand-gold transition-colors">{s.title}</h3>
                    <p className="text-xs md:text-sm text-slate-500 mt-1">{s.desc}</p>
                  </div>
                  <ArrowRight className="h-4 w-4 md:h-5 md:w-5 text-slate-400 group-hover:text-brand-gold group-hover:translate-x-2 transition-all shrink-0" />
                </button>
              ))}
            </div>
          )}

          {step === 3 && (
            <form onSubmit={handleSubmit} className="space-y-3 md:space-y-4">
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 md:gap-4">
                <div>
                  <label className="text-[10px] md:text-xs font-bold text-slate-500 uppercase tracking-wider mb-1 md:mb-2 block">Full Name</label>
                  <input required type="text" value={formData.name} onChange={e => setFormData({...formData, name: e.target.value})} className="w-full bg-slate-50 border border-slate-200 rounded-lg md:rounded-xl px-3 md:px-4 py-2.5 md:py-3 text-sm md:text-base text-brand-navy focus:outline-none focus:ring-2 focus:ring-brand-gold" placeholder="John Doe" />
                </div>
                <div>
                  <label className="text-[10px] md:text-xs font-bold text-slate-500 uppercase tracking-wider mb-1 md:mb-2 block">Phone</label>
                  <input required type="tel" value={formData.phone} onChange={e => setFormData({...formData, phone: e.target.value})} className="w-full bg-slate-50 border border-slate-200 rounded-lg md:rounded-xl px-3 md:px-4 py-2.5 md:py-3 text-sm md:text-base text-brand-navy focus:outline-none focus:ring-2 focus:ring-brand-gold" placeholder="+91 98765 43210" />
                </div>
              </div>
              <div>
                <label className="text-[10px] md:text-xs font-bold text-slate-500 uppercase tracking-wider mb-1 md:mb-2 block">Email Address</label>
                <input required type="email" value={formData.email} onChange={e => setFormData({...formData, email: e.target.value})} className="w-full bg-slate-50 border border-slate-200 rounded-lg md:rounded-xl px-3 md:px-4 py-2.5 md:py-3 text-sm md:text-base text-brand-navy focus:outline-none focus:ring-2 focus:ring-brand-gold" placeholder="john@startup.com" />
              </div>
              
              <div className="pt-4 md:pt-6 flex flex-col-reverse sm:flex-row items-center gap-3 md:gap-4">
                <Button type="button" onClick={handleBack} variant="outline" className="w-full sm:w-auto h-11 md:h-14 px-4 md:px-6 rounded-lg md:rounded-xl border-slate-200 text-slate-600 hover:text-brand-navy">
                  <ChevronLeft className="h-4 w-4 mr-2"/> Back
                </Button>
                <Button type="submit" className="w-full sm:flex-1 h-11 md:h-14 rounded-lg md:rounded-xl bg-brand-navy text-white font-bold text-sm md:text-lg hover:bg-brand-navy-light transition-all shadow-lg">
                  Submit Request
                </Button>
              </div>
            </form>
          )}
        </motion.div>
      </AnimatePresence>
    </div>
  );
}
EOF
echo "✅ MultiStepForm component updated for mobile."

echo "=========================================="
echo "🎉 CONTACT PAGE RESPONSIVENESS FIXED!"
echo "Ab terminal me 'git add . && git commit -m \"Fixed contact mobile layout\" && git push' chalayein."
echo "=========================================="