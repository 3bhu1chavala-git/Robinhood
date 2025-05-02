//
//  DiscoverCardView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import SwiftUI

struct DiscoverCardView: View {
    let title: String
    let subtitle: String
    var badge: String? = nil
    
    var body: some View {
        Button(action: {}) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                if let badge = badge {
                    Text(badge)
                        .font(.headline)
                        .foregroundColor(.yellow)
                }
            }
            .foregroundColor(.primary)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

#Preview {
    VStack {
        DiscoverCardView(
            title: "4.5% APY with Gold",
            subtitle: "Boost your rate on uninvested cash",
            badge: "4.5%"
        )
        DiscoverCardView(
            title: "Retirement",
            subtitle: "Earn up to 2% on IRA transfers till April 30"
        )
    }
    .padding()
}
