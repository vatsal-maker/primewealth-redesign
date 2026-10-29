#!/bin/bash

echo "👑 Upgrading Hero Text to Ultra-Premium Version..."

cat << 'EOF' > src/components/home/Hero.tsx
"use client";
import Link from "next/link";
import { motion } from "motion/react";
import { ArrowRight, MessageCircle, Sparkles, CheckCircle2, User, Bot } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function Hero() {
  return (
    <section className="relative min-h-[95vh] flex items-center bg-white overflow-hidden pt-20 pb-20">
      
      {/* --- LIVE BACKGROUND ANIMATION (Blobs) --- */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none z-0">
        <div className="absolute top-0 -left-4 w-96 h-96 bg-blue-300 rounded-full mix-blend-multiply filter blur-[100px] opacity-40 animate-blob"></div>
        <div className="absolute top-0 -right-4 w-96 h-96 bg-cyan-300 rounded-full mix-blend-multiply filter blur-[100px] opacity-40 animate-blob animation-delay-2000"></div>
        <div className="absolute -bottom-8 left-20 w-96 h-96 bg-indigo-300 rounded-full mix-blend-multiply filter blur-[100px] opacity-40 animate-blob animation-delay-4000"></div>
      </div>

      {/* Background Text Watermark */}
      <div className="absolute inset-0 flex items-center justify-center opacity-[0.02] pointer-events-none select-none overflow-hidden z-0">
        <div className="flex whitespace-nowrap animate-marquee-slow text-[200px] font-extrabold text-slate-900 tracking-tighter">
          <span>PRIMEWEALTH ADVISORY</span>
          <span>PRIMEWEALTH ADVISORY</span>
        </div>
      </div>

      <div className="container-page relative z-10 grid lg:grid-cols-2 gap-16 items-center">
        
        {/* Left Side: Text Content */}
        <motion.div 
          initial="hidden" 
          animate="visible" 
          variants={{
            hidden: { opacity: 0 },
            visible: { opacity: 1, transition: { staggerChildren: 0.15 } }
          }} 
          className="flex flex-col justify-center"
        >
          
          {/* Top Badge */}
          <motion.div 
            variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }}
            className="inline-flex items-center gap-2 px-5 py-2.5 rounded-full bg-white/80 backdrop-blur-md border border-slate-200 text-sm font-bold text-slate-700 mb-8 w-fit shadow-[0_8px_30px_rgb(0,0,0,0.04)]"
          >
            <span className="text-xl">🇮🇳</span> Trusted by 1000+ Businesses Across India
          </motion.div>

          {/* Subheading */}
          <motion.p 
            variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }}
            className="text-xl sm:text-2xl font-bold text-slate-500 mb-2 tracking-wide uppercase"
          >
            Buland Sapno Ke Saath
          </motion.p>

          {/* Main Heading */}
          <motion.h1 
            variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }}
            className="text-6xl sm:text-7xl lg:text-[5.5rem] font-extrabold tracking-tight leading-[1.05] mb-4 text-slate-900 drop-shadow-sm"
          >
            PrimeWealth <br />
            <span className="text-gradient-blue">Advisory</span>
          </motion.h1>

          {/* Hindi Tagline & Multilingual */}
          <motion.div 
            variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }}
            className="flex items-center gap-4 mb-6"
          >
            <h2 className="text-2xl sm:text-3xl font-extrabold text-slate-800">
              आपकी सफलता, हमारी ज़िम्मेदारी
            </h2>
            <div className="h-6 w-px bg-slate-300 hidden sm:block"></div>
            <p className="text-sm font-bold text-slate-400 tracking-widest hidden sm:block">
              प्राइमवेल्थ | પ્રાઇમવેલ્થ
            </p>
          </motion.div>

          {/* Description */}
          <motion.p 
            variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }}
            className="text-lg text-slate-600 mb-8 max-w-lg leading-relaxed font-medium"
          >
            From Registration to Investor Pitch — We Power Every Stage of Your Business Journey.
          </motion.p>

          {/* Action Buttons */}
          <motion.div 
            variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }}
            className="flex flex-col sm:flex-row gap-4 mb-10"
          >
            <Button asChild size="lg" className="h-14 px-8 text-lg rounded-full bg-slate-900 hover:bg-black text-white font-bold transition-all shadow-[0_10px_40px_rgba(0,0,0,0.2)] hover:-translate-y-1">
              <Link href="/contact">Check My Eligibility <ArrowRight className="ml-2 h-5 w-5" /></Link>
            </Button>
            <Button asChild size="lg" className="h-14 px-8 text-lg rounded-full bg-green-500 hover:bg-green-600 text-white font-bold shadow-[0_10px_30px_rgba(34,197,94,0.3)] hover:-translate-y-1 transition-all">
              <a href="https://wa.me/919876543210" target="_blank"><MessageCircle className="mr-2 h-5 w-5" /> WhatsApp Us</a>
            </Button>
          </motion.div>

          {/* Trust Badge Bottom */}
          <motion.div 
            variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }}
            className="flex items-center gap-3 bg-white/60 backdrop-blur-sm border border-slate-200 p-3 pr-6 rounded-2xl w-fit shadow-sm"
          >
            <div className="h-10 w-10 bg-blue-50 rounded-xl flex items-center justify-center text-blue-600">
              <CheckCircle2 className="h-5 w-5" />
            </div>
            <div>
              <p className="text-[10px] font-bold text-blue-600 uppercase tracking-widest">Startup India</p>
              <p className="text-sm font-extrabold text-slate-800">DPIIT + Tax Exemption</p>
            </div>
          </motion.div>
        </motion.div>

        {/* Right Side: Image & Floating Chat Bubbles */}
        <div className="relative h-[550px] hidden lg:flex items-center justify-center">
          
          {/* Main Image Container */}
          <motion.div 
            initial={{ opacity: 0, scale: 0.95 }} animate={{ opacity: 1, scale: 1 }} transition={{ duration: 0.8, delay: 0.3 }}
            className="relative w-full max-w-[500px] h-full bg-slate-100 rounded-[3rem] border border-slate-200 overflow-hidden shadow-2xl flex items-center justify-center"
          >
            <img 
              src="https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=800&auto=format&fit=crop" 
              alt="Business Consultation" 
              className="object-cover w-full h-full opacity-95" 
            />
            <div className="absolute inset-0 bg-gradient-to-t from-slate-900/60 via-transparent to-transparent" />
          </motion.div>

          {/* Floating Chat Bubble 1 */}
          <motion.div 
            initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 0.8 }}
            className="absolute top-12 -left-8 z-20"
          >
            <motion.div animate={{ y: [0, -10, 0] }} transition={{ repeat: Infinity, duration: 4, ease: "easeInOut" }} className="bg-white px-5 py-3 rounded-2xl rounded-bl-none shadow-[0_15px_40px_rgba(0,0,0,0.1)] border border-slate-100 flex items-center gap-3">
              <div className="bg-slate-100 p-2 rounded-full"><User className="h-4 w-4 text-slate-600" /></div>
              <p className="text-sm font-bold text-slate-800">Need DPIIT + funding.</p>
            </motion.div>
          </motion.div>

          {/* Floating Chat Bubble 2 */}
          <motion.div 
            initial={{ opacity: 0, x: 30 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: 1 }}
            className="absolute bottom-24 -right-8 z-20"
          >
            <motion.div animate={{ y: [0, 10, 0] }} transition={{ repeat: Infinity, duration: 5, ease: "easeInOut", delay: 1 }} className="bg-blue-600 text-white px-5 py-3 rounded-2xl rounded-br-none shadow-[0_15px_40px_rgba(37,99,235,0.3)] border border-blue-500 flex items-center gap-3">
              <div className="bg-blue-500 p-2 rounded-full"><Bot className="h-4 w-4 text-white" /></div>
              <p className="text-sm font-bold">Are you registered yet?</p>
            </motion.div>
          </motion.div>

        </div>
      </div>
    </section>
  );
}
EOF

echo "✅ Hero Section updated with Ultra-Premium Text!"

echo "=========================================="
echo "🎉 SUCCESS! Hero section upgraded."
echo "Ab terminal me 'rm -rf .next' aur 'npm run dev' chala kar dekho."
echo "=========================================="