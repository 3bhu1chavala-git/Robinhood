import SwiftUI

struct PortfolioView: View {
    @State private var selectedTab = "ALL"
    private let tabs = ["1D", "1W", "1M", "3M", "YTD", "1Y", "ALL"]
    
    struct Asset: Identifiable {
        let id = UUID()
        let name: String
        let symbol: String
        let value: String
        let change: String
        let isPositive: Bool
    }
    
    let assets: [Asset] = [
        .init(name: "Apple", symbol: "AAPL", value: "$186.12", change: "+1.23%", isPositive: true),
        .init(name: "Bitcoin", symbol: "BTC", value: "$28,540.00", change: "-0.54%", isPositive: false),
        .init(name: "S&P 500 ETF", symbol: "SPY", value: "$456.88", change: "+0.75%", isPositive: true)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    PortfolioHeaderView()
                    
                    TimeRangeTabsView(selectedTab: $selectedTab)
                    
                    // Buying Power Card
                    Button(action: {
                        // Navigate to funding screen
                    }) {
                        HStack {
                            Text("Buying Power")
                                .font(.system(size: 17, weight: .regular))
                            Spacer()
                            Text("$97.81")
                                .font(.system(size: 17, weight: .regular))
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Theme.colors.textSecondary)
                        }
                        .foregroundColor(Theme.colors.textPrimary)
                        .padding()
                        .background(Theme.colors.surface)
                        .cornerRadius(12)
                    }
                    
                    // Upload Document Card
                    VStack(alignment: .leading, spacing: 8) {
                        Text("📄 Upload Your Document")
                            .font(.headline)
                        
                        Text("Take a photo of your bank statement now to continue using Robinhood.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Button("Take Photo Now") {
                            // Handle photo upload
                        }
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .padding(.top, 4)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    
                    CashSectionView()
                    
                    PredictionMarketsView()
                    
                    DiscoverView()
                    
                    ListsView()
                    
                    // Holdings
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Holdings")
                            .font(.headline)
                            .padding(.top, 8)
                        
                        ForEach(assets) { asset in
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(asset.name)
                                        .font(.system(size: 17, weight: .semibold))
                                    Text(asset.symbol)
                                        .font(.subheadline)
                                        .foregroundColor(Theme.colors.textSecondary)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 4) {
                                    Text(asset.value)
                                        .font(.system(size: 17, weight: .semibold))
                                    Text(asset.change)
                                        .font(.subheadline)
                                        .foregroundColor(asset.isPositive ? .green : .red)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    TabBarView()
}

