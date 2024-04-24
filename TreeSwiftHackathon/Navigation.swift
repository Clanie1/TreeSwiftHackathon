import SwiftUI

struct Navigation: View {
    
    @State private var selectedTabindex = 0
    
    var body: some View {
        TabView {
            FriendsView().tabItem {Label("Social", systemImage: "person")}
            ForestView().tabItem{Label("Mi Parque", systemImage: "house")}.background(Color(hex: "#87AFEC"))
            ActividadView().tabItem{
                Label("Actividad", systemImage: "square.and.arrow.up")
            }
        }.onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(Color(hex: "#1C1C1E"))
        }.tint(.white)
        
    }
    
}

#Preview {
    Navigation()
}
