#!/bin/bash

echo "🛠️ Applying Smart Hide for Floating Buttons on Mobile Menu..."

# ==========================================
# 1. Update Header.tsx (Dispatch Events)
# ==========================================
cat << 'EOF' > fix_header_event.js
const fs = require('fs');
const path = 'src/components/layout/Header.tsx';
let content = fs.readFileSync(path, 'utf8');

const useEffectHook = `
  // Hide floating buttons when mobile menu is open
  useEffect(() => {
    if (mobileOpen) {
      document.body.style.overflow = 'hidden';
      window.dispatchEvent(new Event("mobileMenuOpened"));
    } else {
      document.body.style.overflow = 'auto';
      window.dispatchEvent(new Event("mobileMenuClosed"));
    }
  }, [mobileOpen]);
`;

// Remove old logic if it exists
content = content.replace(/\/\/ Hide floating buttons when mobile menu is open[\s\S]*?\}, \[mobileOpen\]\);/g, '');

// Insert new logic
if (!content.includes("mobileMenuOpened")) {
  content = content.replace(
    /window.addEventListener\("resize", handleResize\);\n    return \(\) => window.removeEventListener\("resize", handleResize\);\n  \}, \[\]\);/,
    `window.addEventListener("resize", handleResize);\n    return () => window.removeEventListener("resize", handleResize);\n  }, []);\n${useEffectHook}`
  );
  fs.writeFileSync(path, content);
  console.log("✅ Header.tsx updated to dispatch events.");
} else {
  console.log("✅ Header.tsx already has the logic.");
}
EOF
node fix_header_event.js
rm fix_header_event.js

# ==========================================
# 2. Update PremiumMultiStepModal.tsx (Listen & Hide)
# ==========================================
cat << 'EOF' > fix_modal_btn.js
const fs = require('fs');
const path = 'src/components/ui/PremiumMultiStepModal.tsx';
let content = fs.readFileSync(path, 'utf8');

// Add state
if (!content.includes("isMenuOpen")) {
  content = content.replace(
    "const [isLoading, setIsLoading] = useState(false);",
    "const [isLoading, setIsLoading] = useState(false);\n  const [isMenuOpen, setIsMenuOpen] = useState(false);"
  );
  
  // Add event listeners
  content = content.replace(
    "const handleOpen = () => setIsOpen(true);",
    `const handleOpen = () => setIsOpen(true);
    const handleMenuOpen = () => setIsMenuOpen(true);
    const handleMenuClose = () => setIsMenuOpen(false);
    window.addEventListener("mobileMenuOpened", handleMenuOpen);
    window.addEventListener("mobileMenuClosed", handleMenuClose);`
  );
  
  content = content.replace(
    'return () => window.removeEventListener("open-eligibility-modal", handleOpen);',
    `return () => {
      window.removeEventListener("open-eligibility-modal", handleOpen);
      window.removeEventListener("mobileMenuOpened", handleMenuOpen);
      window.removeEventListener("mobileMenuClosed", handleMenuClose);
    };`
  );

  // Hide button if menu is open
  content = content.replace(
    "<motion.button \n        whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}",
    "{!isMenuOpen && (\n      <motion.button \n        whileHover={{ scale: 1.05 }} whileTap={{ scale: 0.95 }}"
  );
  
  content = content.replace(
    "Check Eligibility <ArrowRight className=\"h-4 w-4\" />\n      </motion.button>",
    "Check Eligibility <ArrowRight className=\"h-4 w-4\" />\n      </motion.button>\n      )}"
  );

  fs.writeFileSync(path, content);
  console.log("✅ PremiumMultiStepModal updated.");
}
EOF
node fix_modal_btn.js
rm fix_modal_btn.js

# ==========================================
# 3. Update AIChatWidget.tsx (Listen & Hide)
# ==========================================
cat << 'EOF' > fix_chat_btn.js
const fs = require('fs');
const path = 'src/components/ui/AIChatWidget.tsx';
let content = fs.readFileSync(path, 'utf8');

if (!content.includes("isMenuOpen")) {
  content = content.replace(
    "const [isOpen, setIsOpen] = useState(false);",
    "const [isOpen, setIsOpen] = useState(false);\n  const [isMenuOpen, setIsMenuOpen] = useState(false);"
  );

  content = content.replace(
    'export function AIChatWidget() {',
    `export function AIChatWidget() {`
  );

  // Add useEffect for events
  if (!content.includes("useEffect")) {
    content = content.replace(
      'import { useState } from "react";',
      'import { useState, useEffect } from "react";'
    );
    content = content.replace(
      "const [isMenuOpen, setIsMenuOpen] = useState(false);",
      `const [isMenuOpen, setIsMenuOpen] = useState(false);

  useEffect(() => {
    const handleMenuOpen = () => setIsMenuOpen(true);
    const handleMenuClose = () => setIsMenuOpen(false);
    window.addEventListener("mobileMenuOpened", handleMenuOpen);
    window.addEventListener("mobileMenuClosed", handleMenuClose);
    return () => {
      window.removeEventListener("mobileMenuOpened", handleMenuOpen);
      window.removeEventListener("mobileMenuClosed", handleMenuClose);
    };
  }, []);`
    );
  }

  // Hide widget if menu is open
  content = content.replace(
    '<div className="fixed bottom-6 right-4 md:right-6 z-[9999] flex flex-col items-end">',
    '{!isMenuOpen && (\n    <div className="fixed bottom-6 right-4 md:right-6 z-[9999] flex flex-col items-end">'
  );
  content = content.replace(
    '</div>\n  );',
    '</div>\n    )}\n  );'
  );

  fs.writeFileSync(path, content);
  console.log("✅ AIChatWidget updated.");
}
EOF
node fix_chat_btn.js
rm fix_chat_btn.js

# ==========================================
# 4. Update LiveNotifications.tsx (Listen & Hide)
# ==========================================
cat << 'EOF' > fix_notif_btn.js
const fs = require('fs');
const path = 'src/components/ui/LiveNotifications.tsx';
let content = fs.readFileSync(path, 'utf8');

if (!content.includes("isMenuOpen")) {
  content = content.replace(
    "const [isVisible, setIsVisible] = useState(false);",
    "const [isVisible, setIsVisible] = useState(false);\n  const [isMenuOpen, setIsMenuOpen] = useState(false);"
  );

  content = content.replace(
    "useEffect(() => {",
    `useEffect(() => {
    const handleMenuOpen = () => setIsMenuOpen(true);
    const handleMenuClose = () => setIsMenuOpen(false);
    window.addEventListener("mobileMenuOpened", handleMenuOpen);
    window.addEventListener("mobileMenuClosed", handleMenuClose);
    return () => {
      window.removeEventListener("mobileMenuOpened", handleMenuOpen);
      window.removeEventListener("mobileMenuClosed", handleMenuClose);
    };
  }, []);

  useEffect(() => {`
  );

  // Hide if menu is open
  content = content.replace(
    '<div className="fixed bottom-28 md:bottom-6 left-4 md:left-6 z-40">',
    '{!isMenuOpen && (\n    <div className="fixed bottom-28 md:bottom-6 left-4 md:left-6 z-40">'
  );
  content = content.replace(
    '</div>\n  );',
    '</div>\n    )}\n  );'
  );

  fs.writeFileSync(path, content);
  console.log("✅ LiveNotifications updated.");
}
EOF
node fix_notif_btn.js
rm fix_notif_btn.js

# ==========================================
# 5. Clean up old CSS rule (No longer needed)
# ==========================================
cat << 'EOF' > clean_css.js
const fs = require('fs');
const path = 'src/app/globals.css';
let content = fs.readFileSync(path, 'utf8');

content = content.replace(/\/\* Hide floating buttons on mobile when menu is open \*\/[\s\S]*?\/\* END \*\/\n?/g, '');
content = content.replace(/\/\* Hide floating buttons on mobile when menu is open \*\/\n@media \(max-width: 1023px\) \{\n  body\.mobile-menu-open \.floating-btn \{\n    display: none !important;\n  \}\n\}\n?/g, '');

fs.writeFileSync(path, content);
console.log("✅ Old CSS cleaned up.");
EOF
node clean_css.js
rm clean_css.js

echo "=========================================="
echo "🎉 OVERLAP FIXED WITH REACT STATE!"
echo "Ab isko live karne ke liye GitHub par push karein:"
echo "git add ."
echo "git commit -m 'Fixed mobile menu overlap with floating buttons'"
echo "git push"
echo "=========================================="