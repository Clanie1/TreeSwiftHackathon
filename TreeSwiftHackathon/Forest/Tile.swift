import SwiftUI
import Toast


struct TileView: View {
    @Binding var tileData: TileData
    @Binding var selectedItem: ItemType
    @Binding var coins: Int

    
    var gridSideLength: CGFloat
    
    @Binding var userId: Int
    @Binding var gridData: [[TileData]]
                            
    
    func updateBackendItem() {
        Task {
            if let url = URL(string: "https://mbvodwyplawoqehzwfld.supabase.co/rest/v1/grid?user_id=eq.\(userId)") {
                var request = URLRequest(url: url)
                    request.httpMethod = "PATCH"
                    request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1idm9kd3lwbGF3b3FlaHp3ZmxkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM5NjE1NzcsImV4cCI6MjAyOTUzNzU3N30.I6x41mVeRuz3eTLqRIUv5Q-8cGNQ83TGm_3xNVVnf0M", forHTTPHeaderField: "apiKey")
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data {
                        do {
                            let jsonData = try? JSONEncoder().encode(["grid": gridData])
                            request.httpBody = jsonData
                            let task = URLSession.shared.dataTask(with: request)
                            
                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
                }.resume()
            }
           }
    }
    
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
            updateBackendItem()
        }) {
            switch tileData.type {
            case .grass:
                ZStack {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: .infinity, height: gridSideLength)
                    Text(String(tileData.level))
                }
            case .house:
                ZStack {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: .infinity, height: gridSideLength)
                    Text(String(tileData.level))
                }
            case .tree:
                ZStack {
                    Rectangle()
                        .fill(Color.orange)
                        .frame(width: .infinity, height: gridSideLength)
                    Text(String(tileData.level))

                }
            case .park:
                ZStack {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: .infinity, height: gridSideLength)
                    Text(String(tileData.level))
                }

            case .none:
                ZStack {

                    Rectangle()
                        .fill(Color.white)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .frame(width: .infinity, height: gridSideLength)
                
                }
            }
        }
    }
}
