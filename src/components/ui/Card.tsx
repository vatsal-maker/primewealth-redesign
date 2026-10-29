import { cn } from "@/shared/lib/utils";
export function Card({ className, ...props }: React.HTMLAttributes<HTMLDivElement>) {
  return <div className={cn("rounded-2xl border bg-surface p-6 shadow-sm hover:shadow-md transition-all", className)} {...props} />;
}
