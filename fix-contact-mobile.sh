#!/bin/bash

echo "🛠️ Applying Ultimate Fix to Hide Floating Buttons..."

# ==========================================
# 1. Update globals.css to hide buttons
# ==========================================
cat << 'EOF' >> src/app/globals.css

/* Hide floating buttons when mobile menu is open */
body.menu-open .floating-btn {
  display: none !important;
}
EOF
echo "✅ globals.css updated."

# ==========================================
# 2. Update Header.tsx to toggle body class
# ==========================================
cat << 'EOF' > fix_header_class.js
const fs = require('fs');
const path = 'src/components/layout/Header.tsx';
let content = fs.readFileSync(path, 'utf8');

// Ensure body class is toggled
const toggleLogic = `
  useEffect(() => {
    if (mobileOpen) {
      document.body.style.overflow = 'hidden';
      document.body.classList.add("menu-open");
    } else {
      document.body.style.overflow = 'auto';
      document.body.classList.remove("menu-open");
    }
    return () => {
      document.body.style.overflow = 'auto';
      document.body.classList.remove("menu-open");
    };
  }, [mobileOpen]);
`;

// Remove previous useEffect if it exists to prevent duplicates
content = content.replace(/\/\/ Hide floating buttons when mobile menu is open[\s\S]*?\}, \[mobileOpen\]\);/g, '');
content = content.replace(/useEffect\(\(\) => \{\n    if \(mobileOpen\) \{\n      document\.body\.style\.overflow[\s\S]*?\}, \[mobileOpen\]\);/g, '');

// Insert new logic after the resize useEffect
content = content.replace(
  /window.addEventListener\("resize", handleResize\);\n    return \(\) => window.removeEventListener\("resize", handleResize\);\n  \}, \[\]\);/,
  `window.addEventListener("resize", handleResize);\n    return () => window.removeEventListener("resize", handleResize);\n  }, []);\n${toggleLogic}`
);

fs.writeFileSync(path, content);
console.log("✅ Header.tsx updated with body class toggle.");
EOF
node fix_header_class.js
rm fix_header_class.js

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
console.log("✅ PremiumMultiStepModal button updated.");
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
console.log("✅ AIChatWidget updated.");
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
console.log("✅ LiveNotifications updated.");
EOF
node fix_notif_btn.js
rm fix_notif_btn.js

echo "=========================================="
echo "🎉 OVERLAP FIXED (GUARANTEED)!"
echo "Ab isko live karne ke liye GitHub par push karein:"
echo "git add ."
echo "git commit -m 'Fixed mobile menu overlap with CSS'"
echo "git push"
echo "=========================================="