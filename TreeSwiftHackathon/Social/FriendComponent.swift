import SwiftUI


struct FriendComponent: View {
    
    @State var selectedItem: ItemType = .none
    @State var coins: Int  = 0
    
    var body: some View {
        HStack() {
            NavigationLink(destination: ForestView(isFriendView: true).navigationTitle("Daniel Barocio")) {
                    Text("Daniel Barocio")
                }
            
        }.padding(10).border(Color.black)
    }
}
