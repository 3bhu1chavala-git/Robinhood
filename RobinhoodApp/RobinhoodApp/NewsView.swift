//
//  NewsView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import Foundation
import SwiftUI
import SafariServices

struct NewsView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var selectedArticleURL: URL?
    @State private var showingSafariView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.articles) { article in
                    NewsRow(article: article)
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .onTapGesture {
                            selectedArticleURL = article.articleUrl
                            showingSafariView = true
                        }
                }
            }
            .listStyle(PlainListStyle())
            .refreshable {
                await viewModel.loadNews()
            }
            .navigationTitle("News")
            .overlay(Group {
                if viewModel.articles.isEmpty {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        Text("No news available")
                            .foregroundColor(.gray)
                    }
                }
            })
            .sheet(isPresented: $showingSafariView) {
                if let url = selectedArticleURL {
                    SafariView(url: url)
                }
            }
        }
        .task {
            await viewModel.loadNews()
        }
    }
}

struct CategoryButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.medium)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(isSelected ? Color.accentColor : Color.gray.opacity(0.1))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}

struct NewsRow: View {
    let article: NewsArticle
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let imageUrl = article.imageUrl {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 60, height: 60)
                .cornerRadius(8)
                .clipped()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.headline)
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundColor(.primary)
                
                HStack {
                    Text(article.source)
                        .foregroundColor(.gray)
                    Text("•")
                        .foregroundColor(.gray)
                    Text(article.timeAgo)
                        .foregroundColor(.gray)
                }
                .font(.caption)
            }
            Spacer()
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

