import SwiftUI

struct ForestView: View {
    
    @State var selectedItem: ItemType = .none
    @State var coins: Int = 10000
    @State var isBuilding: Bool = false

    @State var isFriendView: Bool = false
    
    var body: some View {

        VStack {
            
            HStack {
                Text("Mi Parque").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                Spacer()
            }.padding()

            if !isFriendView {
                CoinView(coins: $coins)
            }
        
            GridView(selectedItem: $selectedItem, coins: $coins).padding(.leading, 20).padding(.trailing, 20)
            
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
                        
                        HStack(spacing: 14) {
                            VStack {
                                Text("Mes Pasado").foregroundColor(Color(hex: "#8E8E93")).font(.system(size: 14))
                                Text("34,1 CO2e").foregroundColor(Color(hex: "#71C648")).font(.system(size: 14)).bold()
                            }
                            VStack {
                                Text("Offset Total").foregroundColor(Color(hex: "#8E8E93")).font(.system(size: 14))
                                Text("34,1 CO2e").foregroundColor(Color(hex: "#71C648")).font(.system(size: 14)).bold()
                            }
                        }
                        .padding(.top, 4)
                        .padding(.leading, 15)
                        .padding(.bottom, 4)
                        .padding(.trailing, 15)
                        .foregroundColor(Color(hex: "#F9C700"))
                        .background(Color(hex: "#1C1C1E"))
                        .cornerRadius(5.0)
                                    
                        Spacer()
                        
                        Button("Construir") {
                            self.isBuilding = true
                        }
                        .padding(.top, 7)
                        .padding(.leading, 14)
                        .padding(.bottom, 7)
                        .padding(.trailing, 14)
                        .background(Color(hex: "#F9C700"))
                        .foregroundColor(.black)
                        .cornerRadius(40.0)
                        
                        Button("Agregar Recibo") {
                            self.isBuilding = true
                        }
                        .padding(.top, 7)
                        .padding(.leading, 14)
                        .padding(.bottom, 7)
                        .padding(.trailing, 14)
                        .background(Color(hex: "#F9C700"))
                        .foregroundColor(.black)
                        .cornerRadius(40.0)
                    }
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ForestView()
}


