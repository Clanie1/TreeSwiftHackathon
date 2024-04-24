import SwiftUI

struct Navigation: View {
    var body: some View {
                TabView {
                    NavigationView {
                        ForestView().navigationTitle("Mi Parque")
                            .navigationBarTitleTextColor(.white)
                            .background(Color(hex: "#87AFEC"))
                    }.tabItem {
                        Image(systemName: "house")
                        Text("Mi Parque")
                        
                    }
                    NavigationView {
                        FriendsView().navigationTitle("Social")
                    }.tabItem {
                        Image(systemName: "person")
                        Text("Friends")
                    }
                }.onAppear() {
                    UITabBar.appearance().backgroundColor = UIColor(Color(hex: "#1C1C1E"))
                }.tint(.white)
        }
    
}
