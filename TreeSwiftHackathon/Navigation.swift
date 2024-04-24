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
struct Navigation: View {
    
    @State private var selectedTabindex = 0
    
    var body: some View {
        TabView {
            FriendsView().tabItem {Label("Social", systemImage: "person")}
            ForestView().tabItem{Label("Mi Parque", systemImage: "house")}.background(Color(hex: "#87AFEC"))
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
