"use client";
import { homepageContent } from "@/shared/config/site";
import { motion } from "motion/react";

export function Stats() {
  return (
    <section className="py-8 md:py-12 border-b border-slate-200 bg-white">
      <div className="container-page grid grid-cols-2 md:grid-cols-4 gap-4 md:gap-8">
        {homepageContent.stats.map((s, i) => (
          <motion.div 
            key={i} 
            initial={{ opacity: 0, scale: 0.8 }} 
            whileInView={{ opacity: 1, scale: 1 }} 
            viewport={{ once: true }} 
            transition={{ duration: 0.5, delay: i * 0.1 }}
            className="text-center"
          >
            <p className="text-3xl md:text-4xl font-extrabold text-brand-gold mb-1 md:mb-2">{s.value}{s.suffix}</p>
            <p className="text-[10px] md:text-xs font-bold text-slate-500 uppercase tracking-widest">{s.label}</p>
          </motion.div>
        ))}
      </div>
    </section>
  );
}
