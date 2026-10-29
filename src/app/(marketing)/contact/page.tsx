"use client";
import { MultiStepForm } from "@/components/contact/MultiStepForm";
import { site } from "@/shared/config/site";
import { Phone, Mail, MapPin, Clock } from "lucide-react";
import { motion } from "motion/react";

export default function ContactPage() {
  return (
    <div className="bg-[#F8FAFC] min-h-screen pt-24 md:pt-32 pb-24 text-brand-navy relative overflow-hidden">
      <div className="container-page relative z-10">
        
        <div className="text-center mb-12 md:mb-16">
          <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="text-xs md:text-sm font-bold text-brand-gold uppercase tracking-widest mb-3 md:mb-4">CONTACT US</motion.p>
          <motion.h1 initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }} className="text-4xl md:text-6xl font-extrabold tracking-tight mb-4 md:mb-6 text-brand-navy">
            Let's Build Your <span className="text-brand-gold">Empire.</span>
          </motion.h1>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-5 gap-8 lg:gap-12 items-start max-w-6xl mx-auto">
          
          {/* Left Side: Contact Info */}
          <motion.div initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.2 }} className="lg:col-span-2 space-y-6 md:space-y-8 w-full">
            
            <div className="bg-white border border-slate-200 p-6 md:p-8 rounded-3xl shadow-sm">
              <h3 className="text-xl font-bold text-brand-navy mb-6">Direct Contact</h3>
              <ul className="space-y-6">
                <li className="flex items-start gap-4">
                  <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0"><Phone className="h-5 w-5 text-brand-gold" /></div>
                  <div className="overflow-hidden"><p className="text-sm text-slate-500 font-medium mb-1">Call Us</p><a href={`tel:${site.phone}`} className="text-base md:text-lg font-bold text-brand-navy hover:text-brand-gold transition-colors break-words">{site.phone}</a></div>
                </li>
                <li className="flex items-start gap-4">
                  <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0"><Mail className="h-5 w-5 text-brand-gold" /></div>
                  <div className="overflow-hidden"><p className="text-sm text-slate-500 font-medium mb-1">Email Us</p><a href={`mailto:${site.email}`} className="text-base md:text-lg font-bold text-brand-navy hover:text-brand-gold transition-colors break-words">{site.email}</a></div>
                </li>
                <li className="flex items-start gap-4">
                  <div className="h-10 w-10 rounded-full bg-blue-50 flex items-center justify-center shrink-0"><MapPin className="h-5 w-5 text-brand-gold" /></div>
                  <div><p className="text-sm text-slate-500 font-medium mb-1">Head Office</p><p className="text-sm font-medium text-slate-700 leading-relaxed">{site.address}</p></div>
                </li>
              </ul>
            </div>

            <div className="bg-white border border-slate-200 p-6 md:p-8 rounded-3xl flex items-center gap-4 shadow-sm">
              <Clock className="h-8 w-8 text-brand-gold shrink-0" />
              <div><p className="text-sm text-slate-500 font-medium">Working Hours</p><p className="text-sm md:text-base text-brand-navy font-bold">Mon - Sat, 9:30 AM - 6:30 PM</p></div>
            </div>
          </motion.div>

          {/* Right Side: Form */}
          <motion.div initial={{ opacity: 0, x: 30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.3 }} className="lg:col-span-3 w-full">
            <MultiStepForm />
          </motion.div>

        </div>
      </div>
    </div>
  );
}
