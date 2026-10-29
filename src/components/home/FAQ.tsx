"use client";
import { useState } from "react";
import { motion, AnimatePresence } from "motion/react";
import { Plus, Minus } from "lucide-react";
import { homepageContent } from "@/shared/config/site";

export function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(0);

  return (
    <section className="py-32 bg-slate-50">
      <div className="container-page max-w-3xl mx-auto">
        <motion.div 
          initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ duration: 0.6 }}
          className="text-center mb-16"
        >
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-2">FAQS</p>
          <h2 className="text-4xl font-extrabold text-brand-navy">Frequently Asked Questions</h2>
        </motion.div>
        
        <div className="space-y-4">
          {homepageContent.faqs.map((faq, i) => (
            <motion.div 
              key={i}
              initial={{ opacity: 0, y: 20 }} 
              whileInView={{ opacity: 1, y: 0 }} 
              viewport={{ once: true }} 
              transition={{ duration: 0.4, delay: i * 0.1 }}
              className={`border rounded-2xl overflow-hidden transition-all duration-300 ${openIndex === i ? 'bg-white border-brand-gold shadow-md' : 'bg-white border-slate-200 hover:border-brand-gold/50'}`}
            >
              <button 
                className="w-full flex items-center justify-between p-6 text-left font-bold text-lg text-brand-navy" 
                onClick={() => setOpenIndex(openIndex === i ? null : i)}
              >
                {faq.q}
                <motion.div 
                  animate={{ rotate: openIndex === i ? 180 : 0 }}
                  transition={{ duration: 0.3 }}
                  className={`h-8 w-8 rounded-full flex items-center justify-center shrink-0 ${openIndex === i ? 'bg-brand-gold text-brand-navy' : 'bg-slate-100 text-slate-500'}`}
                >
                  {openIndex === i ? <Minus className="h-4 w-4" /> : <Plus className="h-4 w-4" />}
                </motion.div>
              </button>
              
              <AnimatePresence>
                {openIndex === i && (
                  <motion.div 
                    initial={{ height: 0, opacity: 0 }} 
                    animate={{ height: "auto", opacity: 1 }} 
                    exit={{ height: 0, opacity: 0 }} 
                    transition={{ duration: 0.3, ease: "easeInOut" }}
                    className="px-6 pb-6 text-slate-600 leading-relaxed"
                  >
                    {faq.a}
                  </motion.div>
                )}
              </AnimatePresence>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
