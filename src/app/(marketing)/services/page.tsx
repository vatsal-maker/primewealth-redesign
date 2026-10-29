import Link from "next/link";
import { serviceCategories, allServices } from "@/shared/config/site";
import { ArrowRight } from "lucide-react";

export default function ServicesPage() {
  return (
    <div className="bg-[#F8FAFC] min-h-screen pt-32 pb-24 text-brand-navy">
      <div className="container-page">
        <div className="text-center mb-20">
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-2">ALL SERVICES</p>
          <h1 className="text-5xl font-extrabold tracking-tight mb-4 text-brand-navy">Everything We <span className="text-brand-gold">Do.</span></h1>
          <p className="text-slate-600 max-w-2xl mx-auto text-lg">Explore our complete suite of business advisory services.</p>
        </div>
        
        <div className="space-y-24">
          {serviceCategories.map((g, catIdx) => (
            <div key={g.code} id={g.code}>
              <div className="mb-8 border-l-4 border-brand-gold pl-4">
                <p className="text-sm font-bold text-brand-gold tracking-widest uppercase">{g.code}</p>
                <h2 className="text-3xl font-bold mt-1 text-brand-navy">{g.title}</h2>
              </div>
              
              <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
                {allServices.filter(s => s.category === g.code).map((s) => (
                  <Link key={s.slug} href={`/services/${s.slug}`}>
                    <div className="group h-full bg-white border border-slate-200 p-8 rounded-3xl hover:border-brand-gold/50 hover:shadow-xl hover:-translate-y-1 transition-all duration-300">
                      <h3 className="text-xl font-bold mb-3 text-brand-navy group-hover:text-brand-gold transition-colors">{s.name}</h3>
                      <p className="text-slate-500 text-sm leading-relaxed mb-6 line-clamp-3">{s.shortDesc}</p>
                      <div className="flex items-center text-sm font-bold text-brand-gold">
                        View Details <ArrowRight className="ml-2 h-4 w-4 group-hover:translate-x-2 transition-transform" />
                      </div>
                    </div>
                  </Link>
                ))}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
