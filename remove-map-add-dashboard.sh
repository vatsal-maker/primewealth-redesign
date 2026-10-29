#!/bin/bash

echo "🗑️ Removing Map & Adding Live Premium Dashboard..."

# ==========================================
# 1. Create Live Funding Dashboard Component
# ==========================================
cat << 'EOF' > src/components/home/LiveFundingDashboard.tsx
"use client";
import { motion } from "motion/react";
import { TrendingUp, CheckCircle2, ShieldCheck, ArrowUpRight, IndianRupee, Clock } from "lucide-react";

const recentApprovals = [
  { name: "Rahul S.", city: "Mumbai", type: "CGTMSE Loan", amount: "₹50,00,000" },
  { name: "Priya P.", city: "Bangalore", type: "Startup India", amount: "DPIIT Certified" },
  { name: "Amit K.", city: "Delhi", type: "Pvt Ltd Reg", amount: "₹7,999" },
  { name: "Neha G.", city: "Ahmedabad", type: "PMEGP Subsidy", amount: "₹15,00,000" },
  { name: "Vikram R.", city: "Pune", type: "MUDRA Loan", amount: "₹10,00,000" },
];

export function LiveFundingDashboard() {
  return (
    <section className="py-24 bg-white relative overflow-hidden">
      {/* Background Blur */}
      <div className="absolute top-1/2 left-0 w-[500px] h-[500px] bg-blue-100/50 rounded-full blur-[100px] -z-10 pointer-events-none" />

      <div className="container-page">
        <div className="text-center mb-16">
          <motion.p initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-2">LIVE DASHBOARD</motion.p>
          <motion.h2 initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.1 }} className="text-4xl md:text-5xl font-extrabold text-slate-900">
            Real-time <span className="text-blue-600">Funding Activity.</span>
          </motion.h2>
        </div>

        <div className="grid lg:grid-cols-2 gap-8">
          
          {/* LEFT: Live Animated Chart */}
          <motion.div initial={{ opacity: 0, x: -30 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }} className="bg-slate-900 rounded-[2.5rem] p-8 md:p-12 text-white relative overflow-hidden shadow-2xl">
            <div className="absolute top-0 right-0 w-64 h-64 bg-blue-500/20 rounded-full blur-3xl" />
            
            <div className="flex justify-between items-start mb-12 relative z-10">
              <div>
                <p className="text-sm font-bold text-slate-400 uppercase tracking-widest mb-1">Total Disbursed (This Month)</p>
                <h3 className="text-5xl font-extrabold tracking-tight">₹42.5 Cr<span className="text-green-400 text-2xl ml-3">+18.2%</span></h3>
              </div>
              <div className="h-12 w-12 rounded-xl bg-white/10 flex items-center justify-center">
                <TrendingUp className="h-6 w-6 text-green-400" />
              </div>
            </div>

            {/* SVG Chart */}
            <div className="relative h-[200px] w-full mt-8">
              <svg viewBox="0 0 500 200" className="w-full h-full overflow-visible" preserveAspectRatio="none">
                <defs>
                  <linearGradient id="chartGradient" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stopColor="#3B82F6" stopOpacity="0.4" />
                    <stop offset="100%" stopColor="#3B82F6" stopOpacity="0" />
                  </linearGradient>
                </defs>
                {/* Animated Area */}
                <motion.path 
                  d="M 0 180 Q 50 160 100 170 T 200 120 T 300 140 T 400 60 T 500 30 L 500 200 L 0 200 Z" 
                  fill="url(#chartGradient)" 
                  initial={{ opacity: 0 }} 
                  whileInView={{ opacity: 1 }} 
                  transition={{ duration: 1.5, delay: 0.5 }} 
                />
                {/* Animated Line */}
                <motion.path 
                  d="M 0 180 Q 50 160 100 170 T 200 120 T 300 140 T 400 60 T 500 30" 
                  fill="none" 
                  stroke="#3B82F6" 
                  strokeWidth="4" 
                  strokeLinecap="round" 
                  initial={{ pathLength: 0 }} 
                  whileInView={{ pathLength: 1 }} 
                  transition={{ duration: 2, ease: "easeInOut" }} 
                />
                {/* Pulsing Dot */}
                <motion.circle 
                  cx="500" cy="30" r="6" fill="#3B82F6" 
                  animate={{ scale: [1, 2, 1], opacity: [1, 0.5, 1] }} 
                  transition={{ repeat: Infinity, duration: 2 }} 
                />
              </svg>
            </div>

            <div className="grid grid-cols-2 gap-4 mt-12 relative z-10">
              <div className="bg-white/5 border border-white/10 p-5 rounded-2xl">
                <p className="text-xs text-slate-400 font-bold uppercase tracking-wider mb-1">Approved Loans</p>
                <p className="text-2xl font-extrabold">1,248</p>
              </div>
              <div className="bg-white/5 border border-white/10 p-5 rounded-2xl">
                <p className="text-xs text-slate-400 font-bold uppercase tracking-wider mb-1">Avg. Approval Time</p>
                <p className="text-2xl font-extrabold">14 Days</p>
              </div>
            </div>
          </motion.div>

          {/* RIGHT: Live Activity Ticker */}
          <motion.div initial={{ opacity: 0, x: 30 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }} className="bg-slate-50 border border-slate-200 rounded-[2.5rem] p-8 flex flex-col justify-between shadow-xl">
            <div>
              <div className="flex items-center gap-3 mb-8">
                <div className="h-3 w-3 rounded-full bg-green-500 animate-pulse" />
                <h3 className="text-xl font-bold text-slate-900">Live Approvals</h3>
              </div>
              
              <div className="space-y-4">
                {recentApprovals.map((item, i) => (
                  <motion.div 
                    key={i}
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    transition={{ delay: i * 0.1 }}
                    className="bg-white border border-slate-100 p-4 rounded-2xl flex items-center justify-between shadow-sm hover:shadow-md transition-shadow group"
                  >
                    <div className="flex items-center gap-4">
                      <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center text-blue-600 font-bold">
                        {item.name[0]}
                      </div>
                      <div>
                        <p className="font-bold text-slate-900 text-sm">{item.name} <span className="text-slate-400 font-normal">from</span> {item.city}</p>
                        <p className="text-xs text-slate-500 mt-0.5">{item.type}</p>
                      </div>
                    </div>
                    <div className="text-right">
                      <p className="font-bold text-blue-600">{item.amount}</p>
                      <p className="text-[10px] text-green-600 font-bold uppercase tracking-wider flex items-center justify-end gap-1">
                        <CheckCircle2 className="h-3 w-3" /> Approved
                      </p>
                    </div>
                  </motion.div>
                ))}
              </div>
            </div>

            <div className="mt-8 pt-6 border-t border-slate-200 flex items-center justify-between text-sm text-slate-500 font-medium">
              <span className="flex items-center gap-2"><ShieldCheck className="h-4 w-4 text-blue-600" /> 100% Secure</span>
              <span className="flex items-center gap-2"><Clock className="h-4 w-4 text-blue-600" /> Updated Live</span>
            </div>
          </motion.div>

        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ LiveFundingDashboard created."

# ==========================================
# 2. Update Funding Page (Remove Map, Add Dashboard)
# ==========================================
cat << 'EOF' > "src/app/(marketing)/funding/page.tsx"
"use client";
import { PremiumEMICalculator } from "@/components/ui/PremiumEMICalculator";
import { PremiumMultiStepModal } from "@/components/ui/PremiumMultiStepModal";
import { LiveFundingDashboard } from "@/components/home/LiveFundingDashboard";
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

      {/* 2. Live Funding Dashboard (Replaced Map) */}
      <LiveFundingDashboard />

      {/* 3. EMI Calculator Section */}
      <section className="py-24 container-page relative bg-white border-y border-slate-200">
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[500px] bg-blue-100/50 rounded-full blur-[120px] -z-10 pointer-events-none" />
        
        <div className="text-center mb-16">
          <h2 className="text-4xl md:text-5xl font-extrabold text-slate-900 mb-4">
            Plan Your <span className="text-blue-600">Repayment.</span>
          </h2>
          <p className="text-lg text-slate-600">Calculate your monthly EMI before you apply.</p>
        </div>
        <PremiumEMICalculator />
      </section>

      {/* 4. Why Choose Us (Dark Theme Strip) */}
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

echo "✅ Funding Page updated (Map completely removed)."

echo "=========================================="
echo "🎉 MAP REMOVED & LIVE DASHBOARD ADDED!"
echo "Ab 'rm -rf .next' aur 'npm run dev' chala kar dekho."
echo "=========================================="