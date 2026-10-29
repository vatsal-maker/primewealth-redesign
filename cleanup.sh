#!/bin/bash
# ============================================================
#   PRIMEWEALTH PROJECT CLEANUP SCRIPT
# ============================================================

echo "🧹 Cleaning up PrimeWealth Project..."

# Check karo ki hum sahi folder me hain ya nahi
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json nahi mila! Kripya apne project ke root folder me aakar script run karein."
    exit 1
fi

# 1. Delete Nested Folder (jo duplicate files create kar raha tha)
if [ -d "primewealth-redesign" ]; then
    rm -rf primewealth-redesign
    echo "✅ Nested duplicate folder 'primewealth-redesign' deleted."
fi

# 2. Delete Unused Components
UNUSED_FILES=(
    "src/components/home/ParallaxShowcase.tsx"
    "src/components/home/Pricing.tsx"
    "src/components/home/Partners.tsx"
    "src/components/home/SchemeShowcase.tsx"
    "src/components/home/ServiceShowcase.tsx"
    "src/components/home/FundingMap.tsx"
    "src/components/ui/EMICalculator.tsx"
    "src/shared/data/india-map-paths.ts"
    "src/shared/data/state-funding-data.ts"
    "src/shared/data/funding-data.ts"
)

for file in "${UNUSED_FILES[@]}"; do
    if [ -f "$file" ]; then
        rm "$file"
        echo "✅ Deleted unused file: $file"
    fi
done

# 3. Delete Purane Bash Scripts (Sabhi .sh files delete hongi except ye wali cleanup.sh)
find . -maxdepth 1 -name "*.sh" ! -name "cleanup.sh" -exec rm -f {} \;
echo "✅ Purane saare bash scripts (.sh files) delete kar diye gaye."

# 4. Delete Bash Scripts jo 'primewealth-redesign' folder ke andar the (agar bache hon)
if [ -d "primewealth-redesign" ]; then
    find ./primewealth-redesign -name "*.sh" -exec rm -f {} \;
fi

echo "========================================="
echo "🎉 CLEANUP COMPLETE! Ab aapka project bilkul saaf hai."
echo "Ab aap safely naya code add kar sakte hain."
echo "========================================="