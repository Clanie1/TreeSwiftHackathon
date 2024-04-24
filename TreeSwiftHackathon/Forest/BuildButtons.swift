import SwiftUI

enum ItemType {
    case none
    case grass
    case park
    case house
    case tree
}

func getPriceForItem(itemType: ItemType) -> Int {
    switch(itemType) {
    case .grass: return 200;
    case .house: return 1000;
    case .park: return 2000;
    case .tree: return 500;
    default: return 0;
    }
}

func getPriceForUpgrade(itemType: ItemType, currentLevel: Int) -> Int {
    return getPriceForItem(itemType: itemType) * (currentLevel + 1)
}



struct BuildButtons: View {
    
    @Binding var selectedItem: ItemType
    
    var body: some View {
        HStack {
            Button("Grass") {
                selectedItem = .grass
            }
            Button("Park") {
                selectedItem = .park
            }
            Button("House") {
                selectedItem = .house
            }
            Button("Tree") {
                selectedItem = .tree
            }
        }
    }
}

