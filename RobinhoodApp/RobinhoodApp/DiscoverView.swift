//
//  DiscoverView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 02/05/25.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            // Header
            HStack {
                Text("Discover more")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Theme.colors.textPrimary)
                
                Image(systemName: "info.circle")
                    .foregroundColor(Theme.colors.textSecondary)
            }
            
            // Gold APY Card
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("4.5% APY with Gold")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Theme.colors.textPrimary)
                    
                    Spacer()
                    
                    Text("4.5%")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Theme.colors.textPrimary)
                }
                
                Text("Boost your rate on uninvested cash")
                    .font(.system(size: 14))
                    .foregroundColor(Theme.colors.textSecondary)
            }
            .padding()
            .background(Theme.colors.surface)
            .cornerRadius(12)
            
            // Strategy Card
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Robinhood Strategies")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Theme.colors.textPrimary)
                    
                    Text("Get access to an expert-managed portfolio")
                        .font(.system(size: 14))
                        .foregroundColor(Theme.colors.textSecondary)
                }
                
                Spacer()
                
                Button(action: {
                    // Handle learn more
                }) {
                    Text("Learn")
                        .font(.system(size: 14, weight: .medium))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Theme.colors.positive)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                }
            }
            .padding()
            .background(Theme.colors.surface)
            .cornerRadius(12)
            
            // Retirement Card
            FeatureCard(
                icon: "arrow.counterclockwise",
                title: "Retirement",
                description: "Earn up to 2% on tax benefits till April 30",
                iconBackgroundColor: Color.blue.opacity(0.2)
            )
            
            // Transfer Card
            FeatureCard(
                icon: "arrow.left.arrow.right",
                title: "Transfer accounts in",
                description: "Consolidate assets",
                iconBackgroundColor: Theme.colors.positive.opacity(0.2)
            )
            
        }
        //.padding()
        .background(Color.black)
    }
}

struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String
    let iconBackgroundColor: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(Theme.colors.textPrimary)
                .frame(width: 40, height: 40)
                .background(iconBackgroundColor)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Theme.colors.textPrimary)
                
                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(Theme.colors.textSecondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Theme.colors.textSecondary)
        }
        .padding()
        .background(Theme.colors.surface)
        .cornerRadius(12)
    }
}

#Preview {
    DiscoverView()
        .preferredColorScheme(.dark)
}
