import Link from "next/link";
import { site, allServices } from "@/shared/config/site";
import { ArrowRight, Mail, Phone, MapPin } from "lucide-react";

export function Footer() {
  return (
    <footer className="bg-brand-navy pt-20 border-t border-white/10 relative z-10">
      <div className="container-page grid md:grid-cols-2 lg:grid-cols-5 gap-12 pb-16">
        <div className="lg:col-span-2">
          <Link href="/" className="flex items-center mb-8 w-fit bg-white rounded-xl p-2">
            <div className="relative h-14 w-44 md:h-16 md:w-56 flex items-center justify-start">
              <img src="/logo.png" alt="PrimeWealth Advisory" className="w-full h-full object-contain object-left" />
            </div>
          </Link>
          <p className="text-sm text-slate-400 mb-8 leading-relaxed max-w-sm">Empowering Indian founders with end-to-end business setup, funding, and compliance solutions.</p>
          <div className="space-y-4 text-sm text-slate-300">
            <p className="flex items-start gap-3"><MapPin className="h-5 w-5 text-brand-gold shrink-0" /> {site.address}</p>
            <p className="flex items-center gap-3"><Phone className="h-4 w-4 text-brand-gold" /> {site.phone}</p>
            <p className="flex items-center gap-3"><Mail className="h-4 w-4 text-brand-gold" /> {site.email}</p>
          </div>
        </div>
        <div>
          <h4 className="text-white font-bold mb-6">Services</h4>
          <ul className="space-y-3 text-sm">
            {allServices.slice(0, 6).map((s) => (
              <li key={s.slug}><Link href={`/services/${s.slug}`} className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> {s.name}</Link></li>
            ))}
          </ul>
        </div>
        <div>
          <h4 className="text-white font-bold mb-6">Company</h4>
          <ul className="space-y-3 text-sm">
            {/* FIXED LINKS HERE */}
            <li><Link href="/about" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> About</Link></li>
            <li><Link href="/funding" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Funding</Link></li>
            <li><Link href="/blog" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Blog</Link></li>
            <li><Link href="/contact" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Contact</Link></li>
            <li><Link href="/privacy" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Privacy Policy</Link></li>
            <li><Link href="/terms" className="text-slate-400 hover:text-brand-gold transition-colors flex items-center gap-2"><ArrowRight className="h-3 w-3" /> Terms of Service</Link></li>
          </ul>
        </div>
      </div>
      <div className="border-t border-white/10 py-6 bg-[#050B14]">
        <div className="container-page flex flex-col md:flex-row justify-between items-center gap-4 text-xs text-slate-500">
          <p>© {new Date().getFullYear()} PrimeWealth Advisory. All rights reserved.</p>
          
        </div>
      </div>
    </footer>
  );
}
