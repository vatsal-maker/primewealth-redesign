import { NextResponse } from "next/server";
import nodemailer from "nodemailer";

export async function POST(req: Request) {
  try {
    const { name, phone, type, stage, detail } = await req.json();

    // ⚠️ YAHAN APNI EMAIL AUR APP PASSWORD DAALEIN
    const transporter = nodemailer.createTransport({
      host: "smtp.gmail.com", 
      port: 587,
      secure: false, 
      auth: {
        user: "info@primewealthadvisory.com", // Apna Email
        pass: "abcd efgh ijkl mnop",          // Gmail App Password
      },
    });

    const mailOptions = {
      from: `"PrimeWealth Website" <info@primewealthadvisory.com>`,
      to: "info@primewealthadvisory.com", // Jahan email aani chahiye
      subject: "🔥 New High-Intent Enquiry from Website",
      html: `
        <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; border: 1px solid #e2e8f0; border-radius: 10px; overflow: hidden;">
          <div style="background-color: #0A192F; padding: 20px; text-align: center;">
            <h2 style="color: #D4AF37; margin: 0;">New Enquiry Received</h2>
          </div>
          <div style="padding: 20px; background-color: #ffffff;">
            <p style="font-size: 16px; color: #333;"><strong>Name:</strong> ${name}</p>
            <p style="font-size: 16px; color: #333;"><strong>Phone:</strong> ${phone}</p>
            <hr style="border: 1px solid #e2e8f0; margin: 20px 0;" />
            <p style="font-size: 16px; color: #333;"><strong>Service Needed:</strong> ${type}</p>
            <p style="font-size: 16px; color: #333;"><strong>Business Stage:</strong> ${stage}</p>
            <p style="font-size: 16px; color: #333;"><strong>Requirement/Timeline:</strong> ${detail}</p>
          </div>
          <div style="background-color: #f8fafc; padding: 15px; text-align: center; color: #64748b; font-size: 12px;">
            Generated from PrimeWealth Advisory Website
          </div>
        </div>
      `,
    };

    await transporter.sendMail(mailOptions);
    return NextResponse.json({ success: true, message: "Email sent" }, { status: 200 });
  } catch (error) {
    console.error("Email error:", error);
    return NextResponse.json({ success: false, message: "Failed" }, { status: 500 });
  }
}
