"use client";
import { useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { X, ArrowRight, ShieldCheck, Mail, Phone, User, Building2 } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function Elite3DForm({ isOpen, onClose }: { isOpen: boolean; onClose: () => void }) {
  const [activeTab, setActiveTab] = useState<"quick" | "eligibility">("quick");
  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setTimeout(() => setIsSubmitted(true), 1000);
  };

  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-slate-900/80 backdrop-blur-md perspective-[1200px]">
          <motion.div
            initial={{ opacity: 0, rotateX: 15, y: 40, scale: 0.95 }}
            animate={{ opacity: 1, rotateX: 0, y: 0, scale: 1 }}
            exit={{ opacity: 0, rotateX: -15, y: 40, scale: 0.95 }}
            className="w-full max-w-md bg-[#0A192F] rounded-[2.5rem] shadow-2xl overflow-hidden relative border border-white/10"
          >
            {/* Background Grid */}
            <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10 pointer-events-none" />
            <div className="absolute -top-20 -right-20 w-64 h-64 bg-brand-gold/10 blur-[80px] rounded-full pointer-events-none" />

            <button onClick={onClose} className="absolute top-6 right-6 p-2 bg-white/5 hover:bg-white/10 rounded-full text-slate-300 transition-colors z-20">
              <X className="h-5 w-5" />
            </button>

            <div className="p-8 relative z-10">
              {isSubmitted ? (
                <div className="text-center py-16">
                  <div className="h-20 w-20 bg-green-500/20 rounded-full flex items-center justify-center mx-auto mb-6">
                    <ShieldCheck className="h-10 w-10 text-green-400" />
                  </div>
                  <h2 className="text-2xl font-bold text-white mb-2">Request Received!</h2>
                  <p className="text-slate-400">Our expert will contact you shortly.</p>
                </div>
              ) : (
                <>
                  <div className="flex items-center gap-3 mb-8">
                     <div className="h-10 w-10 bg-white rounded-lg flex items-center justify-center p-1"><img src="/logo.png" alt="Logo" className="w-full h-full object-contain" /></div>
                     <div>
                        <p className="text-[10px] font-bold text-brand-gold uppercase tracking-widest">Aapki Tarakki Ka Saathi</p>
                        <p className="text-xs text-slate-300 font-medium">Bharosa Aapka, Jimmedari Humari</p>
                     </div>
                  </div>

                  <h2 className="text-3xl font-extrabold text-white mb-2">Let's talk about <br/><span className="text-brand-gold">your business.</span></h2>
                  <p className="text-sm text-slate-400 mb-6">Share your details — we'll reach out within 24 hours.</p>

                  {/* Tabs */}
                  <div className="bg-white/5 p-1 rounded-xl flex mb-6 border border-white/10">
                    <button onClick={() => setActiveTab("quick")} className={`flex-1 py-2 text-sm font-bold rounded-lg transition-all ${activeTab === "quick" ? "bg-brand-gold text-brand-navy shadow-md" : "text-slate-400 hover:text-white"}`}>Quick Contact</button>
                    <button onClick={() => setActiveTab("eligibility")} className={`flex-1 py-2 text-sm font-bold rounded-lg transition-all ${activeTab === "eligibility" ? "bg-brand-gold text-brand-navy shadow-md" : "text-slate-400 hover:text-white"}`}>Full Eligibility</button>
                  </div>

                  <form onSubmit={handleSubmit} className="space-y-3">
                    <div className="relative">
                      <User className="absolute left-4 top-3.5 h-5 w-5 text-slate-500" />
                      <input required type="text" placeholder="Full name" className="w-full pl-12 pr-4 py-3 rounded-xl border border-white/10 bg-white/5 text-white placeholder:text-slate-500 focus:border-brand-gold focus:outline-none" />
                    </div>
                    <div className="relative">
                      <Phone className="absolute left-4 top-3.5 h-5 w-5 text-slate-500" />
                      <input required type="tel" placeholder="Mobile number" className="w-full pl-12 pr-4 py-3 rounded-xl border border-white/10 bg-white/5 text-white placeholder:text-slate-500 focus:border-brand-gold focus:outline-none" />
                    </div>
                    <div className="relative">
                      <Mail className="absolute left-4 top-3.5 h-5 w-5 text-slate-500" />
                      <input type="email" placeholder="Email (optional)" className="w-full pl-12 pr-4 py-3 rounded-xl border border-white/10 bg-white/5 text-white placeholder:text-slate-500 focus:border-brand-gold focus:outline-none" />
                    </div>
                    {activeTab === "eligibility" && (
                      <div className="relative">
                        <Building2 className="absolute left-4 top-3.5 h-5 w-5 text-slate-500" />
                        <input type="text" placeholder="Company name (optional)" className="w-full pl-12 pr-4 py-3 rounded-xl border border-white/10 bg-white/5 text-white placeholder:text-slate-500 focus:border-brand-gold focus:outline-none" />
                      </div>
                    )}
                    
                    <Button type="submit" className="w-full h-12 mt-4 rounded-xl bg-gradient-to-r from-brand-gold to-brand-gold-dark text-brand-navy font-bold text-base shadow-lg">
                      Get Free Consultation <ArrowRight className="ml-2 h-4 w-4" />
                    </Button>
                    <p className="text-[10px] text-center text-slate-500 mt-4 flex items-center justify-center gap-2">
                      <ShieldCheck className="h-3 w-3 text-green-500" /> Transparent · No Advance Fees*
                    </p>
                  </form>
                </>
              )}
            </div>
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  );
}
