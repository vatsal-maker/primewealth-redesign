"use client";
import Link from "next/link";
import { motion, AnimatePresence } from "motion/react";
import { ArrowRight, MessageCircle, CheckCircle2, User, Bot, Sparkles } from "lucide-react";
import { Button } from "@/components/ui/Button";
import { useState, useEffect, useRef } from "react";

const chatScript = [
  { id: 1, sender: "user", text: "I need DPIIT + funding for my startup." },
  { id: 2, sender: "bot", text: "We can get you a CGTMSE loan up to ₹5 Cr in 15 days!" },
  { id: 3, sender: "user", text: "Wow, what about tax exemptions?" },
  { id: 4, sender: "bot", text: "Yes, 80-IAC gives you 100% tax holiday for 3 years." },
];

export function Hero() {
  const [stepIndex, setStepIndex] = useState(0);
  const [typedText, setTypedText] = useState("");
  
  const typingTimer = useRef<NodeJS.Timeout | null>(null);
  const nextStepTimer = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    if (stepIndex >= chatScript.length) {
      const resetTimer = setTimeout(() => {
        setStepIndex(0);
        setTypedText("");
      }, 3000);
      return () => clearTimeout(resetTimer);
    }

    const currentMsg = chatScript[stepIndex];
    let charIndex = 0;
    setTypedText("");

    const typeCharacter = () => {
      if (charIndex < currentMsg.text.length) {
        setTypedText(currentMsg.text.substring(0, charIndex + 1));
        charIndex++;
        typingTimer.current = setTimeout(typeCharacter, 40);
      } else {
        nextStepTimer.current = setTimeout(() => {
          setStepIndex((prev) => prev + 1);
        }, 2500);
      }
    };

    typeCharacter();
    return () => {
      if (typingTimer.current) clearTimeout(typingTimer.current);
      if (nextStepTimer.current) clearTimeout(nextStepTimer.current);
    };
  }, [stepIndex]);

  const currentSender = stepIndex < chatScript.length ? chatScript[stepIndex].sender : "user";

  return (
    <section className="relative min-h-[90vh] flex items-center bg-[#F8FAFC] overflow-hidden pt-10 pb-16 lg:pt-16 lg:pb-20">
      {/* Background Text */}
      <div className="absolute inset-0 flex items-center justify-center opacity-[0.03] pointer-events-none select-none overflow-hidden z-0">
        <div className="flex whitespace-nowrap animate-marquee-bg text-[120px] lg:text-[180px] font-extrabold text-brand-navy tracking-tighter">
          <span>DPIIT • GST • MSME • STARTUP INDIA • CGTMSE • MUDRA • ISO 9001 • </span>
          <span>DPIIT • GST • MSME • STARTUP INDIA • CGTMSE • MUDRA • ISO 9001 • </span>
        </div>
      </div>

      <div className="container-page relative z-10 grid lg:grid-cols-2 gap-10 lg:gap-16 items-center flex-col-reverse lg:flex-row">
        
        {/* Left Side: Text Content */}
        <motion.div initial="hidden" animate="visible" variants={{ hidden: { opacity: 0 }, visible: { opacity: 1, transition: { staggerChildren: 0.1 } } }} className="flex flex-col justify-center max-w-xl mx-auto lg:mx-0 text-center lg:text-left">
          
          <motion.div variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white border border-slate-200 text-[10px] md:text-xs font-bold text-brand-navy mb-4 md:mb-6 w-fit mx-auto lg:mx-0 shadow-sm">
            🇮🇳 Trusted by 1000+ Businesses Across India
          </motion.div>

          <motion.p variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="text-lg md:text-2xl font-bold text-slate-500 mb-1 md:mb-2 tracking-wide uppercase">
            Buland Sapno Ke Saath
          </motion.p>

          <motion.h1 variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="text-4xl sm:text-5xl lg:text-[5rem] font-extrabold tracking-tight leading-[1.1] mb-3 md:mb-4 text-brand-navy">
            PrimeWealth <br className="hidden lg:block" />
            <span className="text-gradient-gold">Advisory</span>
          </motion.h1>

          <motion.div variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="mb-4 md:mb-6">
            <h2 className="text-xl md:text-3xl font-extrabold text-brand-navy">
              आपकी सफलता, हमारी ज़िम्मेदारी
            </h2>
          </motion.div>

          <motion.p variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="text-sm md:text-lg text-slate-600 mb-2 md:mb-4 leading-relaxed max-w-lg mx-auto lg:mx-0">
            From Registration to Investor Pitch — We Power Every Stage of Your Business Journey.
          </motion.p>

          <motion.p variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="text-xs md:text-sm font-bold text-brand-gold tracking-widest mb-6 md:mb-8">
            प्राइमवेल्थ | પ્રાઇમવેલ્થ
          </motion.p>

          <motion.div variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="flex flex-col sm:flex-row gap-3 mb-6 md:mb-8 justify-center lg:justify-start">
            <Button onClick={() => window.dispatchEvent(new Event("open-eligibility-modal"))} size="lg" className="h-12 px-6 text-sm md:text-base rounded-full bg-brand-navy hover:bg-brand-navy-light text-white font-bold transition-all shadow-xl hover:-translate-y-1">
              Check Eligibility <ArrowRight className="ml-2 h-4 w-4 text-brand-gold" />
            </Button>
            <Button asChild size="lg" className="h-12 px-6 text-sm md:text-base rounded-full bg-[#25D366] hover:bg-[#1eb857] text-white font-bold shadow-md">
              <a href="https://wa.me/919879595434" target="_blank"><MessageCircle className="mr-2 h-4 w-4" /> WhatsApp</a>
            </Button>
          </motion.div>

          <motion.div variants={{ hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0 } }} className="hidden md:flex items-center gap-3 bg-white border border-slate-200 p-2.5 pr-5 rounded-2xl w-fit mx-auto lg:mx-0 shadow-sm">
            <div className="h-8 w-8 bg-brand-navy rounded-lg flex items-center justify-center text-brand-gold">
              <CheckCircle2 className="h-4 w-4" />
            </div>
            <div>
              <p className="text-[10px] font-bold text-brand-gold uppercase tracking-widest">Startup India</p>
              <p className="text-xs font-extrabold text-brand-navy">DPIIT + Tax Exemption</p>
            </div>
          </motion.div>
        </motion.div>

        {/* Right Side: 3D Image & Live Chat (Mobile Optimized) */}
        <div className="relative w-full h-[300px] md:h-[450px] lg:h-[550px] flex items-center justify-center mt-4 lg:mt-0">
          
          <motion.div initial={{ opacity: 0, scale: 0.9 }} animate={{ opacity: 1, scale: 1 }} transition={{ duration: 0.8 }} className="relative w-full h-full flex items-center justify-center z-10">
            <img 
              src="/hero-3d.png" 
              alt="PrimeWealth Consultation" 
              className="w-full h-full object-contain drop-shadow-2xl" 
            />
          </motion.div>

          {/* Chat Bubbles - Positioned safely above image on mobile, overlaying on desktop */}
          <div className="absolute inset-0 z-20 pointer-events-none">
            <AnimatePresence mode="wait">
              {stepIndex < chatScript.length && (
                <motion.div
                  key={stepIndex}
                  initial={{ opacity: 0, y: 15, scale: 0.9 }}
                  animate={{ opacity: 1, y: 0, scale: 1 }}
                  exit={{ opacity: 0, scale: 0.9, transition: { duration: 0.2 } }}
                  transition={{ type: "spring", stiffness: 300, damping: 25 }}
                  className={`absolute max-w-[200px] md:max-w-[240px] px-3 py-2 md:px-4 md:py-3 rounded-2xl text-[10px] md:text-sm font-bold shadow-xl border ${
                    currentSender === "user"
                      ? "bg-white text-brand-navy border-slate-200 rounded-bl-none -top-6 left-0 lg:left-4"
                      : "bg-brand-navy text-white border-brand-navy-light rounded-br-none top-4 right-0 lg:right-4"
                  }`}
                >
                  <div className="flex items-start gap-2">
                    {currentSender === "user" ? (
                      <User className="h-3 w-3 md:h-3.5 md:w-3.5 text-brand-gold shrink-0 mt-0.5"/>
                    ) : (
                      <Bot className="h-3 w-3 md:h-3.5 md:w-3.5 text-brand-gold shrink-0 mt-0.5"/>
                    )}
                    <div>
                      {typedText}
                      <motion.span animate={{ opacity: [1, 0, 1] }} transition={{ repeat: Infinity, duration: 0.8 }} className="inline-block w-1 h-3 ml-1 bg-current align-middle" />
                    </div>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>
          </div>
        </div>
      </div>
    </section>
  );
}
