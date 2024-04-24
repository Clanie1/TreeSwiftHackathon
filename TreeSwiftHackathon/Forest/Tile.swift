import SwiftUI
import Toast


struct TileView: View {
    @Binding var tileData: TileData
    @Binding var selectedItem: ItemType
    @Binding var coins: Int

    
    var gridSideLength: CGFloat
    
    
    
    var body: some View {
        Button(action: {
            if(selectedItem == .none) {
                return
            }
            
            var price: Int
            
            if(selectedItem == tileData.type) {
                if(tileData.level >= 3) {
                    UIApplication.shared.windows.first?.rootViewController?.view.makeToast("Ya llegaste al nivel máximo")
                    return
                }
                price = getPriceForUpgrade(itemType: selectedItem, currentLevel: tileData.level)
                if(coins < price) {
                    UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No tienes suficiente dinero para mejorar")
                    return
                }
                tileData.level += 1
            }
            else {
                price = getPriceForItem(itemType: selectedItem)
                if(coins < price) {
                    UIApplication.shared.windows.first?.rootViewController?.view.makeToast("No tienes suficiente dinero para comprar")
                    selectedItem = .none
                    return
                }
                tileData.type = selectedItem
            }
            coins -= price
        }) {
            switch tileData.type {
            case .grass:
                ZStack {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: gridSideLength, height: gridSideLength)
                    Text(String(tileData.level))
                }
            case .house:
                ZStack {
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: gridSideLength, height: gridSideLength)
                    Text(String(tileData.level))
                }
            case .tree:
                ZStack {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: gridSideLength, height: gridSideLength)
                    Text(String(tileData.level))

                }
            case .park:
                ZStack {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: gridSideLength, height: gridSideLength)
                    Text(String(tileData.level))
                }

            case .none:
                Rectangle()
                    .fill(Color.white)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .frame(width: gridSideLength, height: gridSideLength)
            }
        }
    }
}
