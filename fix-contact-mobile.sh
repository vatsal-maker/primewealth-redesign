#!/bin/bash

echo "📱 Adding WhatsApp Button to Mobile Header..."

# We will inject the WhatsApp button right next to the mobile menu icon in Header.tsx
cat << 'EOF' > fix_header_mobile.js
const fs = require('fs');
const path = 'src/components/layout/Header.tsx';
let content = fs.readFileSync(path, 'utf8');

// Target the specific mobile menu button block
const oldBlock = `        {/* Mobile Menu Trigger */}
        <button className="lg:hidden p-2 text-brand-navy z-50 relative" onClick={() => setMobileOpen(true)}>
          <Menu className="h-7 w-7" />
        </button>`;

const newBlock = `        {/* Mobile Right Actions (WhatsApp + Menu) */}
        <div className="flex items-center gap-3 lg:hidden z-50 relative">
          <a href={site.whatsapp} target="_blank" rel="noopener noreferrer" className="flex items-center gap-1.5 bg-[#25D366] text-white px-3 py-1.5 rounded-full text-xs font-bold shadow-md hover:bg-[#1eb857] transition-colors">
            <MessageCircle className="h-3.5 w-3.5" /> WhatsApp
          </a>
          <button className="p-1 text-brand-navy" onClick={() => setMobileOpen(true)}>
            <Menu className="h-7 w-7" />
          </button>
        </div>`;

if (content.includes(oldBlock)) {
    content = content.replace(oldBlock, newBlock);
    fs.writeFileSync(path, content);
    console.log("✅ WhatsApp button successfully added to mobile header.");
} else {
    console.log("⚠️ Could not find the exact mobile menu block. Please check Header.tsx manually.");
}
EOF

node fix_header_mobile.js
rm fix_header_mobile.js

echo "=========================================="
echo "🎉 MOBILE HEADER UPDATED!"
echo "Ab isko live karne ke liye ye commands chalayein:"
echo "git add ."
echo "git commit -m 'Added WhatsApp to mobile header'"
echo "git push"
echo "=========================================="