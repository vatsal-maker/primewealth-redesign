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
        <p className="text-sm font-bold text-brand-gold uppercase tracking-widest">Step {step} of 3</p>
        <p className="text-xs text-slate-400 font-medium">{Math.round((step/3)*100)}% Complete</p>
      </div>

      <AnimatePresence mode="wait">
        <motion.div key={step} initial={{ opacity: 0, x: step === 1 ? 50 : -50 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: step === 3 ? -50 : 50 }} transition={{ duration: 0.3 }} className="min-h-[350px]">
          <h2 className="text-3xl md:text-4xl font-extrabold text-slate-900 mb-8">{steps[step - 1].title}</h2>

          {step === 1 && (
            <div className="grid sm:grid-cols-2 gap-4">
              {services.map((s) => (
                <button key={s.id} onClick={() => { setFormData({ ...formData, service: s.title }); handleNext(); }} className={`text-left p-6 rounded-2xl border transition-all duration-300 group ${formData.service === s.title ? "border-blue-600 bg-blue-50" : "border-slate-200 bg-slate-50 hover:border-blue-300"}`}>
                  <s.icon className="h-8 w-8 text-brand-gold mb-4 group-hover:scale-110 transition-transform" />
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
                    <h3 className="text-lg font-bold text-slate-900 group-hover:text-brand-gold transition-colors">{s.title}</h3>
                    <p className="text-sm text-slate-500">{s.desc}</p>
                  </div>
                  <ArrowRight className="h-5 w-5 text-slate-400 group-hover:text-brand-gold group-hover:translate-x-2 transition-all" />
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
