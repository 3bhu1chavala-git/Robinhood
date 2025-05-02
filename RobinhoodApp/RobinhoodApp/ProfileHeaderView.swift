//
//  ProfileHeaderView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import Foundation
import SwiftUI

struct ProfileHeaderView: View {
    @EnvironmentObject private var authManager: AuthenticationManager
    @State private var showLogoutAlert = false
    var body: some View {
        VStack(spacing: 12) {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .foregroundColor(.gray)
                
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .background(Color.white)
                    .clipShape(Circle())
                    .offset(x: 4, y: 4)
            }
            
            Text("@abhinavj41663")
                .font(.headline)
            // Logout Button
            Button(action: {
                showLogoutAlert = true
            }) {
                Text("Log Out")
                    .foregroundColor(.red)
                    //.frame(maxWidth: .infinity)
                    //.padding()
                    
            }
            .padding(.horizontal, 20)
            .buttonStyle(.bordered)
            //.padding(.vertical, 16)
            .alert("Are you sure you want to log out?", isPresented: $showLogoutAlert) {
                Button("Cancel", role: .cancel) {}
                Button("Log Out", role: .destructive) {
                    authManager.signOut()
                }
            }
            Text("$97.81")
                .font(.system(size: 34, weight: .bold))
            
            Text("Total in Robinhood")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Button("Add account") {
                // Handle add account
            }
            .font(.footnote)
            .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
    }
}

#Preview {
    ProfileHeaderView()
        .padding()
}

