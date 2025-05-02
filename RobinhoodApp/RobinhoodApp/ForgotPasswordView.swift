//
//  ForgotPasswordView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var email = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 8) {
                    Text("Reset Password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Enter your email to reset your password")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 60)
                
                // Email field
                VStack(spacing: 16) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.top, 40)
                
                // Reset button
                Button(action: resetPassword) {
                    Text("Send Reset Link")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(!email.isEmpty ? Color.black : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(25)
                }
                .disabled(email.isEmpty)
                .padding(.top, 20)
                
                // Back to login button
                Button(action: { dismiss() }) {
                    Text("Back to Login")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                .padding(.top, 16)
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                }
            }
            .alert("Password Reset", isPresented: $showAlert) {
                Button("OK", role: .cancel) {
                    if alertMessage.contains("sent") {
                        dismiss()
                    }
                }
            } message: {
                Text(alertMessage)
            }
        }.navigationBarBackButtonHidden()
    }
    
    private func resetPassword() {
        guard !email.isEmpty else {
            alertMessage = "Please enter your email address"
            showAlert = true
            return
        }
        
        // TODO: Implement password reset
        alertMessage = "If an account exists for \(email), you will receive password reset instructions."
        showAlert = true
    }
}

#Preview {
    ForgotPasswordView()
}
