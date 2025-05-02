//
//  CashSectionView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import SwiftUI

struct CashSectionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Cash")
                .font(.headline)
            
            HStack {
                Text("Cash balance")
                Spacer()
                Text("$97.81")
            }
            
            HStack {
                Text("Current interest rate")
                Spacer()
                Text("0% APY")
            }
            
            Button(action: {}) {
                Text("Earn 4.5% APY")
                    .foregroundColor(.green)
                    .font(.footnote)
            }
        }
        .foregroundColor(Theme.colors.textPrimary)
        .padding()
        .background(Theme.colors.surface)
        .cornerRadius(12)
    }
}

#Preview {
    CashSectionView()
        .padding()
}
