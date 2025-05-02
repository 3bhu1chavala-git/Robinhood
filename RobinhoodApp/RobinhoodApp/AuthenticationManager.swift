//
//  AuthenticationManager.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//
import SwiftUI

class AuthenticationManager: ObservableObject {
    @Published var isAuthenticated = false
    @Published var showOnboarding = true
    
    func signIn(email: String, password: String) {
        // TODO: Implement actual authentication
        isAuthenticated = true
        showOnboarding = false
    }
    
    func signUp(fullName: String, email: String, password: String) {
        // TODO: Implement actual registration
        isAuthenticated = true
        showOnboarding = false
    }
    
    func signOut() {
        isAuthenticated = false
        showOnboarding = false
    }
    
    func resetPassword(email: String) {
        // TODO: Implement password reset
    }
}
