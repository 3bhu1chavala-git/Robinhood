import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var authManager: AuthenticationManager
    @State private var currentPage = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Full screen background image
                Image("onboarding_background")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                
                // Content overlay
                VStack(spacing: 0) {
                    TabView(selection: $currentPage) {
                        ForEach(0..<3) { index in
                            OnboardingContent(index: index)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 200)
                     Spacer()
                    VStack(spacing: 30) {
                        // Custom animated page indicator
                        HStack(spacing: 8) {
                            ForEach(0..<3) { index in
                                Circle()
                                    .fill(index == currentPage ? Color.black : Color.gray.opacity(0.4))
                                    .frame(width: 8, height: 8)
                                    .scaleEffect(index == currentPage ? 1.2 : 1.0)
                                    .animation(.easeInOut(duration: 0.3), value: currentPage)
                            }
                        }
                        
                        // CTA buttons
                        HStack(spacing: 16) {
                            NavigationLink(destination: LoginView()) {
                                Text("Log in")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color.white)
                                    .foregroundColor(.black)
                                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black.opacity(0.1), lineWidth: 1))
                                    .cornerRadius(30)
                            }

                            NavigationLink(destination: SignupView()) {
                                Text("Sign up")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                            }
                        }
                        .padding(.horizontal, 80)
                    }
                    .padding(.bottom, 30)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct OnboardingContent: View {
    let index: Int
    
    
    
    private let titles = [
        "Welcome\nto Robinhood",
        "Invest\nCommission-Free",
        "Trade Crypto\n& ETFs"
    ]
    
    private let subtitles = [
        "Join 23 million customers with access to US stocks and put your money in motion.",
        "Enjoy $0 commissions on stocks, ETFs, and more.",
        "Diversify with cryptocurrencies, options, and ETFs."
    ]
    
    private var title: String {
        titles[index]
    }
    
    private var subtitle: String {
        subtitles[index]
    }

    var body: some View {
       
            VStack(spacing: 20) {
                Text(title)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .lineSpacing(4)

                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.black.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
            }
            
           
        }
       
    }

#Preview {
    OnboardingView()
}

