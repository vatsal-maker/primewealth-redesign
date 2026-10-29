import Link from "next/link";
import { ArrowRight, Calendar, User, Tag } from "lucide-react";

export default function BlogPage() {
  const blogs = [
    {
      title: "How to get CGTMSE Loan without Collateral in 2024",
      excerpt: "Learn the step-by-step process to secure up to ₹5 Crore funding for your MSME without pledging any personal assets.",
      date: "Oct 25, 2026",
      author: "Admin",
      category: "Funding",
      image: "https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?q=80&w=800&auto=format&fit=crop"
    },
    {
      title: "Startup India (DPIIT) Registration: Benefits & Process",
      excerpt: "Discover how DPIIT recognition can give you 100% tax exemption for 3 years and unlock massive government funding.",
      date: "Oct 20, 2026",
      author: "Admin",
      category: "Certification",
      image: "https://images.unsplash.com/photo-1556761175-5973dc0f32e7?q=80&w=800&auto=format&fit=crop"
    },
    {
      title: "Private Limited vs LLP: Which is better for your startup?",
      excerpt: "Confused between Pvt Ltd and LLP? We break down the compliance, taxation, and funding aspects to help you choose.",
      date: "Oct 15, 2026",
      author: "Admin",
      category: "Registration",
      image: "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?q=80&w=800&auto=format&fit=crop"
    }
  ];

  return (
    <div className="bg-[#F8FAFC] min-h-screen pt-32 pb-24 text-brand-navy">
      <div className="container-page">
        
        {/* Header */}
        <div className="text-center mb-16">
          <p className="text-sm font-bold text-brand-gold uppercase tracking-widest mb-2">OUR BLOG</p>
          <h1 className="text-5xl font-extrabold tracking-tight mb-4 text-brand-navy">Latest <span className="text-brand-gold">Insights.</span></h1>
          <p className="text-slate-600 max-w-2xl mx-auto text-lg">Expert advice on government schemes, funding, and business growth in India.</p>
        </div>

        {/* Blog Grid */}
        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {blogs.map((blog, i) => (
            <div key={i} className="bg-white rounded-3xl border border-slate-200 overflow-hidden hover:shadow-xl hover:-translate-y-1 transition-all duration-300 group cursor-pointer flex flex-col">
              <div className="relative h-56 overflow-hidden">
                <img src={blog.image} alt={blog.title} className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
                <div className="absolute top-4 left-4 bg-brand-gold text-brand-navy text-xs font-bold px-3 py-1 rounded-full flex items-center gap-1">
                  <Tag className="h-3 w-3" /> {blog.category}
                </div>
              </div>
              <div className="p-6 flex flex-col flex-1">
                <div className="flex items-center gap-4 text-xs text-slate-500 font-medium mb-3">
                  <span className="flex items-center gap-1"><Calendar className="h-3 w-3" /> {blog.date}</span>
                  <span className="flex items-center gap-1"><User className="h-3 w-3" /> {blog.author}</span>
                </div>
                <h2 className="text-xl font-bold text-brand-navy mb-3 leading-tight group-hover:text-brand-gold transition-colors">{blog.title}</h2>
                <p className="text-slate-600 text-sm mb-6 flex-1 line-clamp-3">{blog.excerpt}</p>
                <div className="flex items-center text-sm font-bold text-brand-gold mt-auto">
                  Read More <ArrowRight className="ml-2 h-4 w-4 group-hover:translate-x-1 transition-transform" />
                </div>
              </div>
            </div>
          ))}
        </div>

      </div>
    </div>
  );
}
