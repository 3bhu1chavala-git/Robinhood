import SwiftUI
struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var authManager: AuthenticationManager
    @State private var email = ""
    @State private var password = ""
    
    var isLoginValid: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 8) {
                    Text("Log In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Access your account securely")
                        .font(.subheadline)
                        .foregroundColor(Theme.colors.textSecondary)
                }
                .padding(.top, 60)
                
                // Form fields
                VStack(spacing: 16) {
                    TextField("Email or Phone", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.username)
                        .autocapitalization(.none)
                        .padding()
                        .background(Theme.colors.surface)
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .textContentType(.password)
                        .padding()
                        .background(Theme.colors.surface)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                
                // Forgot password
                HStack {
                    Spacer()
                    NavigationLink("Forgot Password?") {
                        ForgotPasswordView()
                    }
                    .font(.footnote)
                    .foregroundColor(.blue)
                }
                
                // Login button
                Button(action: {
                    authManager.signIn(email: email, password: password)
                }) {
                    Text("Log In")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(isLoginValid ? Color.white : Color.gray)
                        .foregroundColor(isLoginValid ? Color.black : Color.white)
                        .cornerRadius(25)
                }
                .disabled(!isLoginValid)
                .padding(.top, 20)
                
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
                
                // Social login buttons
                VStack(spacing: 12) {
                    Button(action: {
                        // TODO: Implement Apple Sign In
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
                        // TODO: Implement Google Sign In
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
                
                // Sign up link
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(Theme.colors.textSecondary)
                    NavigationLink("Sign Up") {
                        SignupView()
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.semibold)
                }
            }
            .padding(.horizontal, 24)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        authManager.showOnboarding = true
                        authManager.isAuthenticated = false
                        dismiss()
    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Theme.colors.textPrimary)
                    }
                }
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationManager())
}

