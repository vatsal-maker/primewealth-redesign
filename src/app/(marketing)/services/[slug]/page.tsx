import { notFound } from "next/navigation";
import Link from "next/link";
import { getServiceDetails, serviceCategories } from "@/shared/config/site";
import { Button } from "@/components/ui/Button";
import { ServiceSidebar } from "@/components/services/ServiceSidebar";
import { CheckCircle2, FileText, ArrowRight, ShieldCheck, Target, ListChecks, Clock, Award } from "lucide-react";

export async function generateStaticParams() {
  return [];
}

export default async function ServicePage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const service = getServiceDetails(slug);
  
  if (!service) notFound();

  const categoryTitle = serviceCategories.find(c => c.code === service.category)?.title || service.category;
  
  return (
    <div className="bg-[#F8FAFC] min-h-screen pt-24 pb-24 text-brand-navy">
      <div className="container-page max-w-7xl">
        
        {/* Breadcrumb */}
        <nav className="mb-6 text-sm text-slate-500 font-medium flex items-center gap-2">
          <Link href="/" className="hover:text-brand-gold transition-colors">Home</Link> 
          <span>/</span>
          <Link href="/services" className="hover:text-brand-gold transition-colors">Services</Link> 
          <span>/</span>
          <span className="text-brand-gold">{service.name}</span>
        </nav>

        {/* Main Grid */}
        <div className="grid lg:grid-cols-12 gap-12">
          
          {/* LEFT COLUMN: Main Content */}
          <div className="lg:col-span-8 space-y-16">
            
            <div>
              <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-3">{service.category} — {categoryTitle}</p>
              <h1 className="text-4xl md:text-6xl font-extrabold mb-4 text-brand-navy leading-tight">{service.name}</h1>
              <p className="text-lg text-slate-600 mb-6">{service.shortDesc}</p>
              
              <div className="flex flex-wrap gap-3">
                {service.taxSaving && (
                  <span className="bg-brand-gold/10 text-brand-navy border border-brand-gold/30 px-3 py-1.5 rounded-full text-xs font-bold flex items-center gap-1">
                    <Award className="h-3 w-3 text-brand-gold" /> Tax Saving: {service.taxSaving}
                  </span>
                )}
                <span className="bg-white text-slate-600 border border-slate-200 px-3 py-1.5 rounded-full text-xs font-bold flex items-center gap-1">
                  <Clock className="h-3 w-3" /> Timeline: {service.timeline}
                </span>
              </div>
            </div>

            <section>
              <p className="text-xs font-bold text-brand-gold uppercase tracking-widest mb-2">OVERVIEW</p>
              <h2 className="text-2xl font-bold mb-4 text-brand-navy">What is {service.name}?</h2>
              <p className="text-slate-600 leading-relaxed text-base">{service.longDesc}</p>
            </section>

            <section>
              <p className="text-xs font-bold text-brand-gold uppercase tracking-widest mb-2">BENEFITS</p>
              <h2 className="text-2xl font-bold mb-6 text-brand-navy">Key Benefits</h2>
              <div className="grid sm:grid-cols-2 gap-4">
                {service.benefits.map((b, i) => (
                  <div key={i} className="bg-white border border-slate-200 p-5 rounded-xl flex items-start gap-3 hover:border-brand-gold/50 transition-colors">
                    <CheckCircle2 className="h-5 w-5 text-green-500 shrink-0 mt-0.5" />
                    <p className="text-sm text-slate-700 leading-relaxed">{b}</p>
                  </div>
                ))}
              </div>
            </section>

            <section>
              <p className="text-xs font-bold text-brand-gold uppercase tracking-widest mb-2">WHO CAN APPLY</p>
              <h2 className="text-2xl font-bold mb-6 text-brand-navy">Eligibility Criteria</h2>
              <div className="bg-white border border-slate-200 rounded-2xl p-6 md:p-8 shadow-sm">
                <h3 className="text-lg font-bold mb-4 flex items-center gap-2 text-brand-navy"><CheckCircle2 className="text-green-500" /> Am I Eligible?</h3>
                <ul className="space-y-4">
                  {service.eligibility.map((e, i) => (
                    <li key={i} className="flex items-start gap-3 text-slate-700 text-sm">
                      <span className="h-5 w-5 rounded-full bg-green-100 text-green-600 flex items-center justify-center shrink-0 mt-0.5 text-[10px] font-bold">✓</span>
                      {e}
                    </li>
                  ))}
                </ul>
                <Button className="w-full mt-8 bg-brand-navy text-white font-bold h-12 rounded-xl hover:bg-brand-navy-light shadow-md">
                  ✓ I'm Eligible — Get Started <ArrowRight className="ml-2 h-4 w-4 text-brand-gold" />
                </Button>
              </div>
            </section>

            <section>
              <p className="text-xs font-bold text-brand-gold uppercase tracking-widest mb-2">DOCUMENTS REQUIRED</p>
              <h2 className="text-2xl font-bold mb-6 text-brand-navy">Required Documents</h2>
              <div className="grid sm:grid-cols-2 gap-3">
                {service.documents.map((d, i) => (
                  <div key={i} className="bg-white border border-slate-200 px-4 py-3 rounded-lg text-sm text-slate-700 flex items-center gap-3">
                    <span className="text-brand-gold font-mono text-xs font-bold">{String(i+1).padStart(2, '0')}</span> {d}
                  </div>
                ))}
              </div>
            </section>

            <section>
              <p className="text-xs font-bold text-brand-gold uppercase tracking-widest mb-2">PROCESS</p>
              <h2 className="text-2xl font-bold mb-6 text-brand-navy">Step-by-Step Process</h2>
              <div className="space-y-6">
                {service.process.map((p, i) => (
                  <div key={i} className="flex gap-4">
                    <div className="flex flex-col items-center">
                      <div className="w-8 h-8 rounded-full bg-brand-gold text-brand-navy font-bold text-sm flex items-center justify-center shrink-0">
                        {p.step}
                      </div>
                      {i !== service.process.length - 1 && <div className="w-px h-full bg-slate-200 my-1" />}
                    </div>
                    <div className="pb-6">
                      <h3 className="font-bold text-brand-navy text-base mb-1">{p.title}</h3>
                      <p className="text-sm text-slate-600 leading-relaxed">{p.desc}</p>
                    </div>
                  </div>
                ))}
              </div>
            </section>

            {service.faqs.length > 0 && (
              <section>
                <p className="text-xs font-bold text-brand-gold uppercase tracking-widest mb-2">FAQS</p>
                <h2 className="text-2xl font-bold mb-6 text-brand-navy">Frequently Asked Questions</h2>
                <div className="space-y-3">
                  {service.faqs.map((faq, i) => (
                    <details key={i} className="group bg-white border border-slate-200 rounded-xl overflow-hidden shadow-sm">
                      <summary className="flex items-center justify-between p-4 cursor-pointer text-brand-navy font-semibold text-sm list-none">
                        {faq.q}
                        <span className="text-brand-gold group-open:rotate-45 transition-transform">+</span>
                      </summary>
                      <div className="px-4 pb-4 text-sm text-slate-600 leading-relaxed">{faq.a}</div>
                    </details>
                  ))}
                </div>
              </section>
            )}

          </div>

          {/* RIGHT COLUMN: Sidebar */}
          <div className="lg:col-span-4">
            <ServiceSidebar service={service} />
          </div>

        </div>
      </div>
    </div>
  );
}
