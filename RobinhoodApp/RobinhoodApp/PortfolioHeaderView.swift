//
//  PortfolioHeaderView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import Foundation
import SwiftUI

struct PortfolioHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Investing")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("$97.81")
                .font(.system(size: 36, weight: .bold))
            
            Text("+$215.21 All time")
                .foregroundColor(.green)
                .font(.subheadline)
        }
        .padding(.top, 8)
    }
}

#Preview {
    PortfolioHeaderView()
        .padding()
}
