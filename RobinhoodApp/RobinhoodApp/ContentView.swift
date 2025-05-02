//
//  ContentView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authManager = AuthenticationManager()
    
    var body: some View {
        NavigationView {
            Group {
                if authManager.showOnboarding {
                    OnboardingView()
                        .environmentObject(authManager)
                } else if authManager.isAuthenticated {
                    TabBarView()
                        .environmentObject(authManager)
                } else {
                    LoginView()
                        .environmentObject(authManager)
                }
            }.preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}


#Preview {
    ContentView()
}
