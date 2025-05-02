

import SwiftUI

struct InvestmentCategoriesView: View {
    @Binding var selectedCategory: String
    let categories = ["Stocks", "ETFs", "Options", "Crypto"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            HStack(spacing: 24) {
                ForEach(categories, id: \.self) { category in
                    CategoryCircle(
                        category: category,
                        isSelected: category == selectedCategory
                    )
                }
            }
            .padding(.vertical, 8)
            
            Text("Stocks are pieces of a company that investors can own.")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Button("Learn More") {
                // Navigate to learn more
            }
            .font(.footnote)
            .foregroundColor(.blue)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(["Business", "Consumer Goods", "Energy & Water", "Finance", "Tech"], id: \.self) { tag in
                        Text(tag)
                            .font(.system(size: 14))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(16)
                    }
                }
            }
        }
    }
}

struct CategoryCircle: View {
    let category: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(isSelected ? Color.blue : Color.gray, lineWidth: isSelected ? 2 : 1)
                .frame(width: 60, height: 60)
            Text("0%\n\(category)")
                .multilineTextAlignment(.center)
                .font(.caption)
        }
    }
}

#Preview {
    InvestmentCategoriesView(selectedCategory: .constant("Stocks"))
        .padding()
}
