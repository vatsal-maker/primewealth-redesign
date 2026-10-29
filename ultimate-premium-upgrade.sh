#!/bin/bash

echo "🚀 Starting Ultimate Website Overhaul..."

# ==========================================
# 1. Update Hero.tsx (Exact Image 1 Style)
# ==========================================
cat << 'EOF' > src/components/home/Hero.tsx
"use client";
import Link from "next/link";
import { motion } from "motion/react";
import { ArrowRight, ShieldCheck, Users, TrendingUp } from "lucide-react";
import { Button } from "@/components/ui/Button";

export function Hero() {
  return (
    <section className="relative min-h-[90vh] flex items-center bg-[#0A192F] overflow-hidden pt-20 pb-20">
      {/* Background Glow */}
      <div className="absolute top-0 left-1/4 w-[800px] h-[800px] bg-[#D4AF37]/5 rounded-full blur-[150px] mix-blend-screen pointer-events-none" />
      
      <div className="container-page relative z-10 flex flex-col items-center text-center">
        
        {/* Trusted Badge */}
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/5 border border-white/10 text-xs font-bold text-[#D4AF37] mb-8 backdrop-blur-md">
          <ShieldCheck className="h-4 w-4" /> Trusted by 1000+ Businesses Across India
        </motion.div>

        {/* Headings */}
        <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }} className="text-xl md:text-2xl text-slate-400 font-medium mb-2">
          Buland Sapno Ke Saath
        </motion.p>
        
        <motion.h1 initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }} className="text-5xl sm:text-7xl lg:text-[5.5rem] font-extrabold tracking-tight leading-[1.05] mb-4 text-white">
          PrimeWealth <span className="text-transparent bg-clip-text bg-gradient-to-r from-[#D4AF37] via-[#FDE68A] to-[#B8860B]">Advisory</span>
        </motion.h1>
        
        <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3 }} className="text-xl md:text-2xl text-slate-300 font-medium mb-6">
          आपकी सफलता, हमारी जिम्मेदारी
        </motion.p>

        <motion.p initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.4 }} className="text-lg text-slate-400 max-w-2xl mx-auto mb-10 leading-relaxed">
          From Registration to Investor Pitch — We Power Every Stage of Your Business Journey.
        </motion.p>

        {/* Buttons */}
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.5 }} className="flex flex-col sm:flex-row gap-4 mb-16">
          <Button asChild size="lg" className="h-14 px-8 text-lg rounded-full bg-[#D4AF37] hover:bg-[#B8860B] text-black font-bold shadow-[0_0_30px_rgba(212,175,55,0.3)] transition-all hover:-translate-y-1">
            <Link href="/contact">Consult for Free</Link>
          </Button>
          <Button asChild size="lg" variant="outline" className="h-14 px-8 text-lg rounded-full border-white/20 text-white hover:bg-white/10 transition-all">
            <Link href="/services">Explore Services <ArrowRight className="ml-2 h-5 w-5" /></Link>
          </Button>
        </motion.div>

        {/* Stats Strip */}
        <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.6 }} className="grid grid-cols-1 md:grid-cols-3 gap-8 md:gap-16 border-t border-white/10 pt-8 w-full max-w-3xl">
          <div>
            <p className="text-3xl md:text-4xl font-extrabold text-[#D4AF37] mb-1">1,000+</p>
            <p className="text-xs font-bold text-slate-500 uppercase tracking-widest">Clients Served</p>
          </div>
          <div>
            <p className="text-3xl md:text-4xl font-extrabold text-[#D4AF37] mb-1">4+</p>
            <p className="text-xs font-bold text-slate-500 uppercase tracking-widest">Yrs Combined Exp.</p>
          </div>
          <div>
            <p className="text-3xl md:text-4xl font-extrabold text-[#D4AF37] mb-1">94%</p>
            <p className="text-xs font-bold text-slate-500 uppercase tracking-widest">Success Rate</p>
          </div>
        </motion.div>

      </div>
    </section>
  );
}
EOF
echo "✅ Hero Section updated to Image 1 style."

# ==========================================
# 2. Update ServicesGrid.tsx (Image 3 Style - Detailed Cards)
# ==========================================
cat << 'EOF' > src/components/home/ServicesGrid.tsx
"use client";
import Link from "next/link";
import { motion } from "motion/react";
import { serviceCategories, allServices } from "@/shared/config/site";
import { CheckCircle2, ArrowRight, ShieldCheck, Landmark, FileText } from "lucide-react";

export function ServicesGrid() {
  return (
    <section className="py-24 bg-white relative">
      <div className="container-page relative z-10">
        <div className="text-center mb-16">
          <p className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-2">GOVERNMENT SCHEMES WE FACILITATE</p>
          <h2 className="text-4xl md:text-5xl font-extrabold text-slate-900 tracking-tight mb-4">
            Helping MSMEs Access <span className="text-blue-600">Government Support</span>
          </h2>
          <p className="text-slate-600 max-w-2xl mx-auto text-lg">Expert MSME loan consultant support and business consulting for CGTMSE, Startup India, NAIFF & more.</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {allServices.slice(0, 6).map((s, i) => (
            <motion.div key={s.slug} initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: i * 0.1 }}>
              <div className="bg-white border border-slate-200 rounded-[1.5rem] p-8 h-full flex flex-col hover:shadow-xl hover:border-blue-300 transition-all duration-300 group">
                <div className="flex items-center justify-between mb-6">
                  <div className="h-14 w-14 rounded-2xl bg-blue-50 flex items-center justify-center text-blue-600 group-hover:scale-110 transition-transform">
                    <Landmark className="h-7 w-7" />
                  </div>
                  <span className="text-xs font-bold text-green-600 bg-green-50 px-3 py-1 rounded-full border border-green-100 flex items-center gap-1">
                    <CheckCircle2 className="h-3 w-3" /> 95% Success
                  </span>
                </div>
                
                <h3 className="text-2xl font-bold text-slate-900 mb-2">{s.name}</h3>
                <p className="text-sm text-slate-500 mb-6 flex-1">{s.desc}</p>

                <div className="grid grid-cols-2 gap-4 mb-6 pt-6 border-t border-slate-100">
                  <div>
                    <p className="text-xs text-slate-500 font-medium mb-1">Loan Amount</p>
                    <p className="font-bold text-slate-900">Up to ₹5 Cr</p>
                  </div>
                  <div>
                    <p className="text-xs text-slate-500 font-medium mb-1">Key Benefit</p>
                    <p className="font-bold text-blue-600">No Collateral</p>
                  </div>
                </div>

                <ul className="space-y-2 mb-8">
                  {s.benefits.slice(0, 2).map(b => (
                    <li key={b} className="flex items-center gap-2 text-sm text-slate-600"><CheckCircle2 className="h-4 w-4 text-green-500 shrink-0" /> {b}</li>
                  ))}
                </ul>

                <Link href={`/services/${s.slug}`} className="mt-auto flex items-center text-sm font-bold text-blue-600 group-hover:underline">
                  Learn More <ArrowRight className="ml-1 h-4 w-4 group-hover:translate-x-1 transition-transform" />
                </Link>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
EOF
echo "✅ ServicesGrid updated to Image 3 style."

# ==========================================
# 3. Update About Page (Image 4 & 5 Style)
# ==========================================
cat << 'EOF' > "src/app/(marketing)/about/page.tsx"
"use client";
import { motion } from "motion/react";
import { Target, Eye, TrendingUp, ShieldCheck, Users, Award } from "lucide-react";

export default function AboutPage() {
  const values = [
    { icon: Target, title: "Our Mission", desc: "To empower startups and MSMEs across India by simplifying access to government schemes, funding, and certifications." },
    { icon: Eye, title: "Our Vision", desc: "To become India's most trusted partner for business growth, recognized for transparent processes and expert guidance." },
    { icon: TrendingUp, title: "Our Approach", desc: "A client-first, transparent, and strategic process that combines expert consultation with digital integration." },
    { icon: ShieldCheck, title: "Our Commitment", desc: "Delivering result-oriented consultation that bridges the gap between policy and execution." },
  ];

  return (
    <div className="bg-white min-h-screen text-slate-900">
      
      {/* Hero Section */}
      <section className="bg-[#0A192F] py-24 relative overflow-hidden">
        <div className="container-page relative z-10 grid md:grid-cols-2 gap-12 items-center">
          <motion.div initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }}>
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/10 text-xs font-bold text-green-400 mb-6">
              <Users className="h-4 w-4" /> Trusted Business Partner
            </div>
            <h1 className="text-4xl md:text-6xl font-extrabold text-white mb-6 leading-tight">
              About PrimeWealth: <br/>
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-green-400 to-blue-500">Your Partner for Business Solutions.</span>
            </h1>
            <p className="text-lg text-slate-300 mb-8 max-w-lg">
              Your trusted partner for company registration, government schemes, MSME funding, and business certifications across India.
            </p>
          </motion.div>
          
          <motion.div initial={{ opacity: 0, x: 30 }} animate={{ opacity: 1, x: 0 }} className="relative h-[400px] rounded-3xl overflow-hidden border border-white/10 shadow-2xl">
            <img src="https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=1000&auto=format&fit=crop" alt="About Us" className="w-full h-full object-cover" />
            <div className="absolute inset-0 bg-gradient-to-t from-[#0A192F] to-transparent opacity-60" />
          </motion.div>
        </div>
      </section>

      {/* Values Section */}
      <section className="py-24 bg-slate-50">
        <div className="container-page">
          <div className="text-center mb-16">
            <p className="text-sm font-bold text-blue-600 uppercase tracking-widest mb-2">OUR VALUES & VISION</p>
            <h2 className="text-4xl font-extrabold text-slate-900">What Drives <span className="text-blue-600">PrimeWealth</span></h2>
          </div>
          
          <div className="grid md:grid-cols-2 gap-6 max-w-5xl mx-auto">
            {values.map((v, i) => (
              <motion.div key={i} initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: i * 0.1 }} className="bg-white border border-slate-200 p-8 rounded-2xl shadow-sm hover:shadow-md transition-all">
                <div className="h-12 w-12 rounded-xl bg-blue-50 flex items-center justify-center mb-6">
                  <v.icon className="h-6 w-6 text-blue-600" />
                </div>
                <h3 className="text-xl font-bold text-slate-900 mb-3">{v.title}</h3>
                <p className="text-slate-600 text-sm leading-relaxed">{v.desc}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* Proven Track Record */}
      <section className="py-20 border-t border-slate-200 bg-white">
        <div className="container-page">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-extrabold text-slate-900 mb-2">Proven Track Record</h2>
            <p className="text-slate-500">Numbers that reflect our commitment to your success</p>
          </div>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
            {[
              { value: "3000+", label: "Happy Clients", icon: Users, color: "text-blue-600" },
              { value: "95%", label: "Success Rate", icon: TrendingUp, color: "text-green-600" },
              { value: "₹123Cr+", label: "Funding Facilitated", icon: Award, color: "text-yellow-600" },
              { value: "28+", label: "States Covered", icon: Target, color: "text-purple-600" }
            ].map((stat, i) => (
              <div key={i} className="bg-white border border-slate-200 p-6 rounded-2xl text-center shadow-sm">
                <stat.icon className={`h-8 w-8 mx-auto mb-3 ${stat.color}`} />
                <p className="text-3xl font-extrabold text-slate-900 mb-1">{stat.value}</p>
                <p className="text-xs font-bold text-slate-500 uppercase tracking-wider">{stat.label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

    </div>
  );
}
EOF
echo "✅ About Page updated to Image 4 & 5 style."

# ==========================================
# 4. Update Footer.tsx (Image 7 Style - Dark & Detailed)
# ==========================================
cat << 'EOF' > src/components/layout/Footer.tsx
import Link from "next/link";
import { site } from "@/shared/config/site";
import { ArrowRight, Mail, Phone, MapPin, Linkedin, Twitter, Instagram } from "lucide-react";

export function Footer() {
  return (
    <footer className="bg-[#041024] pt-20 pb-10 border-t border-slate-800 text-slate-300">
      <div className="container-page grid md:grid-cols-2 lg:grid-cols-5 gap-12 pb-16 border-b border-slate-800">
        
        {/* Company Info */}
        <div className="lg:col-span-2">
          <Link href="/" className="flex items-center gap-2 text-white font-bold text-2xl mb-6">
            <div className="h-10 w-10 bg-blue-600 rounded-xl flex items-center justify-center text-xl">PW</div> 
            PrimeWealth
          </Link>
          <p className="text-sm text-slate-400 mb-6 leading-relaxed max-w-sm">
            We help startups and MSMEs access government funding, certifications, and business support services across India.
          </p>
          <div className="space-y-3 text-sm font-medium">
            <p className="flex items-center gap-3"><Phone className="h-4 w-4 text-green-500" /> Helpline: +91 98765 43210</p>
            <p className="flex items-center gap-3"><Mail className="h-4 w-4 text-blue-500" /> {site.email}</p>
          </div>
        </div>

        {/* Links */}
        <div>
          <h4 className="text-white font-bold mb-6">Company</h4>
          <ul className="space-y-3 text-sm">
            {["About Us", "Contact Us", "Success Stories", "Blog & Insights"].map((item) => (
              <li key={item}><Link href="#" className="hover:text-blue-400 transition-colors">{item}</Link></li>
            ))}
          </ul>
        </div>

        <div>
          <h4 className="text-white font-bold mb-6">Services</h4>
          <ul className="space-y-3 text-sm">
            {["Funding Support", "Non-Refundable Grants", "Company Registration", "Certifications", "Tax Compliance"].map((item) => (
              <li key={item}><Link href="#" className="hover:text-blue-400 transition-colors">{item}</Link></li>
            ))}
          </ul>
        </div>

        <div>
          <h4 className="text-white font-bold mb-6">Resources</h4>
          <ul className="space-y-3 text-sm">
            {["Government Schemes", "MSME Champions", "Startup India", "CGTMSE"].map((item) => (
              <li key={item}><Link href="#" className="hover:text-blue-400 transition-colors">{item}</Link></li>
            ))}
          </ul>
        </div>
      </div>

      {/* Our Presence */}
      <div className="container-page py-12 border-b border-slate-800">
        <h4 className="text-white font-bold mb-6 text-sm uppercase tracking-widest">Our Presence</h4>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {[
            { city: "Ahmedabad", address: "1202, 12th Floor, Link Building, Gota, Ahmedabad - 382481" },
            { city: "Pune", address: "Baner Biz Bay, Office No A401, Baner Road, Pune - 411045" },
            { city: "Bengaluru", address: "Shop/Unit No: S222B, 2nd Floor, Hoodi, Bengaluru - 560048" },
            { city: "Noida", address: "A-802, 8th Floor, Cyberpark, Sector-62, Noida (U.P.)" }
          ].map((office, i) => (
            <div key={i} className="bg-slate-900/50 border border-slate-800 p-4 rounded-xl flex items-start gap-3">
              <MapPin className="h-5 w-5 text-green-500 shrink-0 mt-0.5" />
              <div>
                <p className="text-sm font-bold text-white">{office.city}</p>
                <p className="text-xs text-slate-400 mt-1 leading-relaxed">{office.address}</p>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Bottom Bar */}
      <div className="container-page pt-8 flex flex-col md:flex-row justify-between items-center gap-4 text-xs text-slate-500">
        <p>© {new Date().getFullYear()} PrimeWealth Advisory. All rights reserved.</p>
        <div className="flex gap-4">
          <Link href="#" className="hover:text-white">Privacy Policy</Link>
          <Link href="#" className="hover:text-white">Terms & Conditions</Link>
          <Link href="#" className="hover:text-white">Refund Policy</Link>
        </div>
      </div>
    </footer>
  );
}
EOF
echo "✅ Footer updated to Image 7 style."

# ==========================================
# 5. Create Quick Inquiry Form Component
# ==========================================
cat << 'EOF' > src/components/home/QuickInquiry.tsx
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
             { icon: Phone, title: "Call Us", desc: "Helpline: +91 98765 43210", color: "text-blue-600" },
             { icon: Mail, title: "Email Us", desc: "info@primewealth.com", color: "text-yellow-600" },
             { icon: MapPin, title: "Office Location", desc: "Ahmedabad, Gujarat", color: "text-blue-600" }
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
EOF
echo "✅ QuickInquiry Form created (Image 6 style)."

# ==========================================
# 6. Update Home Page to include QuickInquiry
# ==========================================
cat << 'EOF' > src/app/page.tsx
import { Hero } from "@/components/home/Hero";
import { Stats } from "@/components/home/Stats";
import { BentoFeatures } from "@/components/home/BentoFeatures";
import { Process } from "@/components/home/Process";
import { WhyChooseUs } from "@/components/home/WhyChooseUs";
import { Testimonials } from "@/components/home/Testimonials";
import { FAQ } from "@/components/home/FAQ";
import { ServicesGrid } from "@/components/home/ServicesGrid";
import { LiveFundingDashboard } from "@/components/home/LiveFundingDashboard";
import { QuickInquiry } from "@/components/home/QuickInquiry";
import { LiveNotifications } from "@/components/ui/LiveNotifications";
import { AIChatWidget } from "@/components/ui/AIChatWidget";

export default function HomePage() {
  return (
    <main className="relative bg-transparent min-h-screen text-slate-900">
      <Hero />
      <Stats />
      <ServicesGrid />
      <LiveFundingDashboard />
      <BentoFeatures />
      <Process />
      <WhyChooseUs />
      <Testimonials />
      <FAQ />
      <QuickInquiry />
      <LiveNotifications />
      <AIChatWidget />
    </main>
  );
}
EOF
echo "✅ Homepage updated with new sections."

echo "=========================================="
echo "🎉 ULTIMATE PREMIUM UPGRADE COMPLETE!"
echo "Ab terminal me ye chalayein:"
echo "rm -rf .next"
echo "npm run dev"
echo "=========================================="