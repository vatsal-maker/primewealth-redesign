"use client";
import { useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { MAP_PATHS, FUNDS_DATA } from "@/shared/data/india-map-data";
import { Building2, Landmark, CheckCircle2, TrendingUp } from "lucide-react";

const stateNames: Record<string, string> = {
  gujarat: "Gujarat", maharashtra: "Maharashtra", karnataka: "Karnataka", delhi: "Delhi",
  tamilnadu: "Tamil Nadu", uttarpradesh: "Uttar Pradesh", rajasthan: "Rajasthan",
  madhyapradesh: "Madhya Pradesh", westbengal: "West Bengal", andhrapradesh: "Andhra Pradesh",
  telangana: "Telangana", kerala: "Kerala", odisha: "Odisha", bihar: "Bihar", assam: "Assam",
  punjab: "Punjab", haryana: "Haryana", himachalprades: "Himachal Pradesh", uttarakhand: "Uttarakhand",
  jammuandkashmi: "Jammu & Kashmir", ladakh: "Ladakh"
};

export function AnimatedIndiaMap() {
  const [selectedState, setSelectedState] = useState<string>("gujarat");
  const [industry, setIndustry] = useState<string>("all");

  const currentStateKey = selectedState in FUNDS_DATA.states ? selectedState : "default";
  const currentState = FUNDS_DATA.states[currentStateKey as keyof typeof FUNDS_DATA.states];
  
  const filteredItems = (currentState?.items || []).filter((item: any) => 
    industry === "all" || (item.i || []).includes(industry)
  );

  const centralItems = industry === "all" 
    ? Object.values(FUNDS_DATA.central).flat().filter(Boolean) as any[]
    : (FUNDS_DATA.central[industry as keyof typeof FUNDS_DATA.central] || []);

  return (
    <section className="py-24 bg-slate-50 relative overflow-hidden min-h-screen">
      <div className="container-page relative z-10">
        <div className="text-center mb-12">
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-2">LIVE FUNDING MAP</p>
          <h2 className="text-4xl md:text-5xl font-extrabold text-slate-900 mb-4">Explore <span className="text-brand-gold">Funding</span> by State.</h2>
        </div>

        <div className="flex flex-wrap items-center justify-center gap-3 mb-12">
          {Object.entries(FUNDS_DATA.ind).map(([key, label]) => (
            <button
              key={key}
              onClick={() => setIndustry(key)}
              className={`px-5 py-2.5 rounded-full text-sm font-bold transition-all duration-300 ${
                industry === key
                  ? "bg-blue-600 text-white shadow-md scale-105"
                  : "bg-white text-slate-600 border border-slate-200 hover:text-brand-gold hover:border-blue-300"
              }`}
            >
              {label as string}
            </button>
          ))}
        </div>

        <div className="grid lg:grid-cols-2 gap-12 items-start">
          
          <div className="bg-white border border-slate-200 rounded-[2.5rem] p-6 relative shadow-xl">
            <div className="relative w-full aspect-[1/1.1]">
              <svg viewBox="0 0 600 650" className="w-full h-full drop-shadow-sm">
                {Object.entries(MAP_PATHS).map(([id, d]) => {
                  const isSelected = selectedState === id;
                  const data = FUNDS_DATA.states[id as keyof typeof FUNDS_DATA.states];
                  let count = 0;
                  if (data) count = data.items.filter((i:any) => industry === "all" || i.i.includes(industry)).length;

                  let fill = "#E2E8F0"; // Light gray for 0
                  if (count === 1) fill = "#93C5FD"; // Light blue
                  if (count === 2) fill = "#60A5FA"; // Medium blue
                  if (count >= 3) fill = "#3B82F6"; // Dark blue
                  if (isSelected) fill = "#1D4ED8"; // Navy for selected

                  return (
                    <motion.path
                      key={id}
                      d={d}
                      fill={fill}
                      stroke="#FFFFFF"
                      strokeWidth="1.5"
                      className="cursor-pointer transition-all duration-300 outline-none hover:opacity-80"
                      onClick={() => setSelectedState(id)}
                    />
                  );
                })}
              </svg>
            </div>
            <div className="flex flex-wrap justify-center gap-4 mt-6 text-xs text-slate-500 bg-slate-50 py-3 rounded-xl border border-slate-200">
              <span className="flex items-center gap-1.5"><i className="w-3 h-3 rounded bg-[#E2E8F0] inline-block" /> 0</span>
              <span className="flex items-center gap-1.5"><i className="w-3 h-3 rounded bg-[#93C5FD] inline-block" /> 1</span>
              <span className="flex items-center gap-1.5"><i className="w-3 h-3 rounded bg-[#60A5FA] inline-block" /> 2</span>
              <span className="flex items-center gap-1.5"><i className="w-3 h-3 rounded bg-[#3B82F6] inline-block" /> 3+</span>
            </div>
          </div>

          <div className="bg-white border border-slate-200 rounded-[2.5rem] p-8 h-[700px] overflow-y-auto custom-scrollbar shadow-xl">
            <AnimatePresence mode="wait">
              <motion.div key={selectedState + industry} initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: -20 }} transition={{ duration: 0.3 }}>
                <h3 className="text-4xl font-extrabold text-slate-900 mb-2 capitalize">{stateNames[selectedState] || "India"}</h3>
                <p className="text-slate-500 mb-8">Reported state support and central funding options.</p>

                <div className="mb-8">
                  <h4 className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-4 flex items-center gap-2"><Building2 className="h-4 w-4" /> State Programmes ({filteredItems.length})</h4>
                  {filteredItems.length > 0 ? (
                    <div className="space-y-4">
                      {filteredItems.map((item: any, i: number) => (
                        <div key={i} className="bg-slate-50 border border-slate-200 p-5 rounded-2xl">
                          <div className="flex flex-wrap gap-2 mb-3">{(item.i || []).map((tag: string) => (<span key={tag} className="text-[10px] font-bold text-blue-700 bg-blue-100 px-2 py-1 rounded-md uppercase">{FUNDS_DATA.ind[tag as keyof typeof FUNDS_DATA.ind] || tag}</span>))}</div>
                          <p className="font-bold text-slate-900 text-lg mb-1">{item.t}</p>
                          <p className="text-sm text-slate-600">{item.d}</p>
                        </div>
                      ))}
                    </div>
                  ) : (<p className="text-sm text-slate-500 italic bg-slate-50 p-4 rounded-xl border border-slate-200">No specific state programme listed.</p>)}
                </div>

                <div className="mb-8">
                  <h4 className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-4 flex items-center gap-2"><Landmark className="h-4 w-4" /> Central Schemes</h4>
                  <div className="grid gap-3">
                    {centralItems.map((item: any, i: number) => (
                      <div key={i} className="bg-slate-50 p-4 rounded-xl border border-slate-200"><p className="font-bold text-slate-900 text-sm mb-1">{item.n}</p><p className="text-xs text-slate-600">{item.d}</p></div>
                    ))}
                  </div>
                </div>
              </motion.div>
            </AnimatePresence>
          </div>
        </div>
      </div>
    </section>
  );
}
