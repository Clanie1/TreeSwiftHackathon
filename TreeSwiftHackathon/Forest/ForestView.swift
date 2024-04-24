import SwiftUI

struct ForestView: View {
    
    @State var selectedItem: ItemType = .none
    @State var coins: Int = 10000
    @State var isBuilding: Bool = false

    @State var isFriendView: Bool = false
    
    var body: some View {
        VStack {
            if !isFriendView {
                CoinView(coins: $coins)
            }
        
            GridView(selectedItem: $selectedItem, coins: $coins).padding(20)
            
            if !isFriendView {
                Group {
                    if isBuilding {
                        VStack {
                            BuildButtons(selectedItem: $selectedItem)
                            Button("Exit") {
                                self.isBuilding = false
                                self.selectedItem = .none
                            }
                        }
                    } else {
                        Button("BUILD") {
                            self.isBuilding = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ForestView(selectedItem: .none, coins: 10000, isBuilding: false, isFriendView: false)
}
