"use client";
import { motion } from "motion/react";
import { Building2, TrendingUp, ShieldCheck, Award } from "lucide-react";
import { homepageContent } from "@/shared/config/site";

const IconMap: Record<string, any> = { Building2, TrendingUp, ShieldCheck, Award };

export function BentoFeatures() {
  const features = homepageContent?.features || [];
  
  return (
    <section className="py-16 md:py-32 bg-white">
      <div className="container-page">
        <motion.div 
          initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ duration: 0.6 }}
          className="text-center mb-12 md:mb-20"
        >
          <h2 className="text-3xl md:text-4xl font-extrabold tracking-tight mb-4 text-brand-navy">What are you <span className="text-brand-gold">looking for?</span></h2>
          <p className="text-lg md:text-xl text-slate-500 max-w-2xl mx-auto">Choose a path and we will guide you through the relevant services.</p>
        </motion.div>
        
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          {features.map((f: any, i: number) => {
            const Icon = IconMap[f.icon] || Building2;
            return (
              <motion.div 
                key={f.title} 
                initial={{ opacity: 0, scale: 0.9, y: 20 }} 
                whileInView={{ opacity: 1, scale: 1, y: 0 }} 
                viewport={{ once: true }} 
                transition={{ duration: 0.5, delay: i * 0.1 }} 
                whileHover={{ y: -5 }}
                className="h-full rounded-3xl bg-slate-50 border border-slate-200 p-6 md:p-8 flex flex-col hover:shadow-xl hover:border-brand-gold/30 transition-all duration-300 group cursor-pointer"
              >
                <div className="h-10 w-10 md:h-12 md:w-12 rounded-2xl bg-white shadow-sm flex items-center justify-center text-brand-gold mb-4 md:mb-6 group-hover:scale-110 transition-all">
                  <Icon className="h-5 w-5 md:h-6 md:w-6" />
                </div>
                <div>
                  <h3 className="text-lg md:text-xl font-bold mb-2 text-brand-navy group-hover:text-brand-gold transition-colors">{f.title}</h3>
                  <p className="text-slate-500 text-xs md:text-sm">{f.desc}</p>
                </div>
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
