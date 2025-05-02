
import SwiftUI

struct InvestingSummaryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Individual investing")
                .font(.headline)
            
            Group {
                SummaryRow(label: "Total individual value", value: "$97.81")
                SummaryRow(label: "Individual holdings", value: "$0.00")
                SummaryRow(label: "Individual cash", value: "$97.81")
                SummaryRow(label: "Crypto holdings", value: "$0.00")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

struct SummaryRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
        .font(.system(size: 15))
    }
}

#Preview {
    InvestingSummaryView()
        .padding()
}
