import SwiftUI

struct TileData {
    var level: Int
    var type: ItemType
}


struct GridView: View {
    
    @State private var grid: [[TileData]] = Array(repeating: Array(repeating: TileData(level: 1, type: .none), count: 5), count: 5)
    @Binding var selectedItem: ItemType
    @Binding var coins: Int
    
    let gridSideLength = 30.0
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 0), count: 5), spacing: 0) {
                ForEach(0..<25, id: \.self) { index in
                    TileView(tileData: $grid[index/5][index%5], selectedItem: $selectedItem, coins: $coins, gridSideLength:  gridSideLength)
                }
            }.rotation3DEffect(
                .degrees(45),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
        }
    }
}

#Preview {
    @State var selectedItem: ItemType = .none
    @State var coins: Int = 10000
    @State var isBuilding: Bool = false

    return GridView(selectedItem: $selectedItem, coins: $coins)
}
