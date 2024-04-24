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
    @Binding var buildMode: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Elementos").foregroundColor(.white)
                Spacer()
                Text("Precio").foregroundColor(.white)
            }
            Rectangle().fill(Color(hex: "#8E8E93")).frame(width: .infinity, height: 2)
            Button(action: {
                selectedItem = .grass

            }) {
                HStack {
                    HStack {
                        Rectangle().fill(.white).frame(width: 68, height: 68)
                        Text("Grass").foregroundColor(selectedItem == .grass ? .blue : .white)
                    }
                    Spacer()
                    HStack(spacing: 2) {
                        Image(systemName: "dollarsign.circle")
                        Text("200")
                    }.foregroundColor(selectedItem == .grass ? .blue : Color(hex: "#F9C700"))
                }
            }
            Button(action: {
                selectedItem = .tree

            }) {
                HStack {
                    HStack {
                        Rectangle().fill(.white).frame(width: 68, height: 68)
                        Text("Tree").foregroundColor(selectedItem == .tree ? .blue : .white)
                    }
                    Spacer()
                    HStack(spacing: 2) {
                        Image(systemName: "dollarsign.circle")
                        Text("500")
                    }.foregroundColor(selectedItem == .tree ? .blue : Color(hex: "#F9C700"))
                }
            }
            Button(action: {
                selectedItem = .house

            }) {
                HStack {
                    HStack {
                        Rectangle().fill(.white).frame(width: 68, height: 68)
                        Text("House").foregroundColor(selectedItem == .house ? .blue : .white)
                    }
                    Spacer()
                    HStack(spacing: 2) {
                        Image(systemName: "dollarsign.circle")
                        Text("1000")
                    }.foregroundColor(selectedItem == .house ? .blue : Color(hex: "#F9C700"))
                }
            }
            Button(action: {
                selectedItem = .park

            }) {
                HStack {
                    HStack {
                        
                        Rectangle().fill(.white).frame(width: 68, height: 68)
                        Text("Park").foregroundColor(selectedItem == .park ? .blue : .white)
                    }
                    Spacer()
                    HStack(spacing: 2) {
                        Image(systemName: "dollarsign.circle")
                        Text("2000")
                    }.foregroundColor(selectedItem == .park ? .blue : Color(hex: "#F9C700"))
                }
            }
            Button(action: {
                buildMode = false
            }) {
                Text("Salir").foregroundColor(.white)
            }


        }.padding().background(Color(hex: "#1C1C1E")).clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 5.0, bottomLeading: 0.0, bottomTrailing: 0.0, topTrailing: 5.0), style: .continuous))
    }
}

#Preview {
    @State var exampleItemSelected: ItemType = .grass
    @State var buildMode: Bool = true

    return BuildButtons(selectedItem: $exampleItemSelected, buildMode: $buildMode)
}

