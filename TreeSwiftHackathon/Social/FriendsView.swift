import SwiftUI

struct FriendData: Codable, Hashable {
    let id: Int
    let fullname: String
    let username: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
            case id
            case createdAt = "created_at"
            case username
            case fullname
        }
}

struct FriendsView: View {
    @State private var search: String = ""
    @State private var friendData: [FriendData] = []
    
    
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
                        
                        ForEach(friendData, id: \.self) { item in
                            FriendComponent(userId: item.id, username: item.username, createdAt: item.createdAt, fullName: item.fullname)

                        }
                        
                    }.padding()
                }.border(Color.gray)
            }.background(Color(hex:"#87AFEC"))    }.onAppear {
                Task {
                    if let url = URL(string: "https://mbvodwyplawoqehzwfld.supabase.co/rest/v1/user?select=*") {
                        var request = URLRequest(url: url)
                            request.httpMethod = "GET"
                            request.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1idm9kd3lwbGF3b3FlaHp3ZmxkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM5NjE1NzcsImV4cCI6MjAyOTUzNzU3N30.I6x41mVeRuz3eTLqRIUv5Q-8cGNQ83TGm_3xNVVnf0M", forHTTPHeaderField: "apiKey")
                            
                        URLSession.shared.dataTask(with: request) { data, response, error in
                            if let data = data {
                                do {
                                    let friendDataLocal = try JSONDecoder().decode([FriendData].self, from: data)
                                    friendData = friendDataLocal
                                    
                                    
                                } catch {
                                    print("Error decoding JSON: \(error)")
                                }
                            }
                        }.resume()
                    }

                   }
            }
        
    }
}

#Preview {
    FriendsView()
}
