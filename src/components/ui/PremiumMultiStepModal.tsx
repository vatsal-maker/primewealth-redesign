"use client";
import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "motion/react";
import { X, ArrowRight, CheckCircle2, User, Phone, Landmark, Building2, Award, FileCheck, ChevronLeft, Clock, ShieldCheck, Zap, Loader2 } from "lucide-react";
import { Button } from "@/components/ui/Button";

type Step = 1 | 2 | 3 | 4;

const serviceOptions = [
  { id: "reg", icon: Building2, title: "Company Registration", desc: "Pvt Ltd, LLP, OPC setup" },
  { id: "fund", icon: Landmark, title: "Funding & Loans", desc: "CGTMSE, PMEGP, MUDRA" },
  { id: "cert", icon: Award, title: "Certifications", desc: "Startup India, GST, ISO" },
  { id: "comp", icon: FileCheck, title: "Compliance & Tax", desc: "ROC, GST, Annual filings" },
];

export function PremiumMultiStepModal() {
  const [isOpen, setIsOpen] = useState(false);
  const [step, setStep] = useState<Step>(1);
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [formData, setFormData] = useState({ type: "", stage: "", detail: "", name: "", phone: "" });

  useEffect(() => {
    const handleOpen = () => setIsOpen(true);
    window.addEventListener("open-eligibility-modal", handleOpen);
    return () => window.removeEventListener("open-eligibility-modal", handleOpen);
  }, []);

  useEffect(() => {
    const timer = setTimeout(() => setIsOpen(true), 5000);
    return () => clearTimeout(timer);
  }, []);

  const handleNext = () => setStep((s) => Math.min(s + 1, 4) as Step);
  const handleBack = () => setStep((s) => Math.max(s - 1, 1) as Step);
  const handleClose = () => { setIsOpen(false); setTimeout(() => { setStep(1); setIsSubmitted(false); setIsLoading(false); }, 500); };
  
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    try {
      const response = await fetch("/api/send-email", {
        method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify(formData),
      });
      if (response.ok) setIsSubmitted(true);
      else alert("Something went wrong.");
    } catch (error) { alert("Network error."); } 
    finally { setIsLoading(false); }
  };

  const progress = (step / 4) * 100;
  const isFunding = formData.type === "Funding & Loans";

  const steps = [
    { icon: Building2, text: "Select Service" },
    { icon: Landmark, text: "Business Stage" },
    { icon: Clock, text: "Requirements" },
    { icon: CheckCircle2, text: "Get Started" }
  ];

  return (
    <>
      {/* FIXED: Floating Button Position & Size */}
      <motion.button 
        whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}
        onClick={() => setIsOpen(true)} 
        className="fixed bottom-6 right-6 z-[999] bg-gradient-to-r from-brand-gold to-[#B8860B] text-brand-navy px-5 py-3 rounded-full font-extrabold shadow-[0_10px_30px_rgba(212,175,55,0.4)] flex items-center gap-2 text-sm border border-brand-gold-light"
      >
        Check Eligibility <ArrowRight className="h-4 w-4" />
      </motion.button>

      <AnimatePresence>
        {isOpen && (
          <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} className="fixed inset-0 z-[1000] flex items-center justify-center p-4 bg-[#050B14]/90 backdrop-blur-lg perspective-[2000px]">
            <motion.div
              initial={{ opacity: 0, rotateX: 15, y: 50, scale: 0.95 }}
              animate={{ opacity: 1, rotateX: 0, y: 0, scale: 1 }}
              exit={{ opacity: 0, rotateX: -10, y: 30, scale: 0.95 }}
              transition={{ type: "spring", stiffness: 200, damping: 25 }}
              className="w-full max-w-[1050px] bg-white rounded-[2rem] shadow-[0_0_50px_rgba(212,175,55,0.15)] overflow-hidden flex flex-col md:flex-row relative h-[700px] max-h-[90vh] border border-white/20"
            >
              <div className="hidden md:flex w-[40%] bg-[#0A192F] p-10 flex-col justify-between relative overflow-hidden">
                <div className="absolute inset-0 opacity-20">
                  <div className="absolute top-0 left-0 w-full h-full bg-[radial-gradient(ellipse_at_top_left,_var(--tw-gradient-stops))] from-blue-600 via-transparent to-transparent animate-pulse" style={{ animationDuration: '4s' }} />
                  <div className="absolute bottom-0 right-0 w-full h-full bg-[radial-gradient(ellipse_at_bottom_right,_var(--tw-gradient-stops))] from-brand-gold via-transparent to-transparent animate-pulse" style={{ animationDuration: '6s', animationDelay: '1s' }} />
                </div>

                <div className="relative z-10">
                  <div className="flex items-center gap-4 mb-10">
                     {/* FIXED: Logo Size Increased */}
                     <div className="h-14 w-14 bg-white rounded-xl flex items-center justify-center p-2 shadow-lg"><img src="/logo.png" alt="Logo" className="w-full h-full object-contain" /></div>
                     <div>
                        {/* FIXED: Text Changed to PrimeWealth Advisory */}
                        <h2 className="text-2xl font-extrabold text-white tracking-wide">PrimeWealth Advisory</h2>
                        <p className="text-xs font-bold text-brand-gold uppercase tracking-widest mt-1">Your Growth Partner</p>
                     </div>
                  </div>

                  <div className="space-y-10 relative mt-16">
                     <div className="absolute left-6 top-6 bottom-6 w-[2px] bg-white/10 rounded-full overflow-hidden">
                        <motion.div className="w-full bg-gradient-to-b from-brand-gold to-blue-500 shadow-[0_0_10px_#D4AF37]" initial={{ height: "0%" }} animate={{ height: `${(step - 1) * 33.3}%` }} transition={{ duration: 0.6, ease: "easeInOut" }} />
                     </div>
                     {steps.map((item, i) => {
                       const isActive = step >= i + 1;
                       const isCurrent = step === i + 1;
                       return (
                         <div key={i} className="flex items-center gap-6 relative z-10 group">
                           <div className={`h-12 w-12 rounded-full flex items-center justify-center transition-all duration-500 border ${isActive ? 'bg-brand-gold text-brand-navy border-brand-gold' : 'bg-[#112240] text-slate-500 border-white/10'}`}>
                             <item.icon className="h-5 w-5" />
                           </div>
                           <div>
                             <p className={`font-bold transition-all duration-300 ${isCurrent ? 'text-white text-lg' : isActive ? 'text-slate-300' : 'text-slate-600'}`}>{item.text}</p>
                           </div>
                         </div>
                       );
                     })}
                  </div>
                </div>

                <div className="relative z-10 bg-white/5 backdrop-blur-xl border border-white/10 rounded-2xl p-5 mt-8 shadow-2xl">
                   <div className="flex items-center justify-between mb-3">
                      <p className="text-xs font-bold text-slate-300 uppercase tracking-wider">Live Statistics</p>
                      <span className="flex items-center gap-1 text-[10px] font-bold text-green-400 bg-green-400/10 px-2 py-1 rounded-full"><span className="w-1.5 h-1.5 rounded-full bg-green-400 animate-pulse"/> Live</span>
                   </div>
                   <div className="grid grid-cols-2 gap-4">
                      <div><p className="text-2xl font-extrabold text-white">150+</p><p className="text-[10px] text-slate-400 font-medium mt-1">Startups Funded</p></div>
                      <div><p className="text-2xl font-extrabold text-white">95%</p><p className="text-[10px] text-slate-400 font-medium mt-1">Success Ratio</p></div>
                   </div>
                </div>
              </div>

              <div className="w-full md:w-[60%] p-8 md:p-12 flex flex-col relative bg-[#FAFAFA] overflow-y-auto custom-scrollbar">
                <button onClick={handleClose} className="absolute top-6 right-6 p-2 bg-white border border-slate-200 hover:border-brand-gold hover:text-brand-gold rounded-full text-slate-500 transition-all shadow-sm z-20 group">
                  <X className="h-5 w-5 group-hover:rotate-90 transition-transform duration-300" />
                </button>

                {isSubmitted ? (
                  <motion.div initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} className="flex-1 flex flex-col items-center justify-center text-center">
                    <motion.div animate={{ scale: [1, 1.1, 1] }} transition={{ repeat: Infinity, duration: 2 }} className="h-28 w-28 rounded-full bg-green-50 flex items-center justify-center mb-8 border-4 border-green-100 shadow-[0_0_30px_rgba(34,197,94,0.3)]">
                      <CheckCircle2 className="h-14 w-14 text-green-500" />
                    </motion.div>
                    <h2 className="text-4xl font-extrabold text-brand-navy mb-4">Application Received!</h2>
                  </motion.div>
                ) : (
                  <>
                    <div className="mb-10">
                      <div className="flex justify-between items-end mb-3">
                        <div>
                           <p className="text-xs font-extrabold text-brand-gold uppercase tracking-widest mb-1">Step {step} of 4</p>
                           <h2 className="text-2xl font-extrabold text-brand-navy">Let's talk about your business.</h2>
                        </div>
                        <p className="text-sm font-extrabold text-brand-navy bg-brand-gold/10 px-3 py-1 rounded-full">{Math.round(progress)}%</p>
                      </div>
                      <div className="w-full h-2.5 bg-slate-200 rounded-full overflow-hidden shadow-inner">
                        <motion.div className="h-full bg-gradient-to-r from-brand-gold to-[#B8860B] rounded-full relative" initial={{ width: 0 }} animate={{ width: `${progress}%` }} transition={{ duration: 0.5, type: "spring" }}>
                           <motion.div animate={{ x: ["0%", "100%", "0%"] }} transition={{ repeat: Infinity, duration: 2 }} className="absolute top-0 bottom-0 w-10 bg-white/40 blur-[2px]" />
                        </motion.div>
                      </div>
                    </div>

                    <div className="flex-1 perspective-[1000px]">
                      <AnimatePresence mode="wait">
                        <motion.div key={step} initial={{ opacity: 0, rotateY: 30, x: 30 }} animate={{ opacity: 1, rotateY: 0, x: 0 }} exit={{ opacity: 0, rotateY: -30, x: -30 }} transition={{ duration: 0.4, type: "spring", stiffness: 200, damping: 25 }} className="flex-1 flex flex-col w-full">
                          {step === 1 && (
                            <div className="space-y-5">
                              <h3 className="text-xl font-bold text-brand-navy mb-2">What service do you need?</h3>
                              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                                {serviceOptions.map((opt) => (
                                  <button key={opt.id} onClick={() => { setFormData({ ...formData, type: opt.title }); handleNext(); }} className={`group flex flex-col items-start gap-3 p-5 rounded-2xl border-2 transition-all duration-300 text-left relative overflow-hidden bg-white ${formData.type === opt.title ? "border-brand-gold shadow-[0_10px_30px_rgba(212,175,55,0.2)]" : "border-slate-200 hover:border-brand-gold/50 shadow-sm"}`}>
                                    <div className={`h-12 w-12 rounded-xl flex items-center justify-center shrink-0 transition-colors ${formData.type === opt.title ? 'bg-brand-gold text-white shadow-md' : 'bg-slate-50 text-brand-gold group-hover:bg-brand-gold/10'}`}><opt.icon className="h-6 w-6" /></div>
                                    <div className="relative z-10"><h4 className="font-bold text-brand-navy text-base mb-1">{opt.title}</h4><p className="text-xs text-slate-500 font-medium">{opt.desc}</p></div>
                                  </button>
                                ))}
                              </div>
                            </div>
                          )}
                          {step === 2 && (
                            <div className="space-y-4">
                              <h3 className="text-xl font-bold text-brand-navy mb-4">What is your business stage?</h3>
                              {["Just an Idea", "Registered Startup", "Growing Business", "Established Enterprise"].map((stage) => (
                                <button key={stage} onClick={() => { setFormData({ ...formData, stage }); handleNext(); }} className={`w-full flex items-center justify-between p-5 rounded-xl border-2 font-bold transition-all duration-300 group bg-white ${formData.stage === stage ? "border-brand-gold shadow-md text-brand-gold" : "border-slate-200 hover:border-brand-gold/50 text-brand-navy"}`}>
                                  <div className="flex items-center gap-4">{stage}</div>
                                  <ArrowRight className={`h-5 w-5 transition-transform ${formData.stage === stage ? "text-brand-gold" : "text-slate-300 group-hover:translate-x-1"}`} />
                                </button>
                              ))}
                              <Button variant="ghost" onClick={handleBack} className="mt-4 text-slate-500 hover:text-brand-navy"><ChevronLeft className="h-4 w-4 mr-2"/> Go Back</Button>
                            </div>
                          )}
                          {step === 3 && (
                            <div className="space-y-4">
                              <h3 className="text-xl font-bold text-brand-navy mb-4">{isFunding ? "How much funding do you need?" : "What is your timeline?"}</h3>
                              {isFunding ? (
                                ["Up to ₹10 Lakh", "₹10 Lakh - ₹50 Lakh", "₹50 Lakh - ₹2 Crore", "Above ₹2 Crore"].map((amt) => (
                                  <button key={amt} onClick={() => { setFormData({ ...formData, detail: amt }); handleNext(); }} className={`w-full text-left p-5 rounded-xl border-2 font-bold transition-all duration-300 flex justify-between items-center group bg-white ${formData.detail === amt ? "border-brand-gold shadow-md text-brand-gold" : "border-slate-200 hover:border-brand-gold/50 text-brand-navy"}`}>{amt}<div className={`h-5 w-5 rounded-full border-2 flex items-center justify-center ${formData.detail === amt ? "border-brand-gold" : "border-slate-300 group-hover:border-brand-gold"}`}>{formData.detail === amt && <div className="h-2.5 w-2.5 bg-brand-gold rounded-full" />}</div></button>
                                ))
                              ) : (
                                ["Immediate (Within 72 hours)", "Within a Month", "Just Exploring Options"].map((time) => (
                                  <button key={time} onClick={() => { setFormData({ ...formData, detail: time }); handleNext(); }} className={`w-full text-left p-5 rounded-xl border-2 font-bold transition-all duration-300 flex justify-between items-center group bg-white ${formData.detail === time ? "border-brand-gold shadow-md text-brand-gold" : "border-slate-200 hover:border-brand-gold/50 text-brand-navy"}`}>{time}<div className={`h-5 w-5 rounded-full border-2 flex items-center justify-center ${formData.detail === time ? "border-brand-gold" : "border-slate-300 group-hover:border-brand-gold"}`}>{formData.detail === time && <div className="h-2.5 w-2.5 bg-brand-gold rounded-full" />}</div></button>
                                ))
                              )}
                              <Button variant="ghost" onClick={handleBack} className="mt-4 text-slate-500 hover:text-brand-navy"><ChevronLeft className="h-4 w-4 mr-2"/> Go Back</Button>
                            </div>
                          )}
                          {step === 4 && (
                            <form onSubmit={handleSubmit} className="space-y-4">
                              <h3 className="text-xl font-bold text-brand-navy mb-4">Let's get you connected.</h3>
                              <div className="relative group">
                                <User className="absolute left-4 top-4 h-5 w-5 text-slate-400 group-focus-within:text-brand-gold transition-colors" />
                                <input required value={formData.name} onChange={(e) => setFormData({...formData, name: e.target.value})} type="text" placeholder="Full Name" className="w-full pl-12 pr-4 py-3.5 rounded-xl border border-slate-200 bg-white focus:ring-2 focus:ring-brand-gold/30 font-medium text-brand-navy" />
                              </div>
                              <div className="relative group">
                                <Phone className="absolute left-4 top-4 h-5 w-5 text-slate-400 group-focus-within:text-brand-gold transition-colors" />
                                <input required value={formData.phone} onChange={(e) => setFormData({...formData, phone: e.target.value})} type="tel" placeholder="WhatsApp Number" className="w-full pl-12 pr-4 py-3.5 rounded-xl border border-slate-200 bg-white focus:ring-2 focus:ring-brand-gold/30 font-medium text-brand-navy" />
                              </div>
                              <div className="flex gap-4 mt-8">
                                <Button type="button" variant="outline" onClick={handleBack} className="h-14 px-6 rounded-xl border-slate-300 text-slate-600 font-bold">Back</Button>
                                <Button type="submit" disabled={isLoading} className="flex-1 h-14 rounded-xl bg-gradient-to-r from-brand-navy to-[#112240] text-white font-bold text-lg flex items-center justify-center gap-2">
                                  {isLoading ? <><Loader2 className="h-5 w-5 animate-spin" /> Sending...</> : <>Submit Application <Zap className="h-5 w-5 text-brand-gold" /></>}
                                </Button>
                              </div>
                            </form>
                          )}
                        </motion.div>
                      </AnimatePresence>
                    </div>
                  </>
                )}
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </>
  );
}
