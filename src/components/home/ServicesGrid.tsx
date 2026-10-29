"use client";
import Link from "next/link";
import { motion } from "motion/react";
import { serviceCategories } from "@/shared/config/site";
import { ArrowRight } from "lucide-react";

export function ServicesGrid() {
  return (
    <section className="py-32 bg-slate-50 relative overflow-hidden">
      <div className="container-page relative z-10">
        <motion.div 
          initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ duration: 0.6 }}
          className="text-center mb-24"
        >
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-4">SERVICES</p>
          <h2 className="text-4xl md:text-5xl font-extrabold text-brand-navy tracking-tight">
            Business Solutions for <span className="text-brand-gold">Startups & MSMEs</span>
          </h2>
        </motion.div>
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {serviceCategories.map((g, i) => (
            <motion.div 
              key={g.code} 
              initial={{ opacity: 0, y: 40 }} 
              whileInView={{ opacity: 1, y: 0 }} 
              viewport={{ once: true, margin: "-50px" }} 
              transition={{ duration: 0.5, delay: i * 0.1 }}
            >
              <Link href="/services">
                <div className="h-full bg-white border border-slate-200 p-8 rounded-[2rem] group cursor-pointer hover:border-brand-gold/50 hover:shadow-xl transition-all duration-300">
                  <h3 className="text-xl font-bold text-brand-navy mb-4 group-hover:text-brand-gold transition-colors">{g.code}</h3>
                  <p className="text-sm text-slate-500 leading-relaxed mb-8">{g.desc}</p>
                  <div className="flex items-center text-xs font-bold text-brand-gold uppercase tracking-wider">
                    Explore <ArrowRight className="ml-2 h-4 w-4 group-hover:translate-x-2 transition-transform" />
                  </div>
                </div>
              </Link>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
