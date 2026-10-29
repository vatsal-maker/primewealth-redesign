"use client";
import { useEffect } from "react";
import { usePathname } from "next/navigation";

export function ScrollToTop() {
  const pathname = usePathname();

  useEffect(() => {
    // Force scroll to top whenever the route changes
    window.scrollTo({
      top: 0,
      behavior: "instant", // Use "smooth" if you want a smooth scroll effect
    });
  }, [pathname]);

  return null;
}
