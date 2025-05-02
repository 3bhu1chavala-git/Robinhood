//
//  MenuView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 02/05/25.
//

import Foundation
import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var authManager: AuthenticationManager
    
    
    private let menuItems: [(title: String, subtitle: String, destination: String)] = [
        ("Investing", "Balances, recurring investments, DRIP, Stock Lending", "Investing Details"),
        ("Crypto", "Transfer limits", "Crypto Limits"),
        ("Transfers", "Deposits, withdrawals, account transfers", "Transfers"),
        ("Rewards", "Invite friends, earn stocks, get rewards", "Rewards"),
        ("History", "Activity across all accounts", "Activity History"),
        ("Reports and statements", "Account activity reports, monthly statements", "Reports & Statements"),
        ("Tax center", "Tax documents, FAQs", "Tax Documents")
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                List {
                    Section(header: Text(" ").padding(.top, 24)) {
                        ForEach(menuItems, id: \.title) { item in
                            NavigationLink(destination: Text(item.destination)) {
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .fontWeight(.semibold)
                                    Text(item.subtitle)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
                
               
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(AuthenticationManager())
}
