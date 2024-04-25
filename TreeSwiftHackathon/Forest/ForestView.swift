import SwiftUI

struct ForestView: View {
    
    @State var selectedItem: ItemType = .none
    @State var isBuilding: Bool = false
    
    @State var isFriendView: Bool = false
    @State var historicData: [BarData] = []
        
    @State var mes: String = ""
    @State var mesMessage: String = ""
    
    @State var mesPasadoValue: String = ""
    
    @State var offsetTotalValue: String = ""
    
    @Binding var coins: Int
    
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                VStack(spacing: 2) {
                    HStack {
                        Text("Mi Parque").bold().font(.title).foregroundColor(.white)
                        Spacer()
                        Button(action: {
                                print("Making API call...")
                            
                            
                            showingAlert = true
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                                Image( "recomendacion").resizable().scaledToFit().foregroundColor(.black).frame(width: 30, height: 30)
                                Circle().fill(Color.red).frame(width: 12, height:12)
                                
                                .foregroundColor(.black).offset(x: 18, y: 18)                 }
                            .font(.system(size: 20))
                        } .alert("Important message", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
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
                        } else {
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
                                        Text(mesPasado).foregroundColor(Color(hex: "#71C648")).font(.system(size: 16)).bold()
                                    }
                                    Rectangle().fill(Color(hex: "#8E8E93")).frame(width: 1, height: 40)
                                    VStack(spacing: 6) {
                                        Text("Offset Total").foregroundColor(Color(hex: "#8E8E93")).font(.system(size: 15))
                                        Text(offsetTotal).foregroundColor(Color(hex: "#71C648")).font(.system(size: 16)).bold()
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
                                    
                                    
                                    Text("Tu huella de KgCO2").foregroundColor(.white).fontWeight(.bold)
                                    
                                    
                                    
                                        BarGroup(historicData: historicData)
                                    
                                    
                                    VStack(alignment: .leading) {
                                        Text(mes).foregroundColor(.white).fontWeight(.bold).font(.headline)
                                        Text(mesMessagae).foregroundColor(Color(hex:"#71C648")).fontWeight(.bold).font(.subheadline)
                                        
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

//#Preview {
////    @State var historicData: [BarData] = []
//    return ForestView()
//}
