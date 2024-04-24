import SwiftUI

func toDateString(isoString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    if let date = dateFormatter.date(from: isoString) {
        dateFormatter.dateFormat = "MMMM yyyy"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    return isoString
}


struct FriendComponent: View {
    
    @State var selectedItem: ItemType = .none
    @State var coins: Int  = 0
    
    @State var userId: Int
    @State var username: String
    @State var createdAt: String
    @State var fullName: String
    
   
    
    var body: some View {
        NavigationLink(destination: FriendProfileView(userId: userId, username: username, createdAt: createdAt, fullName: fullName)) {
                HStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 50, height: 50)
                        Image(systemName: "person").foregroundColor(.black)
                        Circle().fill(Color.red).frame(width: 12, height:12)
                        
                        .foregroundColor(.black).offset(x: 18, y: 18)                 }
                    .font(.system(size: 20))
                    VStack (alignment:.leading, spacing: 0){
                        Text(fullName).foregroundStyle(Color.white).font(.title2).fontWeight(.bold)
                        Text("Desde " + toDateString(isoString: createdAt)).foregroundStyle(Color.black)
                    }.padding(.leading, 10)
                    Spacer()
                    Image("Right").resizable().scaledToFit()
                }.padding(10).clipShape(RoundedRectangle(cornerRadius:10)).frame(height: 70)
        }.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).background(Color.orange).cornerRadius(15)
    }
}

#Preview {
    FriendComponent(selectedItem: .none, coins: 10,userId: 2, username: "clanie1", createdAt: "Ayer", fullName: "Daniel Barocio").background(Color(hex:"#87AFEC"))
}
