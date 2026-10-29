#!/bin/bash

echo "🚀 Upgrading Funding Page & Creating Multi-Step 3D Form..."

# ==========================================
# 1. Remove Old Modal & Create NEW Multi-Step Modal
# ==========================================
rm -f src/components/ui/Premium3DModal.tsx

cat << 'EOF' > src/components/ui/PremiumMultiStepModal.tsx
"use client";
import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "motion/react";
import { X, ArrowRight, CheckCircle2, User, Phone, Briefcase, Landmark, Building2, ChevronLeft } from "lucide-react";
import { Button } from "@/components/ui/Button";

type Step = 1 | 2 | 3 | 4;

export function PremiumMultiStepModal() {
  const [isOpen, setIsOpen] = useState(false);
  const [step, setStep] = useState<Step>(1);
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [formData, setFormData] = useState({ type: "", stage: "", amount: "", name: "", phone: "" });

  // Auto-Popup Logic (7 Seconds)
  useEffect(() => {
    const hasSeenPopup = sessionStorage.getItem("hasSeenFundingPopup");
    if (!hasSeenPopup) {
      const timer = setTimeout(() => {
        setIsOpen(true);
        sessionStorage.setItem("hasSeenFundingPopup", "true");
      }, 7000);
      return () => clearTimeout(timer);
    }
  }, []);

  const handleNext = () => setStep((s) => Math.min(s + 1, 4) as Step);
  const handleBack = () => setStep((s) => Math.max(s - 1, 1) as Step);
  const handleClose = () => { setIsOpen(false); setTimeout(() => { setStep(1); setIsSubmitted(false); }, 500); };
  
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setTimeout(() => setIsSubmitted(true), 1000);
  };

  const progress = (step / 4) * 100;

  return (
    <>
      <Button onClick={() => setIsOpen(true)} className="h-14 px-8 text-lg rounded-full bg-blue-600 hover:bg-blue-700 text-white font-bold shadow-xl hover:-translate-y-1 transition-all flex items-center gap-2">
        Check Your Eligibility <ArrowRight className="h-5 w-5" />
      </Button>

      <AnimatePresence>
        {isOpen && (
          <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-slate-900/70 backdrop-blur-sm perspective-[1200px]">
            <motion.div
              initial={{ opacity: 0, rotateX: 15, y: 40, scale: 0.95 }}
              animate={{ opacity: 1, rotateX: 0, y: 0, scale: 1 }}
              exit={{ opacity: 0, rotateX: -15, y: 40, scale: 0.95 }}
              transition={{ type: "spring", stiffness: 200, damping: 25 }}
              className="w-full max-w-[900px] bg-white rounded-3xl shadow-2xl overflow-hidden flex flex-col md:flex-row relative h-[650px] max-h-[90vh]"
            >
              {/* Left Side: Premium Visual */}
              <div className="hidden md:flex w-[40%] bg-gradient-to-br from-[#0A192F] via-[#112240] to-[#1D4ED8] p-8 flex-col justify-between relative overflow-hidden">
                <div className="absolute inset-0 opacity-20 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')]" />
                
                {/* Animated Road/Pins Effect */}
                <div className="relative z-10">
                  <h2 className="text-3xl font-extrabold text-white mb-2">PrimeWealth</h2>
                  <p className="text-blue-200 text-sm">Your Growth Partner</p>
                  
                  <div className="mt-16 space-y-8 relative">
                     {/* Dashed Line */}
                     <div className="absolute left-[22px] top-4 bottom-0 w-1 border-l-2 border-dashed border-blue-400/30" />
                     
                     {[
                       { icon: Building2, text: "Company Registration", active: step >= 1 },
                       { icon: Landmark, text: "Govt. Funding", active: step >= 2 },
                       { icon: Briefcase, text: "Business Stage", active: step >= 3 },
                       { icon: CheckCircle2, text: "Get Funded", active: step >= 4 }
                     ].map((item, i) => (
                       <div key={i} className="flex items-center gap-4 relative z-10">
                         <div className={`h-12 w-12 rounded-full flex items-center justify-center transition-all duration-500 ${item.active ? 'bg-blue-500 text-white shadow-[0_0_20px_rgba(59,130,246,0.5)] scale-110' : 'bg-white/10 text-slate-400'}`}>
                           <item.icon className="h-6 w-6" />
                         </div>
                         <p className={`font-bold transition-colors ${item.active ? 'text-white' : 'text-slate-500'}`}>{item.text}</p>
                       </div>
                     ))}
                  </div>
                </div>
                <div className="relative z-10 text-xs text-blue-300 font-medium">© 2026 PrimeWealth Advisory</div>
              </div>

              {/* Right Side: Form Area */}
              <div className="w-full md:w-[60%] p-8 md:p-12 flex flex-col relative bg-white">
                <button onClick={handleClose} className="absolute top-6 right-6 p-2 bg-slate-100 hover:bg-slate-200 rounded-full text-slate-600 transition-colors z-20">
                  <X className="h-5 w-5" />
                </button>

                {isSubmitted ? (
                  <motion.div initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} className="flex-1 flex flex-col items-center justify-center text-center">
                    <div className="h-24 w-24 rounded-full bg-green-100 flex items-center justify-center mb-6">
                      <CheckCircle2 className="h-12 w-12 text-green-600" />
                    </div>
                    <h2 className="text-3xl font-extrabold text-slate-900 mb-2">Application Received!</h2>
                    <p className="text-slate-500 font-medium">Our expert will contact you shortly.</p>
                  </motion.div>
                ) : (
                  <>
                    {/* Progress Bar */}
                    <div className="mb-8">
                      <div className="flex justify-between items-center mb-2">
                        <p className="text-xs font-bold text-blue-600 uppercase tracking-widest">Step {step} of 4</p>
                        <p className="text-xs font-bold text-slate-400">{Math.round(progress)}% Complete</p>
                      </div>
                      <div className="w-full h-2 bg-slate-100 rounded-full overflow-hidden">
                        <motion.div className="h-full bg-blue-600" initial={{ width: 0 }} animate={{ width: `${progress}%` }} transition={{ duration: 0.3 }} />
                      </div>
                    </div>

                    <AnimatePresence mode="wait">
                      <motion.div key={step} initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -20 }} transition={{ duration: 0.3 }} className="flex-1 flex flex-col">
                        
                        {/* STEP 1: FUNDING TYPE */}
                        {step === 1 && (
                          <div className="space-y-4">
                            <h3 className="text-2xl font-bold text-slate-900 mb-6">What type of funding do you need?</h3>
                            {[
                              { id: "loan", icon: Landmark, title: "Business Loan", desc: "Secure institutional funding with competitive rates." },
                              { id: "grant", icon: Briefcase, title: "Government Grant", desc: "Non-refundable financial support under govt schemes." }
                            ].map((opt) => (
                              <button key={opt.id} onClick={() => { setFormData({ ...formData, type: opt.title }); handleNext(); }} className={`w-full flex items-start gap-4 p-5 rounded-2xl border-2 transition-all text-left ${formData.type === opt.title ? "border-blue-600 bg-blue-50" : "border-slate-100 hover:border-blue-300 bg-white"}`}>
                                <div className="h-12 w-12 rounded-xl bg-blue-100 flex items-center justify-center shrink-0"><opt.icon className="h-6 w-6 text-blue-600" /></div>
                                <div>
                                  <h4 className="font-bold text-slate-900">{opt.title}</h4>
                                  <p className="text-sm text-slate-500 mt-1">{opt.desc}</p>
                                </div>
                              </button>
                            ))}
                          </div>
                        )}

                        {/* STEP 2: BUSINESS STAGE */}
                        {step === 2 && (
                          <div className="space-y-4">
                            <h3 className="text-2xl font-bold text-slate-900 mb-6">What is your business stage?</h3>
                            {["Just an Idea", "Registered Startup", "Growing Business"].map((stage) => (
                              <button key={stage} onClick={() => { setFormData({ ...formData, stage }); handleNext(); }} className={`w-full text-left p-5 rounded-2xl border-2 font-bold transition-all ${formData.stage === stage ? "border-blue-600 bg-blue-50 text-blue-700" : "border-slate-100 hover:border-blue-300 text-slate-700"}`}>
                                {stage}
                              </button>
                            ))}
                            <Button variant="ghost" onClick={handleBack} className="mt-4 text-slate-500"><ChevronLeft className="h-4 w-4 mr-2"/> Back</Button>
                          </div>
                        )}

                        {/* STEP 3: AMOUNT */}
                        {step === 3 && (
                          <div className="space-y-4">
                            <h3 className="text-2xl font-bold text-slate-900 mb-6">How much funding do you need?</h3>
                            {["Up to ₹10 Lakh", "₹10 Lakh - ₹50 Lakh", "₹50 Lakh - ₹2 Crore", "Above ₹2 Crore"].map((amt) => (
                              <button key={amt} onClick={() => { setFormData({ ...formData, amount: amt }); handleNext(); }} className={`w-full text-left p-5 rounded-2xl border-2 font-bold transition-all ${formData.amount === amt ? "border-blue-600 bg-blue-50 text-blue-700" : "border-slate-100 hover:border-blue-300 text-slate-700"}`}>
                                {amt}
                              </button>
                            ))}
                            <Button variant="ghost" onClick={handleBack} className="mt-4 text-slate-500"><ChevronLeft className="h-4 w-4 mr-2"/> Back</Button>
                          </div>
                        )}

                        {/* STEP 4: CONTACT DETAILS */}
                        {step === 4 && (
                          <form onSubmit={handleSubmit} className="space-y-4">
                            <h3 className="text-2xl font-bold text-slate-900 mb-6">Let's get you connected.</h3>
                            <div className="relative">
                              <User className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                              <input required type="text" placeholder="Full Name" className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:ring-2 focus:ring-blue-500 font-medium" />
                            </div>
                            <div className="relative">
                              <Phone className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                              <input required type="tel" placeholder="Phone Number" className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:ring-2 focus:ring-blue-500 font-medium" />
                            </div>
                            <div className="flex gap-4 mt-6">
                              <Button type="button" variant="outline" onClick={handleBack} className="h-12 px-6 rounded-xl border-slate-200 text-slate-600">Back</Button>
                              <Button type="submit" className="flex-1 h-12 rounded-xl bg-blue-600 text-white font-bold text-lg">Submit Application</Button>
                            </div>
                            <p className="text-xs text-center text-slate-400 mt-4 flex items-center justify-center gap-1"><ShieldIcon /> Your details are 100% secure with us.</p>
                          </form>
                        )}
                      </motion.div>
                    </AnimatePresence>
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

function ShieldIcon() {
  return <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z"></path></svg>;
}
EOF
echo "✅ PremiumMultiStepModal created."

# ==========================================
# 2. Update Funding Page (Map Removed, Premium Elements Added)
# ==========================================
cat << 'EOF' > "src/app/(marketing)/funding/page.tsx"
"use client";
import { PremiumEMICalculator } from "@/components/ui/PremiumEMICalculator";
import { PremiumMultiStepModal } from "@/components/ui/PremiumMultiStepModal";
import { motion } from "motion/react";
import { ShieldCheck, TrendingUp, Users, Landmark } from "lucide-react";

export default function FundingPage() {
  return (
    <div className="bg-[#FAFAFA] min-h-screen text-slate-900 overflow-hidden">
      
      {/* 1. Premium Hero Section */}
      <section className="relative pt-32 pb-20 px-6 flex flex-col items-center justify-center text-center">
        <div className="absolute top-0 inset-x-0 h-[500px] bg-gradient-to-b from-blue-50 to-transparent -z-10" />
        
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white border border-slate-200 text-xs font-bold text-blue-600 mb-6 shadow-sm">
          <Landmark className="h-4 w-4" /> FUNDING & CAPITAL
        </motion.div>
        
        <motion.h1 initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }} className="text-5xl md:text-7xl font-extrabold tracking-tight leading-[1.1] mb-6">
          Fuel Your Business. <br/>
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600">Secure Your Future.</span>
        </motion.h1>
        
        <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }} className="text-lg text-slate-600 max-w-2xl mx-auto mb-10 leading-relaxed">
          From collateral-free loans to government grants, we help you navigate the complex funding landscape and get the capital you deserve.
        </motion.p>

        <PremiumMultiStepModal />
      </section>

      {/* 2. Premium Stats Strip */}
      <section className="border-y border-slate-200 bg-white py-12 relative z-10">
        <div className="container-page grid grid-cols-2 md:grid-cols-4 gap-8">
          {[
            { icon: Landmark, value: "₹500Cr+", label: "Capital Facilitated" },
            { icon: Users, value: "10,000+", label: "Happy Founders" },
            { icon: ShieldCheck, value: "100%", label: "Transparent Process" },
            { icon: TrendingUp, value: "98%", label: "Success Rate" },
          ].map((stat, i) => (
            <div key={i} className="text-center flex flex-col items-center">
              <div className="h-12 w-12 rounded-full bg-blue-50 flex items-center justify-center mb-3">
                <stat.icon className="h-6 w-6 text-blue-600" />
              </div>
              <p className="text-3xl font-extrabold text-slate-900">{stat.value}</p>
              <p className="text-sm font-bold text-slate-500 uppercase tracking-wide mt-1">{stat.label}</p>
            </div>
          ))}
        </div>
      </section>

      {/* 3. EMI Calculator Section */}
      <section className="py-24 container-page relative">
        {/* Background Glow */}
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[500px] bg-blue-100/50 rounded-full blur-[120px] -z-10 pointer-events-none" />
        
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-extrabold text-slate-900 mb-4">
            Plan Your <span className="text-blue-600">Repayment.</span>
          </h2>
          <p className="text-lg text-slate-600">Calculate your monthly EMI before you apply.</p>
        </div>
        <PremiumEMICalculator />
      </section>

      {/* 4. How It Works / Trust Building */}
      <section className="py-24 bg-slate-900 text-white relative overflow-hidden">
        <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10" />
        <div className="container-page relative z-10">
          <div className="text-center mb-16">
            <h2 className="text-4xl font-extrabold mb-4">Why Choose PrimeWealth?</h2>
            <p className="text-slate-400 max-w-2xl mx-auto">We don't just find you a loan; we act as your financial co-pilot.</p>
          </div>
          <div className="grid md:grid-cols-3 gap-8">
            {[
              { title: "Expert Matching", desc: "We match your business profile with the exact government scheme that will approve you.", icon: ShieldCheck },
              { title: "End-to-End Support", desc: "From project reports to bank visits, we handle the paperwork so you don't have to.", icon: Users },
              { title: "Fast Disbursal", desc: "Our direct tie-ups with banks ensure your loan is processed in record time.", icon: TrendingUp },
            ].map((feature, i) => (
              <div key={i} className="bg-white/5 border border-white/10 p-8 rounded-3xl hover:bg-white/10 transition-colors">
                <feature.icon className="h-10 w-10 text-blue-400 mb-6" />
                <h3 className="text-xl font-bold mb-3">{feature.title}</h3>
                <p className="text-slate-400 text-sm leading-relaxed">{feature.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

    </div>
  );
}
EOF
echo "✅ Funding Page rebuilt (Map removed, Premium sections added)."

echo "=========================================="
echo "🎉 PREMIUM FUNDING PAGE & MULTI-STEP FORM READY!"
echo "Ab 'rm -rf .next' aur 'npm run dev' chala kar dekho."
echo "=========================================="