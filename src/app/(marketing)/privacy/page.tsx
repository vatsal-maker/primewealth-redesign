export default function PrivacyPage() {
  return (
    <div className="bg-white min-h-screen pt-32 pb-24 text-slate-900">
      <div className="container-page max-w-4xl">
        <h1 className="text-4xl font-extrabold mb-8">Privacy Policy</h1>
        <div className="space-y-6 text-slate-600">
          <p>Your privacy is important to us.</p>
          <h2 className="text-2xl font-bold text-slate-900 mt-8">1. Data Collection</h2>
          <p>We collect personal information like Name, Email, and Phone number when you fill out our forms or contact us.</p>
          <h2 className="text-2xl font-bold text-slate-900 mt-8">2. Data Usage</h2>
          <p>Your data is used solely to provide our advisory services and will never be sold to third parties.</p>
        </div>
      </div>
    </div>
  );
}
