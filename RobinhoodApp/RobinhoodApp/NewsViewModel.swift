//
//  NewsViewModel.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import Foundation
import SwiftUI

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []
    @Published var selectedCategory: NewsCategory = .top
    @Published var isLoading = false
    
    // Sample data for demonstration
    func loadNews() async {
        isLoading = true
        // Simulating network delay
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        articles = [
            NewsArticle(
                headline: "Apple's Stock Hits All-Time High on AI Announcement",
                source: "Bloomberg",
                timestamp: Date().addingTimeInterval(-7200),
                imageUrl: URL(string: "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=200"),
                articleUrl: URL(string: "https://bloomberg.com/article1")!,
                category: .tech
            ),
            NewsArticle(
                headline: "Bitcoin Surges Past $50,000",
                source: "CoinDesk",
                timestamp: Date().addingTimeInterval(-3600),
                imageUrl: URL(string: "https://images.unsplash.com/photo-1518546305927-5a555bb7020d?w=200"),
                articleUrl: URL(string: "https://coindesk.com/article1")!,
                category: .crypto
            ),
            NewsArticle(
                headline: "S&P 500 Reaches New Record",
                source: "Reuters",
                timestamp: Date().addingTimeInterval(-1800),
                imageUrl: URL(string: "https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?w=200"),
                articleUrl: URL(string: "https://reuters.com/article1")!,
                category: .stocks
            )
        ]
        
        isLoading = false
    }
    
    func filterArticles(by category: NewsCategory) {
        selectedCategory = category
        // In a real app, this would fetch new articles based on the category
    }
}

