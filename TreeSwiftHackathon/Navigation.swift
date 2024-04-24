import SwiftUI

struct Navigation: View {
    var body: some View {
        TabView {
            FriendsView().tabItem {Label("Social", systemImage: "person")}
            ForestView().tabItem{Label("Mi Parque", systemImage: "house")}
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
