"use client";
import { Button } from "@/components/ui/Button";
import { Phone, Mail, MapPin } from "lucide-react";

export function QuickInquiry() {
  return (
    <section className="py-24 bg-white">
      <div className="container-page max-w-5xl">
        
        {/* Gradient Form Box */}
        <div className="bg-gradient-to-br from-blue-700 via-blue-600 to-green-500 rounded-[2.5rem] p-8 md:p-12 shadow-2xl flex flex-col md:flex-row gap-12 items-center text-white">
          
          <div className="flex-1">
            <h2 className="text-3xl md:text-4xl font-extrabold mb-4 leading-tight">Let's Discuss Your Business Needs</h2>
            <p className="text-blue-100 mb-8 text-lg">Get expert consultation on government schemes, registration, and business certifications.</p>
            <ul className="space-y-3 mb-8 text-sm font-medium">
              <li className="flex items-center gap-2"><span className="h-2 w-2 rounded-full bg-green-400" /> Free Consultation</li>
              <li className="flex items-center gap-2"><span className="h-2 w-2 rounded-full bg-green-400" /> Expert Guidance</li>
              <li className="flex items-center gap-2"><span className="h-2 w-2 rounded-full bg-green-400" /> Pan India Service</li>
            </ul>
            <div className="flex gap-4">
              <Button className="bg-white text-blue-700 font-bold hover:bg-slate-100">Schedule Consultation</Button>
              <Button variant="outline" className="border-white/30 text-white hover:bg-white/10"><Phone className="h-4 w-4 mr-2" /> Call Us</Button>
            </div>
          </div>

          <div className="w-full md:w-[400px] bg-white/10 backdrop-blur-md p-6 rounded-3xl border border-white/20">
            <h3 className="text-xl font-bold mb-4">Quick Inquiry</h3>
            <form className="space-y-4">
              <input type="text" placeholder="Your Name" className="w-full bg-white/20 border border-white/30 rounded-xl px-4 py-3 placeholder:text-blue-100 text-white focus:outline-none focus:bg-white/30" />
              <input type="tel" placeholder="Mobile Number" className="w-full bg-white/20 border border-white/30 rounded-xl px-4 py-3 placeholder:text-blue-100 text-white focus:outline-none focus:bg-white/30" />
              <select className="w-full bg-white/20 border border-white/30 rounded-xl px-4 py-3 text-blue-100 focus:outline-none">
                <option>Select Service</option>
                <option>CGTMSE Loan</option>
                <option>Startup India</option>
              </select>
              <Button type="button" className="w-full h-12 bg-white text-blue-700 font-bold rounded-xl hover:bg-slate-100">Submit Inquiry</Button>
            </form>
          </div>

        </div>

        {/* Contact Cards Below Form */}
        <div className="grid md:grid-cols-3 gap-6 mt-8">
           {[
             { icon: Phone, title: "Call Us", desc: "Helpline: +91 98765 43210", color: "text-brand-gold" },
             { icon: Mail, title: "Email Us", desc: "info@primewealth.com", color: "text-yellow-600" },
             { icon: MapPin, title: "Office Location", desc: "Ahmedabad, Gujarat", color: "text-brand-gold" }
           ].map((c, i) => (
             <div key={i} className="bg-white border border-slate-200 p-6 rounded-2xl flex items-center gap-4 shadow-sm">
                <div className={`h-12 w-12 rounded-full bg-slate-50 flex items-center justify-center shrink-0 ${c.color}`}><c.icon className="h-6 w-6" /></div>
                <div>
                  <p className="font-bold text-slate-900">{c.title}</p>
                  <p className="text-sm text-slate-500">{c.desc}</p>
                </div>
             </div>
           ))}
        </div>

      </div>
    </section>
  );
}
