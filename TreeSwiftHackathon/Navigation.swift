import SwiftUI

struct Navigation: View {
    var body: some View {
                TabView {
                    NavigationView {
                        ForestView().navigationTitle("Home")
                            .accentColor(Color.white)
                            .background(Color(hex: "#87AFEC"))
                    }.tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    NavigationView {
                        FriendsView().navigationTitle("Social")
                    }.tabItem {
                        Image(systemName: "person")
                        Text("Friends")
                    }
                }.accentColor(.white)
        }
    
}
