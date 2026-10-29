#!/bin/bash

echo "🚀 Upgrading Funding Page to Premium 3D Experience..."

# ==========================================
# 1. Create Premium EMI Calculator Component
# ==========================================
mkdir -p src/components/ui
cat << 'EOF' > src/components/ui/PremiumEMICalculator.tsx
"use client";
import { useState } from "react";
import { motion, useMotionValue, useSpring, useTransform } from "motion/react";
import { IndianRupee, Percent, Calendar, TrendingUp } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function PremiumEMICalculator() {
  const [loanAmount, setLoanAmount] = useState(5000000);
  const [interestRate, setInterestRate] = useState(10.5);
  const [tenure, setTenure] = useState(5);

  const monthlyRate = interestRate / 12 / 100;
  const months = tenure * 12;
  const emi = (loanAmount * monthlyRate * Math.pow(1 + monthlyRate, months)) / (Math.pow(1 + monthlyRate, months) - 1);
  const totalPayment = emi * months;
  const totalInterest = totalPayment - loanAmount;

  const formatCurrency = (val: number) => {
    if (val >= 10000000) return `₹${(val / 10000000).toFixed(2)} Cr`;
    if (val >= 100000) return `₹${(val / 100000).toFixed(2)} Lakh`;
    return `₹${val.toLocaleString('en-IN')}`;
  };

  // 3D Tilt Effect
  const x = useMotionValue(0);
  const y = useMotionValue(0);
  const mouseXSpring = useSpring(x, { stiffness: 150, damping: 20 });
  const mouseYSpring = useSpring(y, { stiffness: 150, damping: 20 });
  const rotateX = useTransform(mouseYSpring, [-0.5, 0.5], ["5deg", "-5deg"]);
  const rotateY = useTransform(mouseXSpring, [-0.5, 0.5], ["-5deg", "5deg"]);

  const handleMouseMove = (e: React.MouseEvent<HTMLDivElement>) => {
    const rect = e.currentTarget.getBoundingClientRect();
    x.set((e.clientX - rect.left) / rect.width - 0.5);
    y.set((e.clientY - rect.top) / rect.height - 0.5);
  };

  return (
    <motion.div
      onMouseMove={handleMouseMove}
      onMouseLeave={() => { x.set(0); y.set(0); }}
      style={{ rotateX, rotateY, transformStyle: "preserve-3d" }}
      className="relative bg-white/70 backdrop-blur-2xl border border-slate-200/80 rounded-[2.5rem] p-8 md:p-12 shadow-[0_20px_60px_rgba(0,0,0,0.05)] hover:shadow-[0_30px_80px_rgba(37,99,235,0.15)] transition-all duration-500"
    >
      <div className="grid lg:grid-cols-2 gap-12 relative z-10" style={{ transform: "translateZ(30px)" }}>
        
        {/* Left: Inputs */}
        <div className="space-y-10">
          <div>
            <h3 className="text-3xl font-extrabold text-slate-900 mb-2">Calculate Your EMI</h3>
            <p className="text-slate-500 font-medium">Estimate your monthly loan payments.</p>
          </div>

          <div>
            <div className="flex justify-between items-center mb-4">
              <label className="text-sm font-bold text-slate-700 flex items-center gap-2"><IndianRupee className="h-4 w-4 text-blue-600"/> Loan Amount</label>
              <span className="text-2xl font-extrabold text-blue-600">{formatCurrency(loanAmount)}</span>
            </div>
            <input type="range" min="100000" max="20000000" step="100000" value={loanAmount} onChange={(e) => setLoanAmount(Number(e.target.value))} className="w-full h-2 bg-slate-200 rounded-lg appearance-none cursor-pointer accent-blue-600" />
          </div>

          <div>
            <div className="flex justify-between items-center mb-4">
              <label className="text-sm font-bold text-slate-700 flex items-center gap-2"><Percent className="h-4 w-4 text-blue-600"/> Interest Rate (p.a.)</label>
              <span className="text-2xl font-extrabold text-blue-600">{interestRate}%</span>
            </div>
            <input type="range" min="5" max="20" step="0.1" value={interestRate} onChange={(e) => setInterestRate(Number(e.target.value))} className="w-full h-2 bg-slate-200 rounded-lg appearance-none cursor-pointer accent-blue-600" />
          </div>

          <div>
            <div className="flex justify-between items-center mb-4">
              <label className="text-sm font-bold text-slate-700 flex items-center gap-2"><Calendar className="h-4 w-4 text-blue-600"/> Tenure (Years)</label>
              <span className="text-2xl font-extrabold text-blue-600">{tenure} Years</span>
            </div>
            <input type="range" min="1" max="15" step="1" value={tenure} onChange={(e) => setTenure(Number(e.target.value))} className="w-full h-2 bg-slate-200 rounded-lg appearance-none cursor-pointer accent-blue-600" />
          </div>
        </div>

        {/* Right: Results */}
        <div className="bg-gradient-to-br from-blue-600 to-indigo-700 rounded-3xl p-8 shadow-xl flex flex-col justify-center text-white relative overflow-hidden">
          <div className="absolute top-0 right-0 w-40 h-40 bg-white/10 rounded-full blur-2xl pointer-events-none" />
          <p className="text-sm font-bold text-blue-200 uppercase tracking-widest mb-2">Monthly EMI</p>
          <motion.p key={emi} initial={{ opacity: 0, y: 10 }} animate={{ opacity: 1, y: 0 }} className="text-5xl md:text-6xl font-extrabold mb-8 tracking-tight">
            ₹{isNaN(emi) ? "0" : Math.round(emi).toLocaleString('en-IN')}
          </motion.p>
          
          <div className="space-y-4 pt-6 border-t border-white/20">
            <div className="flex justify-between items-center"><p className="text-sm text-blue-200">Principal Amount</p><p className="font-bold text-white">{formatCurrency(loanAmount)}</p></div>
            <div className="flex justify-between items-center"><p className="text-sm text-blue-200">Total Interest</p><p className="font-bold text-yellow-300">{formatCurrency(totalInterest)}</p></div>
            <div className="flex justify-between items-center"><p className="text-sm text-blue-200">Total Payable</p><p className="font-bold text-green-300">{formatCurrency(totalPayment)}</p></div>
          </div>

          <div className="mt-8">
            <Button asChild className="w-full h-14 rounded-xl bg-white text-blue-700 font-bold text-lg hover:bg-slate-50 hover:scale-[1.02] transition-transform">
              <a href="#apply">Apply for this Loan</a>
            </Button>
          </div>
        </div>

      </div>
    </motion.div>
  );
}
EOF
echo "✅ PremiumEMICalculator created."

# ==========================================
# 2. Create Premium 3D Popup Form
# ==========================================
cat << 'EOF' > src/components/ui/Premium3DModal.tsx
"use client";
import { useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { X, ArrowRight, CheckCircle2, User, Mail, Phone, Building2 } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function Premium3DModal() {
  const [isOpen, setIsOpen] = useState(false);
  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setTimeout(() => setIsSubmitted(true), 1500);
  };

  return (
    <>
      <Button onClick={() => setIsOpen(true)} className="h-14 px-8 text-lg rounded-full bg-slate-900 hover:bg-black text-white font-bold shadow-xl hover:-translate-y-1 transition-all flex items-center gap-2">
        Start Your Application <ArrowRight className="h-5 w-5" />
      </Button>

      <AnimatePresence>
        {isOpen && (
          <motion.div 
            initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
            className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-md perspective-[1200px]"
          >
            <motion.div
              initial={{ opacity: 0, rotateX: 20, y: 50, scale: 0.9 }}
              animate={{ opacity: 1, rotateX: 0, y: 0, scale: 1 }}
              exit={{ opacity: 0, rotateX: -20, y: 50, scale: 0.9 }}
              transition={{ type: "spring", stiffness: 200, damping: 25 }}
              className="w-full max-w-lg bg-white rounded-[2.5rem] shadow-2xl overflow-hidden relative"
            >
              <button onClick={() => { setIsOpen(false); setIsSubmitted(false); }} className="absolute top-6 right-6 p-2 bg-slate-100 hover:bg-slate-200 rounded-full text-slate-600 transition-colors z-20">
                <X className="h-5 w-5" />
              </button>

              {isSubmitted ? (
                <div className="p-12 text-center bg-gradient-to-br from-blue-50 to-white">
                  <motion.div initial={{ scale: 0 }} animate={{ scale: 1 }} transition={{ type: "spring", delay: 0.2 }} className="h-24 w-24 rounded-full bg-green-100 flex items-center justify-center mx-auto mb-6">
                    <CheckCircle2 className="h-12 w-12 text-green-600" />
                  </motion.div>
                  <h2 className="text-3xl font-extrabold text-slate-900 mb-2">Application Received!</h2>
                  <p className="text-slate-500 font-medium">Our funding expert will contact you within 24 hours.</p>
                </div>
              ) : (
                <div className="p-8 md:p-10">
                  <div className="mb-8">
                    <p className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-2">Fast-Track Application</p>
                    <h2 className="text-3xl font-extrabold text-slate-900">Let's Get You Funded.</h2>
                  </div>
                  <form onSubmit={handleSubmit} className="space-y-4">
                    <div className="relative">
                      <User className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                      <input required type="text" placeholder="Full Name" className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all font-medium" />
                    </div>
                    <div className="relative">
                      <Mail className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                      <input required type="email" placeholder="Email Address" className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all font-medium" />
                    </div>
                    <div className="relative">
                      <Phone className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                      <input required type="tel" placeholder="Phone Number" className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all font-medium" />
                    </div>
                    <div className="relative">
                      <Building2 className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                      <select required className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all font-medium appearance-none">
                        <option value="">Select Service Needed</option>
                        <option value="cgtmse">CGTMSE Loan</option>
                        <option value="mudra">MUDRA Loan</option>
                        <option value="startup">Startup India Seed Fund</option>
                      </select>
                    </div>
                    <Button type="submit" className="w-full h-14 mt-4 rounded-xl bg-blue-600 hover:bg-blue-700 text-white font-bold text-lg shadow-lg">
                      Submit Application
                    </Button>
                  </form>
                </div>
              )}
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </>
  );
}
EOF
echo "✅ Premium3DModal created."

# ==========================================
# 3. Update Funding Page (Putting it all together)
# ==========================================
cat << 'EOF' > "src/app/(marketing)/funding/page.tsx"
"use client";
import { AnimatedIndiaMap } from "@/components/home/AnimatedIndiaMap";
import { PremiumEMICalculator } from "@/components/ui/PremiumEMICalculator";
import { Premium3DModal } from "@/components/ui/Premium3DModal";
import { motion } from "motion/react";

export default function FundingPage() {
  return (
    <div className="bg-white min-h-screen">
      
      {/* 1. The Interactive Map (Enego Style) */}
      <div className="bg-slate-50 border-b border-slate-200">
        <AnimatedIndiaMap />
      </div>

      {/* 2. Premium EMI Calculator Section */}
      <section className="py-24 container-page">
        <div className="text-center mb-16">
          <motion.p initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-2">FINANCIAL TOOLS</motion.p>
          <motion.h2 initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }} className="text-4xl md:text-5xl font-extrabold text-slate-900">
            Plan Your <span className="text-blue-600">Funding.</span>
          </motion.h2>
        </div>
        <PremiumEMICalculator />
      </section>

      {/* 3. 3D Popup Form CTA */}
      <section className="py-24 bg-slate-50 border-t border-slate-200 text-center">
        <div className="container-page">
          <h2 className="text-4xl font-extrabold text-slate-900 mb-4">Ready to secure your funds?</h2>
          <p className="text-lg text-slate-600 mb-8 max-w-xl mx-auto">Our experts are ready to guide you through the entire process.</p>
          <Premium3DModal />
        </div>
      </section>

    </div>
  );
}
EOF
echo "✅ Funding Page updated with all premium features."

echo "=========================================="
echo "🎉 PREMIUM FUNDING PAGE READY!"
echo "Ab terminal me 'rm -rf .next' aur 'npm run dev' chala kar dekho."
echo "=========================================="