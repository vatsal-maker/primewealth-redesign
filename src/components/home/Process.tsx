"use client";
import { homepageContent } from "@/shared/config/site";
import { FileSearch, Users, FileCheck, Landmark } from "lucide-react";
import { motion } from "motion/react";

const icons = [FileSearch, Users, FileCheck, Landmark];

export function Process() {
  return (
    <section className="bg-white py-16 md:py-24 relative overflow-hidden">
      <div className="container-page">
        <motion.div 
          initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ duration: 0.6 }}
          className="text-center mb-12 md:mb-20"
        >
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-4">PROCESS</p>
          <h2 className="text-3xl md:text-5xl font-extrabold text-brand-navy tracking-tight">How We Secure Your <span className="text-brand-gold">Funding</span></h2>
        </motion.div>
        
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8 md:gap-8">
          {homepageContent.process.map((step, i) => {
            const Icon = icons[i];
            return (
              <motion.div 
                key={i} 
                initial={{ opacity: 0, y: 30 }} 
                whileInView={{ opacity: 1, y: 0 }} 
                viewport={{ once: true, margin: "-50px" }} 
                transition={{ duration: 0.5, delay: i * 0.1 }} 
                className="text-center group"
              >
                <div className="w-16 h-16 md:w-20 md:h-20 mx-auto rounded-2xl bg-slate-50 border border-slate-100 flex items-center justify-center mb-6 relative group-hover:bg-brand-gold/10 transition-colors duration-300">
                  <Icon className="h-6 w-6 md:h-8 md:w-8 text-brand-gold group-hover:scale-110 transition-transform duration-300" />
                  <div className="absolute -top-2 -right-2 md:-top-3 md:-right-3 w-7 h-7 md:w-8 md:h-8 rounded-full bg-brand-navy text-white text-xs md:text-sm font-bold flex items-center justify-center shadow-md border-2 border-white">{i + 1}</div>
                </div>
                <h3 className="text-lg md:text-xl font-bold text-brand-navy mb-2 group-hover:text-brand-gold transition-colors">{step.title}</h3>
                <p className="text-sm text-slate-500 leading-relaxed px-4 md:px-0">{step.desc}</p>
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
