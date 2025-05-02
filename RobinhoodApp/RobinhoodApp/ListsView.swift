//
//  ListsView.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 01/05/25.
//

import SwiftUI

struct ListsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Lists")
                .font(.headline)
            
            Button(action: {}) {
                HStack {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                    Text("Create watchlist or screener")
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            
            Button(action: {}) {
                HStack {
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.white)
                    VStack(alignment: .leading) {
                        Text("My First List")
                            .foregroundColor(.white)
                        Text("21 items")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .foregroundColor(Theme.colors.textPrimary)
                .padding()
                .background(Theme.colors.surface)
                .cornerRadius(12)
            }
        }
    }
}

#Preview {
    ListsView()
        .padding()
}
