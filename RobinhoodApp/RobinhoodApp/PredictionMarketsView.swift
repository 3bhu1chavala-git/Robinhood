//
//  PredictionMarketsView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import SwiftUI

struct PredictionMarketsView: View {
    let items = ["Fed decision in May", "Inflation in April"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Prediction markets")
                .font(.headline)
            
            ForEach(items, id: \.self) { item in
                Button(action: {}) {
                    HStack {
                        Image(systemName: "chart.bar.fill")
                            .foregroundColor(.white)
                        Text(item)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    PredictionMarketsView()
        .padding()
}
