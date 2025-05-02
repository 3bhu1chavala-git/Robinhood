import SwiftUI

struct SearchItem: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let price: Double
    let change: Double
    let type: SearchItemType
}

enum SearchItemType: String {
    case stock = "Stock"
    case crypto = "Crypto"
    case etf = "ETF"
}

struct SearchView: View {
    @Binding var isPresented: Bool
    @State private var searchText = ""
    @State private var selectedCategory = "Stocks"
    @State private var showTrendingStocks = true
    @Namespace private var namespace
    @State private var isSearching = false
    
    let categories = ["Stocks", "ETFs", "Crypto"]
    
    private let searchBarHeight: CGFloat = 44
    private let cornerRadius: CGFloat = 12
    
    // Demo data
    let searchResults: [SearchItem] = [
        // Stocks
        SearchItem(symbol: "AAPL", name: "Apple Inc.", price: 175.50, change: 2.5, type: .stock),
        SearchItem(symbol: "MSFT", name: "Microsoft Corporation", price: 320.75, change: -1.2, type: .stock),
        SearchItem(symbol: "GOOGL", name: "Alphabet Inc.", price: 2750.00, change: 1.8, type: .stock),
        SearchItem(symbol: "TSLA", name: "Tesla, Inc.", price: 850.25, change: 3.5, type: .stock),
        
        // ETFs
        SearchItem(symbol: "VOO", name: "Vanguard S&P 500 ETF", price: 380.45, change: 1.1, type: .etf),
        SearchItem(symbol: "QQQ", name: "Invesco QQQ Trust", price: 320.80, change: 1.5, type: .etf),
        SearchItem(symbol: "VTI", name: "Vanguard Total Stock Market ETF", price: 205.60, change: 0.8, type: .etf),
        
        // Crypto
        SearchItem(symbol: "BTC", name: "Bitcoin USD", price: 45000.00, change: 5.2, type: .crypto),
        SearchItem(symbol: "ETH", name: "Ethereum USD", price: 3200.00, change: 4.1, type: .crypto),
        SearchItem(symbol: "DOGE", name: "Dogecoin USD", price: 0.15, change: -2.3, type: .crypto)
    ]
    
    var trendingStocks: [SearchItem] {
        let categoryFiltered = searchResults.filter { item in
            switch selectedCategory {
            case "Stocks":
                return item.type == .stock
            case "ETFs":
                return item.type == .etf
            case "Crypto":
                return item.type == .crypto
            default:
                return true
            }
        }
        return Array(categoryFiltered.prefix(3))
    }
    
    var filteredResults: [SearchItem] {
        let categoryFiltered = searchResults.filter { item in
            switch selectedCategory {
            case "Stocks":
                return item.type == .stock
            case "ETFs":
                return item.type == .etf
            case "Crypto":
                return item.type == .crypto
            default:
                return true
            }
        }
        
        if searchText.isEmpty {
            return categoryFiltered
        }
        
        return categoryFiltered.filter {
            $0.symbol.lowercased().contains(searchText.lowercased()) ||
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search bar with icon
                ZStack {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color(white: 0.15))
                        .frame(height: searchBarHeight)
                    
                    HStack(spacing: 12) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(isSearching || !searchText.isEmpty ? Theme.colors.accent : Color(white: 0.5))
                            .font(.system(size: 18))
                        
                        CustomTextField("Search stocks, ETFs, crypto", text: $searchText)
                            .textFieldStyle(PlainTextFieldStyle())
                            .font(.system(size: 17))
                            .onTapGesture { isSearching = true }
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color(white: 0.5))
                                    .font(.system(size: 16))
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.horizontal)
                .padding(.top, 8)
                .animation(.easeInOut(duration: 0.2), value: searchText)
                
                if searchText.isEmpty {
                    // Category selector
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 24) {
                            ForEach(categories, id: \.self) { category in
                                Button(action: {
                                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                        selectedCategory = category
                                    }
                                }) {
                                    VStack(spacing: 8) {
                                        Text(category)
                                            .font(.system(size: 16, weight: selectedCategory == category ? .semibold : .regular))
                                            .foregroundColor(selectedCategory == category ? .white : Color(white: 0.6))
                                        
                                        // Indicator line
                                        Rectangle()
                                            .fill(selectedCategory == category ? Theme.colors.accent : Color.clear)
                                            .frame(height: 2)
                                            .matchedGeometryEffect(id: "categoryIndicator", in: namespace)
                                    }
                                    .frame(height: 40)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 4)
                }
                
                Divider()
                    .background(Theme.colors.surface)
                
                // Content
                ScrollView {
                    VStack(spacing: 24) {
                        if searchText.isEmpty {
                            // Trending section
                            VStack(alignment: .leading, spacing: 16) {
                                HStack {
                                    Image(systemName: "chart.line.uptrend.xyaxis")
                                        .foregroundColor(Theme.colors.accent)
                                    Text("Trending")
                                        .font(.headline)
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                                ForEach(trendingStocks) { item in
                                    Button(action: {
                                        // Handle stock selection
                                    }) {
                                        SearchResultRow(item: item)
                                    }
                                    if item.id != trendingStocks.last?.id {
                                        Divider()
                                            .background(Theme.colors.surface)
                                    }
                                }
                            }
                            .padding(.vertical)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                            .padding(.horizontal)
                            
                            // Popular lists
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Popular Lists")
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        ForEach(["100 Most Popular", "Technology", "Crypto", "ETFs"], id: \.self) { list in
                                            Button(action: {}) {
                                                VStack(alignment: .leading, spacing: 8) {
                                                    Text(list)
                                                        .font(.system(size: 15, weight: .semibold))
                                                        .foregroundColor(Theme.colors.textPrimary)
                                                    Text("12 items")
                                                        .font(.caption)
                                                        .foregroundColor(Theme.colors.textSecondary)
                                                }
                                                .frame(width: 140)
                                                .padding(12)
                                                .background(Color(white: 0.12))
                                                .cornerRadius(cornerRadius)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: cornerRadius)
                                                        .stroke(Color(white: 0.2), lineWidth: 1)
                                                )
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .padding(.top)
                        } else {
                            // Search results
                            LazyVStack(spacing: 0) {
                                ForEach(filteredResults) { item in
                                    Button(action: {
                                        // Handle stock selection
                                    }) {
                                        SearchResultRow(item: item)
                                    }
                                    Divider()
                                        .background(Theme.colors.surface)
                                }
                            }
                            .padding(.top)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                }
                .foregroundColor(.white)
                .font(.system(size: 18))
            )
            .preferredColorScheme(.dark)
        }
        .preferredColorScheme(.dark)
    }
}

struct SearchResultRow: View {
    let item: SearchItem
    
    var body: some View {
        HStack(spacing: 16) {
            // Symbol and type indicator
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 8) {
                    Text(item.symbol)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                    
                    // Type indicator
                    Text(item.type.rawValue)
                        .font(.system(size: 12))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color(white: 0.2))
                        .cornerRadius(4)
                        .foregroundColor(Color(white: 0.7))
                }
                
                Text(item.name)
                    .font(.system(size: 15))
                    .foregroundColor(Color(white: 0.7))
            }
            
            Spacer()
            
            // Price and change
            VStack(alignment: .trailing, spacing: 6) {
                Text("$\(String(format: "%.2f", item.price))")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(String(format: "%+.1f%%", item.change))
                    .font(.system(size: 15))
                    .foregroundColor(item.change >= 0 ? Theme.colors.positive : Theme.colors.negative)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.black)
                .opacity(0.01)
        )
        .contentShape(Rectangle())
    }
}

#Preview {
    SearchView(isPresented: .constant(true))
}

