import SwiftUI

struct TileData {
    var level: Int
    var type: ItemType
}


struct GridView: View {
    
    @State private var grid: [[TileData]] = Array(repeating: Array(repeating: TileData(level: 1, type: .none), count: 10), count: 10)
    @Binding var selectedItem: ItemType
    @Binding var coins: Int
    
    var body: some View {
        GeometryReader { geometry in
            let gridSideLength = min(geometry.size.width, geometry.size.height) / 10
            let spacing = (geometry.size.width - (gridSideLength * 10)) / 2
            LazyVGrid(columns: Array(repeating: GridItem(), count: 10), spacing: spacing) {
                ForEach(0..<100, id: \.self) { index in
                    TileView(tileData: $grid[index/10][index%10], selectedItem: $selectedItem, coins: $coins, gridSideLength: gridSideLength)
                }
            }
        }
    }
}

