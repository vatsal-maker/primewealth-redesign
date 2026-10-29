#!/bin/bash

echo "🚀 Fixing Mobile Menu Overlap..."

# ==========================================
# 1. Add body class toggle in Header.tsx
# ==========================================
cat << 'EOF' > fix_header_body_class.js
const fs = require('fs');
const path = 'src/components/layout/Header.tsx';
let content = fs.readFileSync(path, 'utf8');

// Add useEffect to toggle body class
const useEffectHook = `
  // Hide floating buttons when mobile menu is open
  useEffect(() => {
    if (mobileOpen) {
      document.body.classList.add("mobile-menu-open");
    } else {
      document.body.classList.remove("mobile-menu-open");
    }
    return () => document.body.classList.remove("mobile-menu-open");
  }, [mobileOpen]);
`;

// Insert it after the existing resize useEffect
if (!content.includes("mobile-menu-open")) {
  content = content.replace(
    /window.addEventListener\("resize", handleResize\);\n    return \(\) => window.removeEventListener\("resize", handleResize\);\n  \}, \[\]\);/,
    `window.addEventListener("resize", handleResize);\n    return () => window.removeEventListener("resize", handleResize);\n  }, []);\n${useEffectHook}`
  );
  fs.writeFileSync(path, content);
  console.log("✅ Header.tsx updated with body class toggle.");
} else {
  console.log("✅ Header.tsx already has the logic.");
}
EOF
node fix_header_body_class.js
rm fix_header_body_class.js

# ==========================================
# 2. Add CSS to hide floating buttons
# ==========================================
cat << 'EOF' >> src/app/globals.css

/* Hide floating buttons on mobile when menu is open */
@media (max-width: 1023px) {
  body.mobile-menu-open .floating-btn {
    display: none !important;
  }
}
EOF
echo "✅ globals.css updated with hide logic."

# ==========================================
# 3. Add 'floating-btn' class to PremiumMultiStepModal
# ==========================================
cat << 'EOF' > fix_modal_btn.js
const fs = require('fs');
const path = 'src/components/ui/PremiumMultiStepModal.tsx';
let content = fs.readFileSync(path, 'utf8');

content = content.replace(
  /className="fixed bottom-24 right-4 md:right-6 z-\[999\]/g,
  `className="floating-btn fixed bottom-24 right-4 md:right-6 z-[999]`
);
fs.writeFileSync(path, content);
console.log("✅ PremiumMultiStepModal button class updated.");
EOF
node fix_modal_btn.js
rm fix_modal_btn.js

# ==========================================
# 4. Add 'floating-btn' class to AIChatWidget
# ==========================================
cat << 'EOF' > fix_chat_btn.js
const fs = require('fs');
const path = 'src/components/ui/AIChatWidget.tsx';
let content = fs.readFileSync(path, 'utf8');

content = content.replace(
  /className="fixed bottom-6 right-4 md:right-6 z-\[9999\]/g,
  `className="floating-btn fixed bottom-6 right-4 md:right-6 z-[9999]`
);
fs.writeFileSync(path, content);
console.log("✅ AIChatWidget button class updated.");
EOF
node fix_chat_btn.js
rm fix_chat_btn.js

# ==========================================
# 5. Add 'floating-btn' class to LiveNotifications
# ==========================================
cat << 'EOF' > fix_notif_btn.js
const fs = require('fs');
const path = 'src/components/ui/LiveNotifications.tsx';
let content = fs.readFileSync(path, 'utf8');

content = content.replace(
  /className="fixed bottom-28 md:bottom-6 left-4 md:left-6 z-40"/g,
  `className="floating-btn fixed bottom-28 md:bottom-6 left-4 md:left-6 z-40"`
);
fs.writeFileSync(path, content);
console.log("✅ LiveNotifications class updated.");
EOF
node fix_notif_btn.js
rm fix_notif_btn.js

echo "=========================================="
echo "🎉 MOBILE OVERLAP FIXED!"
echo "Ab isko live karne ke liye GitHub par push karein:"
echo "git add ."
echo "git commit -m 'Fixed mobile menu button overlap'"
echo "git push"
echo "=========================================="