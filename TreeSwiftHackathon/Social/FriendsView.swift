import SwiftUI


struct FriendsView: View {
    @State private var search: String = ""
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(){
                    Text("Amigos").font(.title).fontWeight(.bold).foregroundStyle(Color.white)
                }
                
                ScrollView{
                    VStack(spacing:10){
                        TextField("User name", text: $search).disableAutocorrection(true).onSubmit {
                            print(search)
                        }
                        .padding()
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))                        .cornerRadius(5).padding(.bottom, 20)
                        FriendComponent()
                        FriendComponent()
                        FriendComponent()
                        FriendComponent()
                        FriendComponent()
                    }.padding()
                }.border(Color.gray)
            }.background(Color(hex:"#87AFEC"))    }
        
    }
}

#Preview {
    FriendsView()
}
