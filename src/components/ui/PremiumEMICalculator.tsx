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
              <label className="text-sm font-bold text-slate-700 flex items-center gap-2"><IndianRupee className="h-4 w-4 text-brand-gold"/> Loan Amount</label>
              <span className="text-2xl font-extrabold text-brand-gold">{formatCurrency(loanAmount)}</span>
            </div>
            <input type="range" min="100000" max="20000000" step="100000" value={loanAmount} onChange={(e) => setLoanAmount(Number(e.target.value))} className="w-full h-2 bg-slate-200 rounded-lg appearance-none cursor-pointer accent-blue-600" />
          </div>

          <div>
            <div className="flex justify-between items-center mb-4">
              <label className="text-sm font-bold text-slate-700 flex items-center gap-2"><Percent className="h-4 w-4 text-brand-gold"/> Interest Rate (p.a.)</label>
              <span className="text-2xl font-extrabold text-brand-gold">{interestRate}%</span>
            </div>
            <input type="range" min="5" max="20" step="0.1" value={interestRate} onChange={(e) => setInterestRate(Number(e.target.value))} className="w-full h-2 bg-slate-200 rounded-lg appearance-none cursor-pointer accent-blue-600" />
          </div>

          <div>
            <div className="flex justify-between items-center mb-4">
              <label className="text-sm font-bold text-slate-700 flex items-center gap-2"><Calendar className="h-4 w-4 text-brand-gold"/> Tenure (Years)</label>
              <span className="text-2xl font-extrabold text-brand-gold">{tenure} Years</span>
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
