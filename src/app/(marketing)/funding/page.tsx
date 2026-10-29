"use client";
import { PremiumEMICalculator } from "@/components/ui/PremiumEMICalculator";
import { PremiumMultiStepModal } from "@/components/ui/PremiumMultiStepModal";
import { LiveFundingDashboard } from "@/components/home/LiveFundingDashboard";
import { motion } from "motion/react";
import { ShieldCheck, TrendingUp, Users, Landmark, ArrowRight, Sparkles } from "lucide-react";
import { Button } from "@/components/ui/Button";

export default function FundingPage() {
  return (
    <div className="bg-[#F8FAFC] min-h-screen text-brand-navy overflow-hidden">
      
      <section className="relative pt-32 pb-24 px-6 flex flex-col items-center justify-center text-center">
        <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-[0.03] pointer-events-none" />
        <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[800px] h-[500px] bg-brand-gold/10 rounded-full blur-[120px] pointer-events-none" />

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-white border border-brand-gold/30 text-xs font-bold text-brand-navy mb-8 shadow-sm backdrop-blur-md relative z-10">
          <Landmark className="h-4 w-4 text-brand-gold" /> FUNDING & CAPITAL
        </motion.div>
        
        <motion.h1 initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }} className="text-5xl md:text-7xl font-extrabold tracking-tight leading-[1.1] mb-6 relative z-10">
          Fuel Your Business. <br/>
          <span className="text-gradient-gold drop-shadow-sm">Secure Your Future.</span>
        </motion.h1>
        
        <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }} className="text-lg md:text-xl text-slate-600 max-w-2xl mx-auto mb-12 leading-relaxed relative z-10 font-medium">
          From collateral-free loans to government grants, we help you navigate the complex funding landscape and get the capital you deserve.
        </motion.p>

        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }} className="relative z-10">
          <PremiumMultiStepModal />
        </motion.div>

        {/* Adjusted Floating Badges to prevent overlap */}
        <motion.div animate={{ y: [0, -10, 0] }} transition={{ repeat: Infinity, duration: 4, ease: "easeInOut" }} className="absolute top-40 left-10 md:left-24 bg-white px-4 py-3 rounded-2xl shadow-xl border border-slate-100 hidden xl:flex items-center gap-3 z-20">
          <div className="h-8 w-8 bg-brand-gold/10 rounded-lg flex items-center justify-center text-brand-gold"><ShieldCheck className="h-4 w-4"/></div>
          <div className="text-left"><p className="text-[10px] font-bold text-slate-500 uppercase">100% Secure</p><p className="text-sm font-bold text-brand-navy">Transparent Process</p></div>
        </motion.div>

        <motion.div animate={{ y: [0, 10, 0] }} transition={{ repeat: Infinity, duration: 5, ease: "easeInOut", delay: 1 }} className="absolute top-60 right-10 md:right-24 bg-white px-4 py-3 rounded-2xl shadow-xl border border-slate-100 hidden xl:flex items-center gap-3 z-20">
          <div className="h-8 w-8 bg-brand-gold/10 rounded-lg flex items-center justify-center text-brand-gold"><TrendingUp className="h-4 w-4"/></div>
          <div className="text-left"><p className="text-[10px] font-bold text-slate-500 uppercase">Fast Approval</p><p className="text-sm font-bold text-brand-navy">Within 45 Days</p></div>
        </motion.div>
      </section>

      <LiveFundingDashboard />

      <section className="py-24 container-page relative bg-white border-y border-slate-200">
        <div className="text-center mb-16">
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-2">FINANCIAL TOOLS</p>
          <h2 className="text-4xl md:text-5xl font-extrabold text-brand-navy mb-4">Plan Your <span className="text-brand-gold">Repayment.</span></h2>
        </div>
        <PremiumEMICalculator />
      </section>
    </div>
  );
}
