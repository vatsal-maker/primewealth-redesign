import Link from "next/link";
import { Button } from "@/components/ui/Button";
import { Reveal } from "@/components/motion/Reveal";
import { site } from "@/shared/config/site";

export function CTASection() {
  return (
    <section className="container-page py-16 pb-32">
      <Reveal>
        <div className="rounded-3xl bg-gradient-to-br from-blue-600 to-indigo-700 p-10 text-white md:p-16 shadow-2xl relative overflow-hidden">
          <div className="absolute top-0 right-0 w-64 h-64 bg-white/10 rounded-full blur-3xl" />
          <div className="mx-auto max-w-2xl text-center relative z-10">
            <h2 className="text-3xl font-bold tracking-tight sm:text-4xl">Ready to start? Let's map your journey.</h2>
            <p className="mt-3 text-blue-100">Free consultation — no commitment.</p>
            <div className="mt-8 flex flex-wrap justify-center gap-3">
              <Button asChild size="lg" className="bg-white text-blue-700 hover:bg-slate-50"><Link href="/contact">Book Consultation</Link></Button>
              <Button asChild size="lg" className="bg-green-500 text-white hover:bg-green-600 border-none"><a href={site.whatsapp}>Chat on WhatsApp</a></Button>
            </div>
          </div>
        </div>
      </Reveal>
    </section>
  );
}
