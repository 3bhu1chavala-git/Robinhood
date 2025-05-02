//
//  NewsArticle.swift
//  Robinhood App
//
//  Created by 3bhu1chavala on 01/05/25.
//

import Foundation

struct NewsArticle: Identifiable {
    let id = UUID()
    let headline: String
    let source: String
    let timestamp: Date
    let imageUrl: URL?
    let articleUrl: URL
    let category: NewsCategory
    
    var timeAgo: String {
        // Simple time ago calculation
        let interval = Date().timeIntervalSince(timestamp)
        if interval < 3600 {
            let minutes = Int(interval / 60)
            return "\(minutes)m ago"
        } else if interval < 86400 {
            let hours = Int(interval / 3600)
            return "\(hours)h ago"
        } else {
            let days = Int(interval / 86400)
            return "\(days)d ago"
        }
    }
}

enum NewsCategory: String, CaseIterable {
    case top = "Top"
    case crypto = "Crypto"
    case tech = "Tech"
    case stocks = "Stocks"
    case etfs = "ETFs"
}


