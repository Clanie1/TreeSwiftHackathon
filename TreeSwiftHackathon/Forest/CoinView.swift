import SwiftUI

struct CoinView: View {
    
    @Binding var coins: Int
    
    var body: some View {
        HStack {
            Text("Coins: " + String(coins))
        }
    }
}
