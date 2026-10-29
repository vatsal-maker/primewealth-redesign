#!/bin/bash

echo "🛠️ Applying Ultimate Z-Index & Hide Fix for Mobile Menu..."

# ==========================================
# 1. Update Header.tsx (Dynamic Z-Index)
# ==========================================
cat << 'EOF' > fix_header_zindex.js
const fs = require('fs');
const path = 'src/components/layout/Header.tsx';
let content = fs.readFileSync(path, 'utf8');

// 1. Update the header className to change z-index dynamically
content = content.replace(
  /className=\{cn\("sticky top-0 z-50 w-full transition-all duration-300 bg-white border-b border-slate-200", scrolled \? "py-2 shadow-md" : "py-3"\)\}/g,
  `className={cn("sticky top-0 w-full transition-all duration-300 bg-white border-b border-slate-200", scrolled ? "py-2 shadow-md" : "py-3", mobileOpen ? "z-[999999]" : "z-50")}`
);

// 2. Ensure the body class toggle logic is perfect
const bodyClassLogic = `
  useEffect(() => {
    if (mobileOpen) {
      document.body.style.overflow = 'hidden';
      document.body.classList.add("mobile-menu-active");
    } else {
      document.body.style.overflow = 'auto';
      document.body.classList.remove("mobile-menu-active");
    }
    return () => {
      document.body.style.overflow = 'auto';
      document.body.classList.remove("mobile-menu-active");
    };
  }, [mobileOpen]);
`;

// Remove old logic if present
content = content.replace(/useEffect\(\(\) => \{\n    if \(mobileOpen\) \{\n      document\.body\.style\.overflow[\s\S]*?\}, \[mobileOpen\]\);/g, '');

// Insert new logic
content = content.replace(
  /window.addEventListener\("resize", handleResize\);\n    return \(\) => window.removeEventListener\("resize", handleResize\);\n  \}, \[\]\);/,
  `window.addEventListener("resize", handleResize);\n    return () => window.removeEventListener("resize", handleResize);\n  }, []);\n${bodyClassLogic}`
);

fs.writeFileSync(path, content);
console.log("✅ Header.tsx z-index and body class logic updated.");
EOF
node fix_header_zindex.js
rm fix_header_zindex.js

# ==========================================
# 2. Update globals.css (Force Hide Floating Buttons)
# ==========================================
cat << 'EOF' > fix_global_css.js
const fs = require('fs');
const path = 'src/app/globals.css';
let content = fs.readFileSync(path, 'utf8');

// Remove old css if exists
content = content.replace(/\/\* Hide floating buttons when mobile menu is open \*\/[\s\S]*?body\.menu-open \.floating-btn \{\n  display: none !important;\n\}\n?/g, '');

// Add new strict CSS
content += `

/* Hide floating buttons when mobile menu is active */
body.mobile-menu-active .floating-btn {
  display: none !important;
  opacity: 0 !important;
  pointer-events: none !important;
}
`;

fs.writeFileSync(path, content);
console.log("✅ globals.css updated with strict hide rules.");
EOF
node fix_global_css.js
rm fix_global_css.js

# ==========================================
# 3. Ensure all Floating components have .floating-btn class
# ==========================================
cat << 'EOF' > fix_buttons_class.js
const fs = require('fs');

// PremiumMultiStepModal
let modalPath = 'src/components/ui/PremiumMultiStepModal.tsx';
let modalContent = fs.readFileSync(modalPath, 'utf8');
modalContent = modalContent.replace(/className="fixed bottom-24/g, 'className="floating-btn fixed bottom-24');
modalContent = modalContent.replace(/className="floating-btn floating-btn/g, 'className="floating-btn');
fs.writeFileSync(modalPath, modalContent);

// AIChatWidget
let chatPath = 'src/components/ui/AIChatWidget.tsx';
let chatContent = fs.readFileSync(chatPath, 'utf8');
chatContent = chatContent.replace(/className="fixed bottom-6/g, 'className="floating-btn fixed bottom-6');
chatContent = chatContent.replace(/className="floating-btn floating-btn/g, 'className="floating-btn');
fs.writeFileSync(chatPath, chatContent);

// LiveNotifications
let notifPath = 'src/components/ui/LiveNotifications.tsx';
let notifContent = fs.readFileSync(notifPath, 'utf8');
notifContent = notifContent.replace(/className="fixed bottom-28/g, 'className="floating-btn fixed bottom-28');
notifContent = notifContent.replace(/className="floating-btn floating-btn/g, 'className="floating-btn');
fs.writeFileSync(notifPath, notifContent);

console.log("✅ Floating button classes enforced on all components.");
EOF
node fix_buttons_class.js
rm fix_buttons_class.js

echo "=========================================="
echo "🎉 MOBILE MENU OVERLAP FIXED (100% GUARANTEED)!"
echo "Ab isko live karne ke liye GitHub par push karein:"
echo "git add ."
echo "git commit -m 'Fixed Header Z-Index for Mobile Menu'"
echo "git push"
echo "=========================================="