import SwiftUI

struct GridData: Decodable {
    let id: Int
    let createdAt: String
    let grid: [[TileData]]
    let userId: Int
    
    enum CodingKeys: String, CodingKey {
            case id
            case createdAt = "created_at"
            case grid
            case userId = "user_id"
        }
    
    
}


struct TileData: Encodable, Decodable {
    var type: ItemType
    var level: Int
}

struct GridView: View {
    
    @State private var gridData: [[TileData]] = Array(repeating: Array(repeating: TileData( type: .none, level: 1), count: 5), count: 5)

    
    @State var userId: Int = 1
    
    @Binding var selectedItem: ItemType
    @Binding var coins: Int
    
    let gridSideLength = 30.0
    
    func onAppear() {
      fetchData()
    }
    
    func fetchData() {
        
        
    }
    
    var body: some View {
        VStack {
            if gridData.count > 0 {
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 0), count: 5), spacing: 0) {
                    ForEach(0..<25, id: \.self) { index in
                        TileView(tileData: $gridData[index/5][index%5], selectedItem: $selectedItem, coins: $coins, gridSideLength:  gridSideLength)
                    }
                }.rotation3DEffect(
                    .degrees(45),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
            }
        }.onAppear {
            Task {
                if let url = URL(string: "https://mbvodwyplawoqehzwfld.supabase.co/rest/v1/grid?user_id=eq.\(userId)&select=%2A") {
                    var request = URLRequest(url: url)
                        request.httpMethod = "GET"
                        request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1idm9kd3lwbGF3b3FlaHp3ZmxkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM5NjE1NzcsImV4cCI6MjAyOTUzNzU3N30.I6x41mVeRuz3eTLqRIUv5Q-8cGNQ83TGm_3xNVVnf0M", forHTTPHeaderField: "apiKey")
                        
                    URLSession.shared.dataTask(with: request) { data, response, error in
                        if let data = data {
                            do {
                                let gridDataLocal = try JSONDecoder().decode([GridData].self, from: data)
                                gridData = gridDataLocal[0].grid
                                
                                
                            } catch {
                                print("Error decoding JSON: \(error)")
                            }
                        }
                    }.resume()
                }

               }
        }
    }
}

#Preview {
    @State var selectedItem: ItemType = .none
    @State var coins: Int = 10000
    @State var isBuilding: Bool = false

    return GridView(selectedItem: $selectedItem, coins: $coins)
}
