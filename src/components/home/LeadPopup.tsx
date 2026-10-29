"use client";
import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "motion/react";
import { X } from "lucide-react";
import { MultiStepForm } from "@/components/contact/MultiStepForm";

export function LeadPopup() {
  const [isOpen, setIsOpen] = useState(false);

  useEffect(() => {
    const timer = setTimeout(() => setIsOpen(true), 15000);
    return () => clearTimeout(timer);
  }, []);

  return (
    <AnimatePresence>
      {isOpen && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-black/80 backdrop-blur-md">
          <motion.div 
            initial={{ opacity: 0, scale: 0.9, rotateX: 10 }} 
            animate={{ opacity: 1, scale: 1, rotateX: 0 }} 
            exit={{ opacity: 0, scale: 0.9, rotateX: -10 }} 
            className="w-full max-w-2xl relative"
          >
            <button onClick={() => setIsOpen(false)} className="absolute -top-12 right-0 text-white hover:text-[#D4AF37] flex items-center gap-2 font-bold bg-white/10 px-4 py-2 rounded-full backdrop-blur-md transition-colors z-50">
              Close <X className="h-5 w-5" />
            </button>
            <MultiStepForm />
          </motion.div>
        </div>
      )}
    </AnimatePresence>
  );
}
