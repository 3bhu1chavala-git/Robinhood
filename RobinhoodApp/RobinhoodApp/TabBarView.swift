import SwiftUI

struct TabBarView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PortfolioView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Portfolio")
                }
                .tag(0)
            
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
                .tag(1)
            
            StockListView()
                .tabItem {
                    Image(systemName: "arrow.up.arrow.down.circle.fill")
                    Text("Trade")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
            
            MenuView()
                .tabItem {
                    Image(systemName: "line.3.horizontal")
                    Text("Menu")
                }
                .tag(4)
        }
        .tint(Theme.colors.textPrimary)
    }
}

#Preview {
    TabBarView()
}
