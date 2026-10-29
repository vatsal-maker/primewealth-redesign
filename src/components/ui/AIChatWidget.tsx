"use client";
import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "motion/react";
import { MessageSquare, X, Send, Bot } from "lucide-react";

type Message = { role: "ai" | "user"; text: string; options?: string[] };

export function AIChatWidget() {
  const [isOpen, setIsOpen] = useState(false);
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  useEffect(() => {
    const handleMenuOpen = () => setIsMenuOpen(true);
    const handleMenuClose = () => setIsMenuOpen(false);
    window.addEventListener("mobileMenuOpened", handleMenuOpen);
    window.addEventListener("mobileMenuClosed", handleMenuClose);
    return () => {
      window.removeEventListener("mobileMenuOpened", handleMenuOpen);
      window.removeEventListener("mobileMenuClosed", handleMenuClose);
    };
  }, []);
  const [messages, setMessages] = useState<Message[]>([
    { role: "ai", text: "Hi! I'm PrimeWealth AI. How can I help you today?", options: ["Funding/Loans", "Company Registration", "Certifications"] }
  ]);

  const handleOptionClick = (option: string) => {
    const newMessages = [...messages, { role: "user" as const, text: option }];
    setMessages(newMessages);
    setTimeout(() => {
      setMessages([...newMessages, { role: "ai", text: "Our expert will contact you shortly!", options: ["Close Chat"] }]);
    }, 1000);
  };

  return (
    <div className="fixed bottom-4 md:bottom-6 right-4 md:right-6 z-[9999] flex flex-col items-end pointer-events-auto">
      <AnimatePresence>
        {isOpen && (
          <motion.div initial={{ opacity: 0, y: 20, scale: 0.95 }} animate={{ opacity: 1, y: 0, scale: 1 }} exit={{ opacity: 0, y: 20, scale: 0.95 }} className="bg-white border border-slate-200 rounded-2xl shadow-2xl w-[350px] overflow-hidden mb-4 flex flex-col">
            <div className="bg-slate-50 p-4 flex items-center justify-between border-b border-slate-200">
              <div className="flex items-center gap-3">
                <div className="h-8 w-8 rounded-full bg-brand-navy flex items-center justify-center"><Bot className="h-5 w-5 text-brand-gold" /></div>
                <div>
                  <p className="text-sm font-bold text-brand-navy">PrimeWealth AI</p>
                  <p className="text-[10px] text-green-600 flex items-center gap-1"><span className="w-1.5 h-1.5 rounded-full bg-green-500 animate-pulse" /> Online</p>
                </div>
              </div>
              <button onClick={() => setIsOpen(false)} className="text-slate-400 hover:text-slate-700"><X className="h-5 w-5" /></button>
            </div>
            <div className="p-4 h-[300px] overflow-y-auto flex flex-col gap-4 custom-scrollbar bg-white">
              {messages.map((msg, i) => (
                <div key={i} className={`flex ${msg.role === "user" ? "justify-end" : "justify-start"}`}>
                  <div className={`max-w-[80%] p-3 rounded-xl text-sm ${msg.role === "user" ? "bg-brand-navy text-white rounded-tr-sm" : "bg-slate-100 text-slate-800 border border-slate-200 rounded-tl-sm"}`}>{msg.text}</div>
                </div>
              ))}
              {messages[messages.length - 1].options && (
                <div className="flex flex-wrap gap-2 mt-2">
                  {messages[messages.length - 1].options?.map((opt) => (
                    <button key={opt} onClick={() => handleOptionClick(opt)} className="text-xs bg-white border border-slate-200 hover:border-brand-gold hover:text-brand-gold text-slate-700 px-3 py-1.5 rounded-full transition-colors">{opt}</button>
                  ))}
                </div>
              )}
            </div>
          </motion.div>
        )}
      </AnimatePresence>
      <motion.button whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }} onClick={() => setIsOpen(!isOpen)} className="h-16 w-16 bg-brand-navy rounded-full flex items-center justify-center shadow-[0_10px_30px_rgba(10,25,47,0.4)] relative">
        {isOpen ? <X className="h-7 w-7 text-white" /> : <MessageSquare className="h-7 w-7 text-brand-gold" />}
      </motion.button>
    </div>
    )}
  );
}
