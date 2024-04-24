import SwiftUI


func notify(title: String, subtitle: String) {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            print("All set")
        }
        else {
            print(error?.localizedDescription)
        }
    }
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.subtitle = subtitle
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)
}

struct BarData: Hashable {
    let value: CGFloat
    let color: String
}

struct Navigation: View {
    
    @State private var selectedTabindex = 0
    @State var historicData: [BarData] = [
        BarData(value: 85, color: "#FF3B30"),
        BarData(value: 90, color: "#FF3B30"),
        BarData(value: 87, color: "#FF3B30"),
        BarData(value: 80, color: "#71C648"),
        BarData(value: 75, color: "#71C648"),
        BarData(value: 80, color: "#FF3B30"),
        BarData(value: 70, color: "#71C648"),
        BarData(value: 60, color: "#71C648"),
        BarData(value: 60, color: "#71C648")
    ]
    @State var mes: String = "Marzo 2024"
    @State var mesMessagae: String = "1,5 CO2e debajo de tú promedio"
    
    @State var mesPasado: String = "87,1 CO2e"
    @State var offsetTotal: String = "20,3 CO2e"

    var body: some View {
        TabView {
            FriendsView().tabItem {Label("Social", systemImage: "person")}
            ForestView(historicData: historicData, mes: mes, mesMessage: mesMessagae, mesPasadoValue: mesPasado, offsetTotalValue: offsetTotal).tabItem{Label("Mi Parque", systemImage: "house")}.background(Color(hex: "#87AFEC"))
            RegistroConsumoView().tabItem{
                Label("Actividad", systemImage: "square.and.arrow.up")
            }
            MapView().tabItem { Label("Mapa", systemImage: "map") }
            
        }.onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(Color(hex: "#1C1C1E"))
        }.tint(.white)
        
    }
    
}

#Preview {
    Navigation()
}
