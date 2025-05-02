//
//  RewardsView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 02/05/25.
//

import Foundation
import SwiftUI

struct RewardsView: View {
    @Binding var isPresented: Bool
    @State private var selectedFriend = 0
    
    let friends = [
        "friend1@email.com",
        "friend2@email.com"
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Image
                    Image(systemName: "gift.fill")
                        .font(.system(size: 60))
                        .foregroundColor(Theme.colors.accent)
                        .padding(.top, 20)
                    
                    // Main Text
                    VStack(spacing: 12) {
                        Text("Invite friends, earn rewards")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Get $10 in free stock for every friend who joins")
                            .font(.subheadline)
                            .foregroundColor(Theme.colors.textSecondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    // Rewards Info
                    rewardsInfoSection
                    
                    // Pending Invites
                    pendingInvitesSection
                    
                    // Share Button
                    Button(action: {
                        // Share action would go here
                    }) {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("Share your invite link")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Theme.colors.accent)
                        .foregroundColor(.black)
                        .cornerRadius(25)
                    }
                    .padding(.horizontal)
                    
                    // Terms
                    Text("See terms and conditions")
                        .font(.caption)
                        .foregroundColor(Theme.colors.textSecondary)
                        .padding(.bottom)
                }
            }
            .navigationTitle("Rewards")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        isPresented = false
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    private var rewardsInfoSection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 40) {
                VStack {
                    Text("$80")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Theme.colors.positive)
                    Text("Total earned")
                        .font(.caption)
                        .foregroundColor(Theme.colors.textSecondary)
                }
                
                VStack {
                    Text("8")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Friends joined")
                        .font(.caption)
                        .foregroundColor(Theme.colors.textSecondary)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.15))
            .cornerRadius(12)
        }
        .padding(.horizontal)
    }
    
    private var pendingInvitesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Pending Invites")
                .font(.headline)
                .padding(.horizontal)
            
            ForEach(friends.indices, id: \.self) { index in
                HStack {
                    VStack(alignment: .leading) {
                        Text(friends[index])
                            .font(.subheadline)
                        Text("Invited 2d ago")
                            .font(.caption)
                            .foregroundColor(Theme.colors.textSecondary)
                    }
                    
                    Spacer()
                    
                    Text("Pending")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.orange.opacity(0.2))
                        .foregroundColor(.orange)
                        .cornerRadius(4)
                }
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(12)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    RewardsView(isPresented: .constant(true))
}

