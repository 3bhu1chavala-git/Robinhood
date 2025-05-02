//
//  StockListView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 02/05/25.
//

import Foundation
import SwiftUI

struct Stock: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let price: Double
    let change: Double
    let miniChart: [Double]
}

struct StockListView: View {
    let stocks: [Stock] = [
        Stock(symbol: "BAC", name: "Bank of America", price: 32.45, change: 0.65, miniChart: [32.1, 32.3, 32.4, 32.45]),
        Stock(symbol: "SYF", name: "Synchrony Finl", price: 28.90, change: 0.51, miniChart: [28.5, 28.7, 28.8, 28.9]),
        Stock(symbol: "LOGI", name: "ConvertLogic", price: 65.20, change: 0.28, miniChart: [64.9, 65.0, 65.1, 65.2]),
        Stock(symbol: "AAPL", name: "Apple Inc", price: 175.50, change: 0.32, miniChart: [175.1, 175.3, 175.4, 175.5]),
        Stock(symbol: "META", name: "Meta Platforms", price: 320.80, change: 0.01, miniChart: [320.7, 320.75, 320.78, 320.8]),
        Stock(symbol: "BIEP", name: "Brookfield Renew", price: 45.60, change: 0.04, miniChart: [45.5, 45.55, 45.58, 45.6]),
        Stock(symbol: "AAL", name: "American Airlines", price: 15.80, change: 0.00, miniChart: [15.8, 15.8, 15.8, 15.8]),
        Stock(symbol: "PYRD", name: "YCW Transform", price: 28.90, change: -0.07, miniChart: [29.0, 28.95, 28.92, 28.9])
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(stocks) { stock in
                    StockRowView(stock: stock)
                    Divider()
                        .background(Theme.colors.surface)
                }
            }
            .background(Color.black)
        }
    }
}

struct StockRowView: View {
    let stock: Stock
    
    var body: some View {
        HStack(spacing: 16) {
            // Symbol and Name
            VStack(alignment: .leading, spacing: 4) {
                Text(stock.symbol)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Theme.colors.textPrimary)
                Text(stock.name)
                    .font(.system(size: 12))
                    .foregroundColor(Theme.colors.textSecondary)
            }
            
            // Mini Chart
            MiniChartView(data: stock.miniChart, isPositive: stock.change >= 0)
                .frame(height: 30)
            
            Spacer()
            
            // Price and Change
            VStack(alignment: .trailing, spacing: 4) {
                Text("$\(String(format: "%.2f", stock.price))")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Theme.colors.textPrimary)
                
                Text(String(format: "%+.2f%%", stock.change))
                    .font(.system(size: 12))
                    .foregroundColor(stock.change >= 0 ? Theme.colors.positive : Theme.colors.negative)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.black)
    }
}

struct MiniChartView: View {
    let data: [Double]
    let isPositive: Bool
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let points = data.enumerated().map { (index, value) in
                    let x = Double(index) * (geometry.size.width / Double(data.count - 1))
                    let y = (value - data.min()!) / (data.max()! - data.min()!) * geometry.size.height
                    return CGPoint(x: x, y: geometry.size.height - y)
                }
                
                path.move(to: points[0])
                for point in points.dropFirst() {
                    path.addLine(to: point)
                }
            }
            .stroke(isPositive ? Theme.colors.positive : Theme.colors.negative, lineWidth: 1.5)
        }
    }
}

#Preview {
    StockListView()
        .preferredColorScheme(.dark)
}
