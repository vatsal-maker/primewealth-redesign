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
    <section className="py-24 bg-white relative overflow-hidden border-b border-slate-200">
      <div className="container-page">
        <div className="text-center mb-16">
          <motion.p initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-2">LIVE DASHBOARD</motion.p>
          <motion.h2 initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: 0.1 }} className="text-4xl md:text-5xl font-extrabold text-brand-navy">
            Real-time <span className="text-brand-gold">Funding Activity.</span>
          </motion.h2>
        </div>

        <div className="grid lg:grid-cols-2 gap-8">
          
          {/* LEFT: Live Animated Chart */}
          <motion.div initial={{ opacity: 0, x: -30 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }} className="bg-slate-50 border border-slate-200 rounded-[2.5rem] p-8 md:p-12 relative overflow-hidden shadow-sm">
            <div className="flex justify-between items-start mb-12 relative z-10">
              <div>
                <p className="text-sm font-bold text-slate-500 uppercase tracking-widest mb-1">Total Disbursed (This Month)</p>
                <h3 className="text-5xl font-extrabold tracking-tight text-brand-navy">₹42.5 Cr<span className="text-green-500 text-2xl ml-3">+18.2%</span></h3>
              </div>
              <div className="h-12 w-12 rounded-xl bg-brand-navy flex items-center justify-center">
                <TrendingUp className="h-6 w-6 text-brand-gold" />
              </div>
            </div>

            <div className="relative h-[200px] w-full mt-8">
              <svg viewBox="0 0 500 200" className="w-full h-full overflow-visible" preserveAspectRatio="none">
                <defs>
                  <linearGradient id="chartGradient" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stopColor="#D4AF37" stopOpacity="0.4" />
                    <stop offset="100%" stopColor="#D4AF37" stopOpacity="0" />
                  </linearGradient>
                </defs>
                <motion.path 
                  d="M 0 180 Q 50 160 100 170 T 200 120 T 300 140 T 400 60 T 500 30 L 500 200 L 0 200 Z" 
                  fill="url(#chartGradient)" 
                  initial={{ opacity: 0 }} whileInView={{ opacity: 1 }} transition={{ duration: 1.5, delay: 0.5 }} 
                />
                <motion.path 
                  d="M 0 180 Q 50 160 100 170 T 200 120 T 300 140 T 400 60 T 500 30" 
                  fill="none" stroke="#D4AF37" strokeWidth="4" strokeLinecap="round" 
                  initial={{ pathLength: 0 }} whileInView={{ pathLength: 1 }} transition={{ duration: 2, ease: "easeInOut" }} 
                />
                <motion.circle 
                  cx="500" cy="30" r="6" fill="#D4AF37" 
                  animate={{ scale: [1, 2, 1], opacity: [1, 0.5, 1] }} transition={{ repeat: Infinity, duration: 2 }} 
                />
              </svg>
            </div>

            <div className="grid grid-cols-2 gap-4 mt-12 relative z-10">
              <div className="bg-white border border-slate-200 p-5 rounded-2xl">
                <p className="text-xs text-slate-500 font-bold uppercase tracking-wider mb-1">Approved Loans</p>
                <p className="text-2xl font-extrabold text-brand-navy">1,248</p>
              </div>
              <div className="bg-white border border-slate-200 p-5 rounded-2xl">
                <p className="text-xs text-slate-500 font-bold uppercase tracking-wider mb-1">Avg. Approval Time</p>
                <p className="text-2xl font-extrabold text-brand-navy">45 Days</p>
              </div>
            </div>
          </motion.div>

          {/* RIGHT: Live Activity Ticker */}
          <motion.div initial={{ opacity: 0, x: 30 }} whileInView={{ opacity: 1, x: 0 }} viewport={{ once: true }} className="bg-white border border-slate-200 rounded-[2.5rem] p-8 flex flex-col justify-between shadow-sm">
            <div>
              <div className="flex items-center gap-3 mb-8">
                <div className="h-3 w-3 rounded-full bg-green-500 animate-pulse" />
                <h3 className="text-xl font-bold text-brand-navy">Live Approvals</h3>
              </div>
              
              <div className="space-y-4">
                {recentApprovals.map((item, i) => (
                  <motion.div 
                    key={i} initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: i * 0.1 }}
                    className="bg-slate-50 border border-slate-100 p-4 rounded-2xl flex items-center justify-between shadow-sm hover:shadow-md transition-shadow group"
                  >
                    <div className="flex items-center gap-4">
                      <div className="h-10 w-10 rounded-full bg-brand-gold/10 flex items-center justify-center text-brand-gold font-bold">
                        {item.name[0]}
                      </div>
                      <div>
                        <p className="font-bold text-brand-navy text-sm">{item.name} <span className="text-slate-400 font-normal">from</span> {item.city}</p>
                        <p className="text-xs text-slate-500 mt-0.5">{item.type}</p>
                      </div>
                    </div>
                    <div className="text-right">
                      <p className="font-bold text-brand-gold">{item.amount}</p>
                      <p className="text-[10px] text-green-600 font-bold uppercase tracking-wider flex items-center justify-end gap-1">
                        <CheckCircle2 className="h-3 w-3" /> Approved
                      </p>
                    </div>
                  </motion.div>
                ))}
              </div>
            </div>

            <div className="mt-8 pt-6 border-t border-slate-200 flex items-center justify-between text-sm text-slate-500 font-medium">
              <span className="flex items-center gap-2"><ShieldCheck className="h-4 w-4 text-brand-gold" /> 100% Secure</span>
              <span className="flex items-center gap-2"><Clock className="h-4 w-4 text-brand-gold" /> Updated Live</span>
            </div>
          </motion.div>

        </div>
      </div>
    </section>
  );
}
