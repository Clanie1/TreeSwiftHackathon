import SwiftUI

struct CoinView: View {
    
    @Binding var coins: Int
    
    var body: some View {
        HStack() {
            HStack(spacing: 2) {
                Image(systemName: "dollarsign.circle")
                Text(String(coins)).bold()
            }
            .padding(.top, 4)
            .padding(.leading, 15)
            .padding(.bottom, 4)
            .padding(.trailing, 15)
            .foregroundColor(Color(hex: "#F9C700"))
            .background(Color(hex: "#1C1C1E"))
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0,
                                                                 bottomLeading: 0.0,
                                                                 bottomTrailing: 5.0,
                                                                 topTrailing: 5.0), style: .continuous))
            .presentationCornerRadius(3)
            Spacer()
        }
    }
}
