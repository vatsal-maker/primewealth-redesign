import { Hero } from "@/components/home/Hero";
import { Stats } from "@/components/home/Stats";
import { BentoFeatures } from "@/components/home/BentoFeatures";
import { Process } from "@/components/home/Process";
import { WhyChooseUs } from "@/components/home/WhyChooseUs";
import { Testimonials } from "@/components/home/Testimonials";
import { FAQ } from "@/components/home/FAQ";
import { ServicesGrid } from "@/components/home/ServicesGrid";
import { LiveFundingDashboard } from "@/components/home/LiveFundingDashboard";
import { LiveNotifications } from "@/components/ui/LiveNotifications";
import { AIChatWidget } from "@/components/ui/AIChatWidget";

export default function HomePage() {
  return (
    <main className="relative bg-[#F8FAFC] min-h-screen text-brand-navy">
      <Hero />
      <Stats />
      <ServicesGrid />
      <LiveFundingDashboard />
      <BentoFeatures />
      <Process />
      <WhyChooseUs />
      <Testimonials />
      <FAQ />
      <LiveNotifications />
      <AIChatWidget />
    </main>
  );
}
