import SwiftUI


struct FriendComponent: View {
    
    @State var selectedItem: ItemType = .none
    @State var coins: Int  = 0
    
    var body: some View {
        NavigationLink(destination: FriendProfileView()) {
            HStack() {
                Image(systemName: "person").foregroundColor(Color.black)
                Text("Daniel Barocio").foregroundStyle(Color.black)
            }.padding(10).border(Color.black)
        }
    }
}

#Preview {
    FriendComponent(selectedItem: .none, coins: 10)
}
