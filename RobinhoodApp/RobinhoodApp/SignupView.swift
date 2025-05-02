import SwiftUI

struct SignupView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var authManager: AuthenticationManager
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var acceptedTerms = false
    
    var isSignupValid: Bool {
        !fullName.isEmpty && !email.isEmpty && !password.isEmpty && acceptedTerms
    }
    
    var body: some View {
        NavigationView {
            
            ScrollView{
                VStack(spacing: 20) {
                    // Header
                    VStack(spacing: 8) {
                        Text("Sign Up")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Create your account to get started")
                            .font(.subheadline)
                            .foregroundColor(Theme.colors.textSecondary)
                    }
                    .padding(.top, 60)
                    
                    // Form fields
                    VStack(spacing: 16) {
                        TextField("Full Name", text: $fullName)
                            .textContentType(.name)
                            .padding()
                            .background(Theme.colors.surface)
                            .cornerRadius(10)
                        
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .background(Theme.colors.surface)
                            .cornerRadius(10)
                        
                        SecureField("Password", text: $password)
                            .textContentType(.newPassword)
                            .padding()
                            .background(Theme.colors.surface)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    
                    // Terms and conditions
                    Toggle(isOn: $acceptedTerms) {
                        Text("I accept the Terms of Service and Privacy Policy")
                            .font(.footnote)
                            .foregroundColor(Theme.colors.textSecondary)
                    }
                    .padding(.vertical)
                    
                    // Sign up button
                    Button(action: {
                        authManager.signUp(fullName: fullName, email: email, password: password)
                    }) {
                        Text("Create Account")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(isSignupValid ? Color.black : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .disabled(!isSignupValid)
                    
                    // Divider
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.4))
                        Text("OR")
                            .font(.caption)
                            .foregroundColor(Theme.colors.textSecondary)
                            .padding(.horizontal, 8)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray.opacity(0.4))
                    }
                    .padding(.vertical)
                    
                    // Social signup buttons
                    VStack(spacing: 12) {
                        Button(action: {
                            // TODO: Implement Apple Sign Up
                        }) {
                            HStack {
                                Image(systemName: "apple.logo")
                                    .font(.title3)
                                Text("Continue with Apple")
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                        
                        Button(action: {
                            // TODO: Implement Google Sign Up
                        }) {
                            HStack {
                                Image(systemName: "g.circle.fill")
                                    .font(.title3)
                                Text("Continue with Google")
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                    }
                    
                    Spacer()
                    
                    // Login link
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(Theme.colors.textSecondary)
                        NavigationLink("Log In") {
                            LoginView()
                        }
                        .foregroundColor(.blue)
                        .fontWeight(.semibold)
                    }
                }
                .padding(.horizontal, 24)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark")
                                .foregroundColor(Theme.colors.textPrimary)
                        }
                    }
                }
            }.scrollIndicators(.hidden)
           
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    SignupView()
        .environmentObject(AuthenticationManager())
}

