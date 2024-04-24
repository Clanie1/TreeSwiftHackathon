import SwiftUI

struct ForestView: View {
    
    @State var selectedItem: ItemType = .none
    @State var coins: Int = 10000
    @State var isBuilding: Bool = false
    
    @State var isFriendView: Bool = false
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                VStack(spacing: 2) {
                    HStack {
                        Text("Mi Parque").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                        Spacer()
                    }.padding()
                    
                    if !isFriendView {
                        CoinView(coins: $coins)
                    }
                }
                
                GridView(selectedItem: $selectedItem, coins: $coins).padding(.leading, 20).padding(.trailing, 20)
                
                if !isFriendView {
                    
                    
                    Group {
                        if isBuilding {
                            VStack {
                                Spacer()
                                BuildButtons(selectedItem: $selectedItem, buildMode: $isBuilding)
                                
                                
                            }.transition(.move(edge: .bottom)).padding(0)
                        }else {
                            Button("Construir") {
                                withAnimation() {
                                    self.isBuilding = true
                                }
                            }
                            .padding(.top, 7)
                            .padding(.leading, 60)
                            .padding(.bottom, 7)
                            .padding(.trailing, 60)
                            .background(Color(hex: "#F9C700"))
                            .foregroundColor(.black)
                            .cornerRadius(40.0)
                            
                            VStack {
                                HStack(spacing: 14) {
                                    VStack(spacing: 6) {
                                        Text("Mes Pasado").foregroundColor(Color(hex: "#8E8E93")).font(.system(size: 15))
                                        Text("34,1 CO2e").foregroundColor(Color(hex: "#71C648")).font(.system(size: 16)).bold()
                                    }
                                    Rectangle().fill(Color(hex: "#8E8E93")).frame(width: 1, height: 40)
                                    VStack(spacing: 6) {
                                        Text("Offset Total").foregroundColor(Color(hex: "#8E8E93")).font(.system(size: 15))
                                        Text("34,1 CO2e").foregroundColor(Color(hex: "#71C648")).font(.system(size: 16)).bold()
                                    }
                                }
                                .padding(.top, 10)
                                .padding(.leading, 65)
                                .padding(.bottom, 10)
                                .padding(.trailing, 65)
                                .foregroundColor(Color(hex: "#F9C700"))
                                .background(Color(hex: "#1C1C1E"))
                                .cornerRadius(12.0)
                                
                                
                                VStack(alignment:.leading, spacing: 14) {
                                    
                                    
                                    Text("Tu huella de CO2").foregroundColor(.white).fontWeight(.bold)
                                    
                                    
                                    HStack {
                                        StatsBar(value: 85, color: "#FF3B30", month: "Ene")
                                        StatsBar(value: 90, color: "#FF3B30", month: "Feb")
                                        StatsBar(value: 87, color: "#FF3B30", month: "Mar")
                                        StatsBar(value: 80, color: "#71C648", month: "Abr")
                                        StatsBar(value: 75, color: "#71C648", month: "May")
                                        StatsBar(value: 80, color: "#FF3B30", month: "Jun")
                                        StatsBar(value: 70, color: "#71C648", month: "Jul")
                                        StatsBar(value: 60, color: "#71C648", month: "Ago")
                                        StatsBar(value: 60, color: "#71C648", month: "Ago")
                                        StatsBar(value: 60, color: "#71C648", month: "Ago")
                                        
                                        
                                        
                                    }
                                    
                                    VStack(alignment: .leading) {
                                        Text("Marzo 2024").foregroundColor(.white).fontWeight(.bold).font(.headline)
                                        Text("1,5 CO2e debajo de tú promedio").foregroundColor(Color(hex:"#71C648")).fontWeight(.bold).font(.subheadline)
                                        
                                    }
                                    
                                    
                                }
                                
                                .padding()
                                .foregroundColor(Color(hex: "#F9C700"))
                                .background(Color(hex: "#1C1C1E"))
                                .cornerRadius(12.0)
                            }
                            
                            HStack(spacing: 14) {
                                NavigationLink(destination: ActividadView()){
                                    Text("Aprender Mas")
                                }
                            }
                            .padding(.top, 10)
                            .padding(.leading, 110)
                            .padding(.bottom, 10)
                            .padding(.trailing, 110)
                            .foregroundColor(Color(hex: "#F9C700"))
                            .background(Color(hex: "#1C1C1E"))
                            .cornerRadius(12.0)
                        }
                        Spacer()
                    }
                }
            }.background(Color(hex:"#87AFEC"))
        }
    }
}

#Preview {
    ForestView()
}


