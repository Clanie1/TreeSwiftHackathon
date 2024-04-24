import SwiftUI


struct FriendsView: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack(){
                    Text("Amigos").font(.title).fontWeight(.bold)
                }
                Spacer()
                FriendComponent()
                FriendComponent()
            }    }
        
    }
}

#Preview {
    FriendsView()
}
