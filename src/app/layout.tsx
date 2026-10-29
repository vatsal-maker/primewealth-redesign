import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { Header } from "@/components/layout/Header";
import { Footer } from "@/components/layout/Footer";
import { CustomCursor } from "@/components/ui/CustomCursor";
import { ScrollToTop } from "@/components/utils/ScrollToTop";
import { PremiumMultiStepModal } from "@/components/ui/PremiumMultiStepModal"; // Import Popup
import { site } from "@/shared/config/site";

const inter = Inter({ subsets: ["latin"], variable: "--font-inter", display: "swap" });

export const metadata: Metadata = {
  metadataBase: new URL(site.url),
  title: `${site.name} — Business Advisory`,
  description: site.description,
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={inter.variable} suppressHydrationWarning data-scroll-behavior="smooth">
      <body className="bg-[#F8FAFC] antialiased text-slate-900 selection:bg-brand-gold selection:text-white">
        <ScrollToTop />
        <CustomCursor />
        <Header />
        <main id="main" className="min-h-screen">{children}</main>
        <Footer />
        
        {/* POPUP MOUNTED HERE (Works on every page) */}
        <PremiumMultiStepModal />
      </body>
    </html>
  );
}
