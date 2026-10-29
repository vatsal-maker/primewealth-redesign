"use client";
import { motion } from "motion/react";
import { homepageContent } from "@/shared/config/site";
import { CheckCircle2, Headset, RefreshCw, Gift } from "lucide-react";

const icons = [CheckCircle2, Headset, RefreshCw, Gift];

export function WhyChooseUs() {
  return (
    <section className="py-16 md:py-32 bg-slate-50 relative">
      <div className="container-page">
        <motion.div 
          initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ duration: 0.6 }}
          className="text-center mb-12 md:mb-24"
        >
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-4">WHY CHOOSE US</p>
          <h2 className="text-3xl md:text-5xl font-extrabold text-brand-navy tracking-tight">Key Benefits of Our <span className="text-brand-gold">Expert Consultation</span></h2>
        </motion.div>
        
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 max-w-6xl mx-auto">
          {homepageContent.whyChooseUs.map((item, i) => {
            const Icon = icons[i];
            return (
              <motion.div 
                key={i} 
                initial={{ opacity: 0, y: 30 }} 
                whileInView={{ opacity: 1, y: 0 }} 
                viewport={{ once: true, margin: "-50px" }} 
                transition={{ duration: 0.5, delay: i * 0.1 }} 
                className="relative bg-white border border-slate-200 p-6 md:p-8 rounded-3xl h-full hover:-translate-y-2 hover:shadow-xl transition-all duration-300 group"
              >
                <div className="w-12 h-12 md:w-14 md:h-14 rounded-2xl bg-slate-50 shadow-sm flex items-center justify-center mb-4 md:mb-6 border border-slate-100 group-hover:bg-brand-gold/10 group-hover:border-brand-gold/20 transition-colors">
                  <Icon className="h-6 w-6 md:h-7 md:w-7 text-brand-gold" />
                </div>
                <h3 className="font-bold text-lg md:text-xl text-brand-navy mb-2 md:mb-3 group-hover:text-brand-gold transition-colors">{item.title}</h3>
                <p className="text-xs md:text-sm text-slate-500 leading-relaxed">{item.desc}</p>
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
