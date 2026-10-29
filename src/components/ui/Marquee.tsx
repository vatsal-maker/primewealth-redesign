"use client";
export function Marquee() {
  const items = ["Startup India", "GeM Portal", "MSME Ministry", "Make In India", "ZED Scheme", "NSIC", "Udyam Portal", "DPIIT"];
  return (
    <div className="flex overflow-hidden w-full bg-[#050B14] border-y border-white/5 py-4">
      <div className="flex whitespace-nowrap animate-marquee items-center gap-12 px-6 opacity-50">
        {[...items, ...items].map((item, i) => (
          <span key={i} className="text-xl font-bold text-white tracking-widest uppercase">{item}</span>
        ))}
      </div>
    </div>
  );
}
