#!/bin/bash

echo "🛠️ Updating Blog Year, Removing Read More, and Fixing Footer..."

cat << 'EOF' > fix_text_elements.js
const fs = require('fs');

// 1. Update Footer (Remove "Made with ❤️ in India")
const footerPath = 'src/components/layout/Footer.tsx';
if (fs.existsSync(footerPath)) {
  let footer = fs.readFileSync(footerPath, 'utf8');
  footer = footer.replace(/<p[^>]*>Made with .*? in India<\/p>/g, '');
  footer = footer.replace(/Made with ❤️ in India/g, '');
  fs.writeFileSync(footerPath, footer);
  console.log("✅ Footer updated: Removed 'Made with ❤️ in India'.");
}

// 2. Update Blog Page (Replace 2024 with 2026 & Remove Read More)
const blogPath = 'src/app/(marketing)/blog/page.tsx';
if (fs.existsSync(blogPath)) {
  let blog = fs.readFileSync(blogPath, 'utf8');
  
  // Replace 2024 with 2026
  blog = blog.replace(/2024/g, '2026');
  
  // Remove "Read More" sections
  blog = blog.replace(/<div[^>]*>[\s\S]*?Read More[\s\S]*?<\/div>/g, '');
  blog = blog.replace(/Read More/g, '');
  
  fs.writeFileSync(blogPath, blog);
  console.log("✅ Blog updated: Year changed to 2026 & 'Read More' removed.");
} else {
  console.log("⚠️ Blog page not found at expected path. Trying global find...");
  // Fallback: search globally if path is different
  const { execSync } = require('child_process');
  try {
    execSync("grep -rl '2024' src/app/ | xargs sed -i 's/2024/2026/g'");
    execSync("grep -rl 'Read More' src/app/ | xargs sed -i 's/Read More//g'");
    console.log("✅ Global search and replace applied.");
  } catch (e) {
    console.log("No 2024 or Read More found globally.");
  }
}
EOF

node fix_text_elements.js
rm fix_text_elements.js

echo "=========================================="
echo "🎉 BLOG & FOOTER FIXES APPLIED!"
echo "Ab isko live karne ke liye GitHub par push karein:"
echo "git add ."
echo "git commit -m 'Fixed blog year, removed read more and footer text'"
echo "git push"
echo "=========================================="