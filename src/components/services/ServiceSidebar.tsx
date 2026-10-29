"use client";
import { site, allServices } from "@/shared/config/site";
import { Button } from "@/components/ui/Button";
import { ChevronRight, Phone, MessageCircle, Clock, ShieldCheck } from "lucide-react";
import Link from "next/link";

export function ServiceSidebar({ service }: { service: any }) {
  const related = allServices.filter(s => s.category === service.category && s.slug !== service.slug).slice(0, 5);

  return (
    <aside className="space-y-6">
      
      {/* 1. Quick Enquiry */}
      <div className="bg-white border border-slate-200 rounded-2xl p-6 shadow-sm">
        <h3 className="text-xl font-bold text-brand-navy mb-4 flex items-center gap-2">
          <span className="w-2 h-2 rounded-full bg-brand-gold" /> Quick Enquiry
        </h3>
        <form className="space-y-3">
          <input type="text" placeholder="Your Name *" className="w-full bg-slate-50 border border-slate-200 rounded-lg px-4 py-2.5 text-brand-navy text-sm focus:outline-none focus:border-brand-gold" />
          <input type="tel" placeholder="Your Phone *" className="w-full bg-slate-50 border border-slate-200 rounded-lg px-4 py-2.5 text-brand-navy text-sm focus:outline-none focus:border-brand-gold" />
          <textarea placeholder="Your Query..." rows={3} className="w-full bg-slate-50 border border-slate-200 rounded-lg px-4 py-2.5 text-brand-navy text-sm focus:outline-none focus:border-brand-gold"></textarea>
          <Button className="w-full bg-brand-navy hover:bg-brand-navy-light text-white font-bold h-11 rounded-lg shadow-md">
            Submit Enquiry
          </Button>
          <p className="text-[10px] text-center text-slate-500 mt-2 flex items-center justify-center gap-1">
            <ShieldCheck className="h-3 w-3 text-green-500" /> Your info is safe with us
          </p>
        </form>
      </div>

      {/* 2. Quick Eligibility */}
      <div className="bg-white border border-slate-200 rounded-2xl p-6 shadow-sm">
        <h3 className="text-lg font-bold text-brand-navy mb-4 flex items-center gap-2">
          <span className="text-green-500">✅</span> Quick Eligibility
        </h3>
        <ul className="space-y-3 mb-5">
          {service.eligibility.slice(0, 4).map((e: string, i: number) => (
            <li key={i} className="flex items-start gap-2 text-xs text-slate-600">
              <span className="w-5 h-5 rounded-full bg-brand-gold/20 text-brand-navy flex items-center justify-center shrink-0 font-bold text-[10px]">{i+1}</span>
              {e}
            </li>
          ))}
        </ul>
        <Button onClick={() => window.dispatchEvent(new Event("open-eligibility-modal"))} className="w-full bg-brand-gold/10 text-brand-navy border border-brand-gold hover:bg-brand-gold transition-all h-10 rounded-lg text-sm font-bold">
      Check My Eligibility
    </Button>
      </div>

      {/* 3. Related Services */}
      <div className="bg-white border border-slate-200 rounded-2xl p-6 shadow-sm">
        <h3 className="text-lg font-bold text-brand-navy mb-4 flex items-center gap-2">
          <span className="text-brand-gold">🔗</span> Related Services
        </h3>
        <ul className="space-y-2">
          {related.map((s) => (
            <li key={s.slug}>
              <Link href={`/services/${s.slug}`} className="flex items-center justify-between text-sm text-slate-600 hover:text-brand-gold py-2 border-b border-slate-100 last:border-0 transition-colors">
                {s.name} <ChevronRight className="h-4 w-4" />
              </Link>
            </li>
          ))}
        </ul>
      </div>

      {/* 4. Contact Us */}
      <div className="bg-brand-navy border border-brand-navy-light rounded-2xl p-6 shadow-xl text-white">
        <h3 className="text-lg font-bold mb-4 flex items-center gap-2">
          <span className="text-brand-gold">📞</span> Contact Us
        </h3>
        <div className="space-y-3">
          <a href={`tel:${site.phone}`} className="flex items-center gap-3 text-sm text-slate-300 hover:text-white bg-white/5 p-3 rounded-lg">
            <Phone className="h-4 w-4 text-brand-gold" /> {site.phone}
          </a>
          <a href={site.whatsapp} target="_blank" className="flex items-center gap-3 text-sm text-white bg-green-600 hover:bg-green-700 p-3 rounded-lg transition-colors font-bold">
            <MessageCircle className="h-4 w-4" /> WhatsApp Now
          </a>
          <p className="text-xs text-slate-400 text-center flex items-center justify-center gap-1 mt-2">
            <Clock className="h-3 w-3" /> Mon-Sat: 9:30 AM – 6:30 PM
          </p>
        </div>
      </div>

    </aside>
  );
}
