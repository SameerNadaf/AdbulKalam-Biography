//
//  AboutView.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import SwiftUI
import MessageUI

struct AboutView: View {
    
    @State private var isMailPresented = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                appIdentity
                Divider()

                Text("About")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                aboutSection
                Divider()

                Text("More")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                moreSection
                Divider()

                Text("Developer")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                developerInfo
                Divider()

                footer
            }
            .padding()
        }
        .frame(maxWidth: UIDevice.current.userInterfaceIdiom == .pad ? UIScreen.main.bounds.width * 0.8 : .infinity)
        .scrollIndicators(.hidden)
        .sheet(isPresented: $isMailPresented) {
            MailView(isPresented: $isMailPresented,
                     recipients: ["nsameernadaf@gmail.com"],
                     subject: "Feedback for InspireMe App")
        }
    }
}

extension AboutView {
    
    private var appIdentity: some View {
        HStack(spacing: 16) {
            Image("appIcon")
                .resizable()
                .frame(width: 100, height: 100)
            
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Dr. A.P.J. Abdul Kalam")
                    .font(.title2)
                    .bold()
                Text("Biography App")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("www.dummy.inspireme.com")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
        }
        .padding(.bottom, 10)
    }
    
    private var aboutSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                if let url = URL(string: "https://www.apple.com/app-store/") {
                    UIApplication.shared.open(url)
                }
            } label: {
                AboutRow(icon: "refresh", iconColor: .orange, text: "Check for Updates")
            }
            Button {
                // Open App Store app page (replace YOUR_APP_ID)
                if let url = URL(string: "https://www.apple.com/app-store/") {
                    UIApplication.shared.open(url)
                }
                
            } label: {
                AboutRow(icon: "star", iconColor: .yellow, text: "Rate and Review")
            }
            Button {
                if MFMailComposeViewController.canSendMail() {
                    isMailPresented = true
                } else {
                    print("Mail not configured on this device")
                }
            } label: {
                AboutRow(icon: "feedback", iconColor: .blue, text: "Send Feedback")
            }
            Button {
                let url = URL(string: "https://www.apple.com/app-store/")!
                let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
                UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true)
            } label: {
                AboutRow(icon: "share", iconColor: .green, text: "Share this App")
            }
        }
    }
    
    private var moreSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Button {
                if let url = URL(string: "tel:+918310087784") {
                    UIApplication.shared.open(url)
                }
            } label: {
                AboutRow(icon: "telephone", iconColor: .blue, text: "Contact Us")
            }
            
            Button {
                if let url = URL(string: "https://www.apple.com/app-store/") {
                    UIApplication.shared.open(url)
                }
            } label: {
                AboutRow(icon: "appStore", iconColor: .purple, text: "More Apps")
            }
        }
    }
    
    private var developerInfo: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Image("sameer")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .shadow(radius: 4)
                    .padding()
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Sameer Nadaf")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("iOS Developer")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            Text("Made with SwiftUI by Sameer Nadaf, an iOS enthusiast who believes in the power of technology to inspire change. Inspired by Dr. Kalam’s vision for youth and innovation, this app is built with the same spirit of perseverance, curiosity, and creativity.")
                .foregroundColor(.primary)
                .font(.footnote)
                .padding(.top, 4)
        }
    }
    
    private var footer: some View {
        Text("Version \(Bundle.main.appVersion) (\(Bundle.main.buildNumber))")
            .font(.footnote)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
}

struct MailView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    var recipients: [String]
    var subject: String

    func makeUIViewController(context: Context) -> some UIViewController {
        let mailVC = MFMailComposeViewController()
        mailVC.setToRecipients(recipients)
        mailVC.setSubject(subject)
        mailVC.mailComposeDelegate = context.coordinator
        return mailVC
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented)
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isPresented: Bool

        init(isPresented: Binding<Bool>) {
            _isPresented = isPresented
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            isPresented = false
            controller.dismiss(animated: true)
        }
    }
}

#Preview {
    AboutView()
}
