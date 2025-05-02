//
//  ProfileView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @State private var selectedCategory = "Stocks"
    @State private var showNotifications = false
    @State private var showRewards = false
    @State private var showSearch = false
    @State private var notifications: [Notification] = [
        Notification(title: "AAPL Price Alert", message: "Apple Inc. is up 2.5% today", time: "10m ago", type: .price),
        Notification(title: "Account Update", message: "Your deposit of $1,000 has been processed", time: "1h ago", type: .account),
        Notification(title: "Market News", message: "Fed announces interest rate decision", time: "2h ago", type: .news),
        Notification(title: "TSLA Price Alert", message: "Tesla is down 1.8% in pre-market trading", time: "5h ago", type: .price)
    ]
    
    private var unreadCount: Int {
        notifications.filter { !$0.isRead }.count
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Profile Header
                    ProfileHeaderView()
                    
                    // Promo Card
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "percent")
                                .foregroundColor(.blue)
                            Text("Get a 4.5% APY boost on your brokerage cash! Terms apply.")
                                .font(.system(size: 15))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .foregroundColor(.primary)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(12)
                    }
                    
                    // Investing Summary
                    InvestingSummaryView()
                    
                    // Investment Categories
                    InvestmentCategoriesView(selectedCategory: $selectedCategory)
                    
                    // Discover Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Discover more")
                            .font(.headline)
                        
                        VStack(spacing: 12) {
                            DiscoverCardView(
                                title: "4.5% APY with Gold",
                                subtitle: "Boost your rate on uninvested cash",
                                badge: "4.5%"
                            )
                            
                            DiscoverCardView(
                                title: "Retirement",
                                subtitle: "Earn up to 2% on IRA transfers till April 30"
                            )
                            
                            DiscoverCardView(
                                title: "Transfer accounts in",
                                subtitle: "Consolidate assets"
                            )
                        }
                        
                        Text("All investing involves risk... See more")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }.scrollIndicators(.hidden)
            .navigationTitle("")
            .sheet(isPresented: $showNotifications) {
                NotificationView(isPresented: $showNotifications, notifications: $notifications)
            }
            .sheet(isPresented: $showRewards) {
                RewardsView(isPresented: $showRewards)
            }
            .sheet(isPresented: $showSearch) {
                SearchView(isPresented: $showSearch)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        showNotifications = true
                    }) {
                        ZStack(alignment: .topTrailing) {
                            Image(systemName: "bell")
                                .foregroundColor(.primary)
                            if unreadCount > 0 {
                                Circle()
                                    .fill(Theme.colors.negative)
                                    .frame(width: 8, height: 8)
                                    .offset(x: 4, y: -4)
                            }
                        }
                    }
                    Button(action: {
                        showSearch = true
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack(spacing: 8) {
                Text("2 invites")
                    .font(.caption2)
                    .foregroundColor(.gray)
                Button("Earn rewards") {
                    showRewards = true
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .cornerRadius(25)
                .padding(.horizontal)
            }
            .padding(.top, 8)
            .background(.black)
            .shadow(color: .black.opacity(0.05), radius: 8, y: -4)
        }
    }
}

#Preview {
    TabBarView()
}

