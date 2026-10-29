"use client";
import { motion } from "motion/react";
import { homepageContent } from "@/shared/config/site";
import { Star, Quote } from "lucide-react";

export function Testimonials() {
  return (
    <section className="py-32 bg-white overflow-hidden border-y border-slate-200">
      <div className="container-page mb-16 text-center">
        <motion.div initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }}>
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-2">TESTIMONIALS</p>
          <h2 className="text-4xl md:text-5xl font-extrabold text-brand-navy tracking-tight">
            Loved by <span className="text-brand-gold">founders.</span>
          </h2>
        </motion.div>
      </div>
      
      <div className="relative w-full flex overflow-x-hidden">
        <div className="absolute inset-y-0 left-0 w-32 bg-gradient-to-r from-white to-transparent z-10" />
        <div className="absolute inset-y-0 right-0 w-32 bg-gradient-to-l from-white to-transparent z-10" />
        
        <motion.div 
          className="flex gap-6 px-6"
          animate={{ x: ["0%", "-50%"] }}
          transition={{ repeat: Infinity, ease: "linear", duration: 35 }}
        >
          {[...homepageContent.testimonials, ...homepageContent.testimonials].map((t, i) => (
            <div key={i} className="w-[400px] shrink-0 bg-slate-50 border border-slate-200 p-8 rounded-3xl relative hover:bg-white hover:shadow-xl transition-all duration-300">
              <Quote className="absolute top-8 right-8 h-8 w-8 text-brand-gold/20" />
              <div className="flex gap-1 text-brand-gold mb-6">
                {[...Array(5)].map((_, j) => <Star key={j} className="h-4 w-4 fill-current" />)}
              </div>
              <p className="text-slate-700 text-base leading-relaxed mb-8 font-medium">"{t.quote}"</p>
              <div className="flex items-center gap-4">
                <div className="h-12 w-12 rounded-full bg-brand-navy flex items-center justify-center text-brand-gold font-bold text-lg">{t.author[0]}</div>
                <div>
                  <p className="font-bold text-brand-navy">{t.author}</p>
                  <p className="text-xs font-bold text-slate-500 uppercase tracking-wide">{t.role}</p>
                </div>
              </div>
            </div>
          ))}
        </motion.div>
      </div>
    </section>
  );
}
