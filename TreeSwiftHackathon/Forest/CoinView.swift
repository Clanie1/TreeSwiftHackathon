import SwiftUI

struct CoinView: View {
    
    @Binding var coins: Int
    
    var body: some View {
        HStack(alignment: .top) {
            Text(String(coins))
            
        }
        .padding(.top, 4)
        .padding(.leading, 15)
        .padding(.bottom, 4)
        .padding(.trailing, 15)
        .foregroundColor(Color(hex: "#F9C700"))
        .background(Color(hex: "#1C1C1E"))
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5), style: .continuous))
        .cornerRadius(5)
        .presentationCornerRadius(3)
        .alignmentGuide(.leading) { _ in 0 } 

    }
}
