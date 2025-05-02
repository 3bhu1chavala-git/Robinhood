//
//  TimeRangeTabsView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import SwiftUI

struct TimeRangeTabsView: View {
    @Binding var selectedTab: String
    let tabs = ["1D", "1W", "1M", "3M", "YTD", "1Y", "ALL"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tabs, id: \.self) { tab in
                    Button(action: {
                        withAnimation { selectedTab = tab }
                    }) {
                        Text(tab)
                            .font(.system(size: 15, weight: selectedTab == tab ? .semibold : .regular))
                            .foregroundColor(selectedTab == tab ? .black : .gray)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 14)
                            .background(selectedTab == tab ? Color.green.opacity(0.9) : Color.clear)
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

#Preview {
    TimeRangeTabsView(selectedTab: .constant("ALL"))
}
