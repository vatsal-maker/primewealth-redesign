"use client";
import { motion } from "motion/react";
export const staggerContainer = { hidden: {}, visible: { transition: { staggerChildren: 0.1 } } };
export const staggerItem = { hidden: { opacity: 0, y: 20 }, visible: { opacity: 1, y: 0, transition: { duration: 0.5 } } };
export function StaggerContainer({ children, className }: { children: React.ReactNode; className?: string }) {
  return <motion.div variants={staggerContainer} initial="hidden" whileInView="visible" viewport={{ once: true, margin: "-100px" }} className={className}>{children}</motion.div>;
}
