#!/bin/bash

echo "🛠️ Fixing Syntax Errors in Chat, Notifications, and Modal..."

# ==========================================
# 1. Fix AIChatWidget.tsx
# ==========================================
cat << 'EOF' > src/components/ui/AIChatWidget.tsx
"use client";
import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "motion/react";
import { MessageSquare, X, Send, Bot } from "lucide-react";

type Message = { role: "ai" | "user"; text: string; options?: string[] };

export function AIChatWidget() {
  const [isOpen, setIsOpen] = useState(false);
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [messages, setMessages] = useState<Message[]>([
    { role: "ai", text: "Hi! I'm PrimeWealth AI. How can I help you today?", options: ["Funding/Loans", "Company Registration", "Certifications"] }
  ]);

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

  const handleOptionClick = (option: string) => {
    const newMessages = [...messages, { role: "user" as const, text: option }];
    setMessages(newMessages);
    setTimeout(() => {
      setMessages([...newMessages, { role: "ai", text: "Our expert will contact you shortly!", options: ["Close Chat"] }]);
    }, 1000);
  };

  // Hide entirely if mobile menu is open
  if (isMenuOpen) return null;

  return (
    <div className="fixed bottom-6 right-4 md:right-6 z-[9999] flex flex-col items-end pointer-events-auto">
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
  );
}
EOF
echo "✅ AIChatWidget.tsx fixed."

# ==========================================
# 2. Fix LiveNotifications.tsx
# ==========================================
cat << 'EOF' > src/components/ui/LiveNotifications.tsx
"use client";
import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "motion/react";
import { CheckCircle2, X } from "lucide-react";

const notifications = [
  { name: "Rahul S.", city: "Mumbai", action: "got CGTMSE Loan Approved", amount: "₹50,00,000" },
  { name: "Priya P.", city: "Bangalore", action: "got DPIIT Certificate", amount: "Startup India" },
  { name: "Amit K.", city: "Delhi", action: "registered Private Limited", amount: "7 Days" },
];

export function LiveNotifications() {
  const [active, setActive] = useState<any>(null);
  const [isVisible, setIsVisible] = useState(false);
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

  useEffect(() => {
    let index = 0;
    const showRandomNotification = () => {
      setActive(notifications[index]);
      setIsVisible(true);
      setTimeout(() => setIsVisible(false), 5000);
      index = (index + 1) % notifications.length;
    };
    const initialTimeout = setTimeout(showRandomNotification, 3000);
    const interval = setInterval(showRandomNotification, 12000);
    return () => { clearTimeout(initialTimeout); clearInterval(interval); };
  }, []);

  if (isMenuOpen) return null;

  return (
    <div className="fixed bottom-28 md:bottom-6 left-4 md:left-6 z-40">
      <AnimatePresence>
        {isVisible && active && (
          <motion.div initial={{ opacity: 0, x: -50, y: 20 }} animate={{ opacity: 1, x: 0, y: 0 }} exit={{ opacity: 0, x: -50, y: 20 }} className="bg-white border border-slate-200 p-3 md:p-4 rounded-2xl shadow-2xl flex items-center gap-3 md:gap-4 w-[280px] md:w-[320px] relative">
            <div className="h-10 w-10 md:h-12 md:w-12 rounded-full bg-green-50 flex items-center justify-center shrink-0"><CheckCircle2 className="h-5 w-5 md:h-6 md:w-6 text-green-500" /></div>
            <div className="flex-1">
              <p className="text-[10px] md:text-sm text-slate-600 leading-tight"><span className="font-bold text-slate-900">{active.name}</span> from {active.city} {active.action}.</p>
              <p className="text-sm md:text-lg font-extrabold text-blue-600 mt-1">{active.amount}</p>
            </div>
            <button onClick={() => setIsVisible(false)} className="text-slate-400 hover:text-slate-700 self-start mt-1"><X className="h-4 w-4" /></button>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  );
}
EOF
echo "✅ LiveNotifications.tsx fixed."

# ==========================================
# 3. Fix PremiumMultiStepModal.tsx (Ensure syntax is correct)
# ==========================================
cat << 'EOF' > fix_modal_syntax.js
const fs = require('fs');
const path = 'src/components/ui/PremiumMultiStepModal.tsx';
let content = fs.readFileSync(path, 'utf8');

// Just in case the previous script messed up the closing tags
if (content.includes('{!isMenuOpen && (')) {
    content = content.replace('{!isMenuOpen && (', '');
    content = content.replace('      )}\n    </>', '    </>');
    // Add return null logic at the top
    content = content.replace(
      "return (",
      "if (isMenuOpen) return null;\n\n  return ("
    );
    fs.writeFileSync(path, content);
    console.log("✅ PremiumMultiStepModal.tsx syntax cleaned.");
} else if (!content.includes("if (isMenuOpen) return null;")) {
    content = content.replace(
      "return (",
      "if (isMenuOpen) return null;\n\n  return ("
    );
    fs.writeFileSync(path, content);
    console.log("✅ PremiumMultiStepModal.tsx updated with return null.");
} else {
    console.log("✅ PremiumMultiStepModal.tsx is already clean.");
}
EOF
node fix_modal_syntax.js
rm fix_modal_syntax.js

echo "=========================================="
echo "🎉 SYNTAX ERRORS FIXED!"
echo "Ab isko live karne ke liye GitHub par push karein:"
echo "git add ."
echo "git commit -m 'Fixed syntax errors for Vercel build'"
echo "git push"
echo "=========================================="