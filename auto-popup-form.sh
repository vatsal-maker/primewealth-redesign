#!/bin/bash

echo "⏱️ Adding Auto-Popup Logic to Premium 3D Form..."

cat << 'EOF' > src/components/ui/Premium3DModal.tsx
"use client";
import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "motion/react";
import { X, ArrowRight, CheckCircle2, User, Mail, Phone, Building2 } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function Premium3DModal() {
  const [isOpen, setIsOpen] = useState(false);
  const [isSubmitted, setIsSubmitted] = useState(false);

  // Auto-Popup Logic
  useEffect(() => {
    // Check karo ki user ne pehle close toh nahi kiya
    const hasSeenPopup = sessionStorage.getItem("hasSeenFundingPopup");
    
    if (!hasSeenPopup) {
      // 7 seconds (7000ms) ka timer set karo
      const timer = setTimeout(() => {
        setIsOpen(true);
        // Ek baar popup aane ke baad session me save kar do
        sessionStorage.setItem("hasSeenFundingPopup", "true");
      }, 7000);
      
      return () => clearTimeout(timer);
    }
  }, []);

  const handleClose = () => {
    setIsOpen(false);
    setIsSubmitted(false);
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setTimeout(() => setIsSubmitted(true), 1500);
  };

  return (
    <>
      {/* Button (Agar user manually bhi kholna chahe toh) */}
      <Button onClick={() => setIsOpen(true)} className="h-14 px-8 text-lg rounded-full bg-slate-900 hover:bg-black text-white font-bold shadow-xl hover:-translate-y-1 transition-all flex items-center gap-2">
        Start Your Application <ArrowRight className="h-5 w-5" />
      </Button>

      <AnimatePresence>
        {isOpen && (
          <motion.div 
            initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
            className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-md perspective-[1200px]"
          >
            <motion.div
              initial={{ opacity: 0, rotateX: 20, y: 50, scale: 0.9 }}
              animate={{ opacity: 1, rotateX: 0, y: 0, scale: 1 }}
              exit={{ opacity: 0, rotateX: -20, y: 50, scale: 0.9 }}
              transition={{ type: "spring", stiffness: 200, damping: 25 }}
              className="w-full max-w-lg bg-white rounded-[2.5rem] shadow-2xl overflow-hidden relative"
            >
              <button onClick={handleClose} className="absolute top-6 right-6 p-2 bg-slate-100 hover:bg-slate-200 rounded-full text-slate-600 transition-colors z-20">
                <X className="h-5 w-5" />
              </button>

              {isSubmitted ? (
                <div className="p-12 text-center bg-gradient-to-br from-blue-50 to-white">
                  <motion.div initial={{ scale: 0 }} animate={{ scale: 1 }} transition={{ type: "spring", delay: 0.2 }} className="h-24 w-24 rounded-full bg-green-100 flex items-center justify-center mx-auto mb-6">
                    <CheckCircle2 className="h-12 w-12 text-green-600" />
                  </motion.div>
                  <h2 className="text-3xl font-extrabold text-slate-900 mb-2">Application Received!</h2>
                  <p className="text-slate-500 font-medium">Our funding expert will contact you within 24 hours.</p>
                  <Button onClick={handleClose} className="mt-8 bg-slate-900 text-white rounded-full">Close Window</Button>
                </div>
              ) : (
                <div className="p-8 md:p-10">
                  <div className="mb-8">
                    <p className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-2">Fast-Track Application</p>
                    <h2 className="text-3xl font-extrabold text-slate-900">Let's Get You Funded.</h2>
                  </div>
                  <form onSubmit={handleSubmit} className="space-y-4">
                    <div className="relative">
                      <User className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                      <input required type="text" placeholder="Full Name" className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all font-medium" />
                    </div>
                    <div className="relative">
                      <Mail className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                      <input required type="email" placeholder="Email Address" className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all font-medium" />
                    </div>
                    <div className="relative">
                      <Phone className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                      <input required type="tel" placeholder="Phone Number" className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all font-medium" />
                    </div>
                    <div className="relative">
                      <Building2 className="absolute left-4 top-3.5 h-5 w-5 text-slate-400" />
                      <select required className="w-full pl-12 pr-4 py-3 rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all font-medium appearance-none">
                        <option value="">Select Service Needed</option>
                        <option value="cgtmse">CGTMSE Loan</option>
                        <option value="mudra">MUDRA Loan</option>
                        <option value="startup">Startup India Seed Fund</option>
                      </select>
                    </div>
                    <Button type="submit" className="w-full h-14 mt-4 rounded-xl bg-blue-600 hover:bg-blue-700 text-white font-bold text-lg shadow-lg">
                      Submit Application
                    </Button>
                  </form>
                </div>
              )}
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </>
  );
}
EOF

echo "✅ Auto-popup timer (7 seconds) added to Premium3DModal!"

# Agar aapko ise Homepage par bhi lagana hai, toh bas ise page.tsx me import kar lena.
echo "=========================================="
echo "🎉 SUCCESS! Ab ye form 7 seconds baad automatic popup hoga."
echo "=========================================="