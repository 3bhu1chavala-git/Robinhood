//
//  NotificationView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 02/05/25.
//

import Foundation
import SwiftUI

struct Notification: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let time: String
    let type: NotificationType
    var isRead: Bool = false
}

enum NotificationType {
    case price
    case news
    case account
}

struct NotificationView: View {
    @Binding var isPresented: Bool
    @Binding var notifications: [Notification]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notifications) { notification in
                    NotificationRow(notification: notification)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Notifications")
            .navigationBarItems(
                leading: Button("Close") {
                    isPresented = false
                },
                trailing: Button("Mark all read") {
                    markAllAsRead()
                }
            )
        }
        .preferredColorScheme(.dark)
    }
    
    private func markAllAsRead() {
        for index in notifications.indices {
            notifications[index].isRead = true
        }
    }
}

struct NotificationRow: View {
    let notification: Notification
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                notificationIcon
                    .foregroundColor(iconColor)
                Text(notification.title)
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Text(notification.time)
                    .font(.caption2)
                    .foregroundColor(Theme.colors.textSecondary)
            }
            
            Text(notification.message)
                .font(.system(size: 14))
                .foregroundColor(Theme.colors.textSecondary)
        }
        .padding(.vertical, 8)
        .opacity(notification.isRead ? 0.6 : 1.0)
    }
    
    private var notificationIcon: some View {
        switch notification.type {
        case .price:
            return Image(systemName: "chart.line.uptrend.xyaxis")
        case .news:
            return Image(systemName: "newspaper")
        case .account:
            return Image(systemName: "person.circle")
        }
    }
    
    private var iconColor: Color {
        switch notification.type {
        case .price:
            return Theme.colors.positive
        case .news:
            return Theme.colors.accent
        case .account:
            return .orange
        }
    }
}
