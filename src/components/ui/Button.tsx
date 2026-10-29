import { cva, type VariantProps } from "class-variance-authority";
import { Slot } from "@radix-ui/react-slot";
import { forwardRef } from "react";
import { cn } from "@/shared/lib/utils";

const buttonVariants = cva(
  "inline-flex items-center justify-center gap-2 rounded-md font-medium transition-all duration-200 focus-visible:outline-none disabled:opacity-50",
  {
    variants: {
      variant: {
        primary: "bg-brand-navy text-white hover:bg-brand-navy-light shadow-sm",
        gold: "bg-brand-gold text-brand-navy hover:bg-brand-gold-dark shadow-lg",
        secondary: "bg-white text-brand-navy border border-slate-200 hover:bg-slate-50",
        ghost: "text-slate-600 hover:text-brand-gold hover:bg-slate-50",
        whatsapp: "bg-[#25D366] text-white hover:bg-[#1eb857]",
      },
      size: { sm: "h-9 px-3 text-sm", md: "h-11 px-5 text-sm", lg: "h-12 px-6 text-base", icon: "h-10 w-10" },
    },
    defaultVariants: { variant: "gold", size: "md" },
  }
);

export interface ButtonProps extends React.ButtonHTMLAttributes<HTMLButtonElement>, VariantProps<typeof buttonVariants> { asChild?: boolean; }

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, asChild = false, ...props }, ref) => {
    const Comp = asChild ? Slot : "button";
    return <Comp ref={ref} className={cn(buttonVariants({ variant, size }), className)} {...props} />;
  }
);
Button.displayName = "Button";
