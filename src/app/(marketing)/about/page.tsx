"use client";
import { motion } from "motion/react";
import { Target, Eye, TrendingUp, ShieldCheck, Users, Award, CheckCircle2, Landmark, Star, Briefcase, MapPin } from "lucide-react";
import { Button } from "@/components/ui/Button";
import Link from "next/link";

export default function AboutPage() {
  const values = [
    { icon: Target, title: "Our Mission", desc: "To empower startups and MSMEs across India by simplifying access to government schemes, funding, and certifications." },
    { icon: Eye, title: "Our Vision", desc: "To become India's most trusted partner for business growth, recognized for transparent processes and expert guidance." },
    { icon: TrendingUp, title: "Our Approach", desc: "A client-first, transparent, and strategic process that combines expert consultation with digital integration." },
    { icon: ShieldCheck, title: "Our Commitment", desc: "Delivering result-oriented consultation that bridges the gap between policy and execution." },
  ];

  return (
    <div className="bg-[#F8FAFC] min-h-screen text-brand-navy">
      
      {/* Ultra Premium Hero Section */}
      <section className="bg-[#0A192F] py-24 lg:py-32 relative overflow-hidden border-b border-white/10">
        {/* Background Gradients */}
        <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10 pointer-events-none" />
        <div className="absolute top-0 right-0 w-[800px] h-[800px] bg-gradient-to-br from-brand-gold/20 via-blue-600/10 to-transparent blur-[120px] rounded-full pointer-events-none" />
        
        <div className="container-page relative z-10 grid md:grid-cols-2 gap-16 items-center">
          
          {/* Left Side: Text */}
          <motion.div initial={{ opacity: 0, x: -30 }} animate={{ opacity: 1, x: 0 }}>
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-white/5 border border-white/10 text-xs font-bold text-green-400 mb-6 backdrop-blur-md">
              <Users className="h-4 w-4" /> Trusted Business Partner
            </div>
            
            <h1 className="text-4xl md:text-6xl font-extrabold text-white mb-6 leading-[1.1]">
              About PrimeWealth: <br/>
              <span className="text-gradient-gold">Your Partner for Business & MSME Solutions.</span>
            </h1>
            
            <p className="text-lg text-slate-300 mb-8 max-w-lg leading-relaxed">
              Your trusted partner for company registration, government schemes, MSME funding, and business certifications across India. We help you scale without limits.
            </p>

            <div className="flex flex-wrap gap-4 mb-10">
               <div className="flex items-center gap-3 bg-white/5 border border-white/10 px-4 py-2 rounded-xl backdrop-blur-sm">
                  <Landmark className="h-5 w-5 text-brand-gold" />
                  <div><p className="text-xs text-slate-400 font-bold">Pan-India Service</p><p className="text-sm text-white font-extrabold">28+ States Coverage</p></div>
               </div>
               <div className="flex items-center gap-3 bg-white/5 border border-white/10 px-4 py-2 rounded-xl backdrop-blur-sm">
                  <Award className="h-5 w-5 text-brand-gold" />
                  <div><p className="text-xs text-slate-400 font-bold">Expert Team</p><p className="text-sm text-white font-extrabold">Years of Experience</p></div>
               </div>
            </div>
            
            <Button asChild className="h-14 px-8 rounded-full bg-brand-gold hover:bg-brand-gold-dark text-brand-navy font-bold text-lg shadow-[0_0_20px_rgba(212,175,55,0.3)] transition-all hover:-translate-y-1">
              <Link href="/contact">Talk to our Experts</Link>
            </Button>
          </motion.div>
          
          {/* Right Side: Premium Impact Dashboard (Replacing generic image) */}
          <motion.div initial={{ opacity: 0, scale: 0.95 }} animate={{ opacity: 1, scale: 1 }} transition={{ duration: 0.8 }} className="relative h-[550px] hidden md:flex flex-col justify-center">
             
             {/* Main Glassmorphism Card */}
             <div className="relative w-full h-full bg-gradient-to-br from-[#112240] to-[#1D4ED8] rounded-[2.5rem] border border-white/10 overflow-hidden shadow-2xl flex flex-col justify-between p-8">
                
                {/* Background Image with heavy overlay to keep it subtle */}
                <img src="https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=800&auto=format&fit=crop" alt="Team" className="absolute inset-0 w-full h-full object-cover opacity-10 mix-blend-luminosity" />
                
                {/* Top Badge */}
                <div className="relative z-10 flex justify-between items-start">
                   <div className="bg-white/10 backdrop-blur-md border border-white/20 px-4 py-2 rounded-full flex items-center gap-2">
                      <span className="w-2 h-2 rounded-full bg-red-500 animate-pulse" />
                      <span className="text-xs font-bold text-white tracking-wide">Est. 2023 • Our Story</span>
                   </div>
                   <div className="bg-brand-gold text-brand-navy px-4 py-1.5 rounded-full text-xs font-extrabold shadow-lg">
                      100% Transparent
                   </div>
                </div>

                {/* Center Stats Grid */}
                <div className="relative z-10 grid grid-cols-2 gap-4 my-auto">
                   <motion.div animate={{ y: [0, -5, 0] }} transition={{ repeat: Infinity, duration: 3, ease: "easeInOut" }} className="bg-white/10 backdrop-blur-xl border border-white/20 p-5 rounded-2xl shadow-xl">
                      <TrendingUp className="h-6 w-6 text-brand-gold mb-2" />
                      <p className="text-2xl font-extrabold text-white">₹100Cr+</p>
                      <p className="text-[10px] text-slate-300 font-bold uppercase tracking-wider mt-1">Funding Facilitated</p>
                   </motion.div>
                   <motion.div animate={{ y: [0, 5, 0] }} transition={{ repeat: Infinity, duration: 3.5, ease: "easeInOut", delay: 0.5 }} className="bg-white/10 backdrop-blur-xl border border-white/20 p-5 rounded-2xl shadow-xl">
                      <Users className="h-6 w-6 text-green-400 mb-2" />
                      <p className="text-2xl font-extrabold text-white">1000+</p>
                      <p className="text-[10px] text-slate-300 font-bold uppercase tracking-wider mt-1">Happy Clients</p>
                   </motion.div>
                   <motion.div animate={{ y: [0, -5, 0] }} transition={{ repeat: Infinity, duration: 4, ease: "easeInOut", delay: 1 }} className="bg-white/10 backdrop-blur-xl border border-white/20 p-5 rounded-2xl shadow-xl">
                      <CheckCircle2 className="h-6 w-6 text-brand-gold mb-2" />
                      <p className="text-2xl font-extrabold text-white">95%</p>
                      <p className="text-[10px] text-slate-300 font-bold uppercase tracking-wider mt-1">Success Rate</p>
                   </motion.div>
                   <motion.div animate={{ y: [0, 5, 0] }} transition={{ repeat: Infinity, duration: 3.2, ease: "easeInOut", delay: 1.5 }} className="bg-white/10 backdrop-blur-xl border border-white/20 p-5 rounded-2xl shadow-xl">
                      <MapPin className="h-6 w-6 text-blue-400 mb-2" />
                      <p className="text-2xl font-extrabold text-white">28+</p>
                      <p className="text-[10px] text-slate-300 font-bold uppercase tracking-wider mt-1">States Covered</p>
                   </motion.div>
                </div>

                {/* Bottom Floating Badge (Real Success Stories & Avatars) */}
                <motion.div animate={{ y: [0, -5, 0] }} transition={{ repeat: Infinity, duration: 4 }} className="relative z-10 bg-white p-4 rounded-2xl shadow-[0_10px_40px_rgba(0,0,0,0.4)] flex items-center justify-between">
                   <div className="flex items-center gap-3">
                      {/* Avatar Stack */}
                      <div className="flex -space-x-3">
                         {[
                            "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=100&auto=format&fit=crop",
                            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=100&auto=format&fit=crop",
                            "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=100&auto=format&fit=crop"
                         ].map((url, i) => (
                            <img key={i} src={url} alt="Client" className="w-8 h-8 rounded-full border-2 border-white object-cover" />
                         ))}
                         <div className="w-8 h-8 rounded-full border-2 border-white bg-brand-navy flex items-center justify-center text-[10px] font-bold text-white z-10">+1k</div>
                      </div>
                      <div>
                         <div className="flex items-center gap-1 text-brand-gold mb-0.5">
                            <Star className="h-3 w-3 fill-current" /><Star className="h-3 w-3 fill-current" /><Star className="h-3 w-3 fill-current" /><Star className="h-3 w-3 fill-current" /><Star className="h-3 w-3 fill-current" />
                         </div>
                         <p className="text-[10px] font-extrabold text-brand-navy">4.9/5 Rated by Founders</p>
                      </div>
                   </div>
                   <div className="flex gap-1">
                      <span className="h-2 w-2 rounded-full bg-brand-gold" />
                      <span className="h-2 w-2 rounded-full bg-brand-gold/60" />
                      <span className="h-2 w-2 rounded-full bg-brand-gold/30" />
                   </div>
                </motion.div>
             </div>
          </motion.div>
        </div>
      </section>

      {/* Values Section (Light Theme) */}
      <section className="py-24 bg-white relative">
        <div className="container-page">
          <div className="text-center mb-16">
            <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-2">OUR VALUES & VISION</p>
            <h2 className="text-4xl font-extrabold text-brand-navy">What Drives <span className="text-brand-gold">PrimeWealth</span></h2>
          </div>
          
          <div className="grid md:grid-cols-2 gap-6 max-w-5xl mx-auto">
            {values.map((v, i) => (
              <motion.div key={i} initial={{ opacity: 0, y: 20 }} whileInView={{ opacity: 1, y: 0 }} viewport={{ once: true }} transition={{ delay: i * 0.1 }} className="bg-slate-50 border border-slate-200 p-8 rounded-2xl shadow-sm hover:shadow-lg hover:border-brand-gold/30 transition-all group">
                <div className="h-12 w-12 rounded-xl bg-brand-gold/10 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <v.icon className="h-6 w-6 text-brand-gold" />
                </div>
                <h3 className="text-xl font-bold text-brand-navy mb-3">{v.title}</h3>
                <p className="text-slate-600 text-sm leading-relaxed">{v.desc}</p>
              </motion.div>
            ))}
          </div>
        </div>
      </section>

    </div>
  );
}
