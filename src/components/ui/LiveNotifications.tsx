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

  return (
    <div className="floating-btn fixed bottom-28 md:bottom-6 left-4 md:left-6 z-40">
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
    )}
  );
}
