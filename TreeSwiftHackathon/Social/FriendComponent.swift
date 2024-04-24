import SwiftUI

func toDateText(isoString: String) -> String {
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    if let date = dateFormatter.date(from: isoString) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: date)
        let formattedDate = DateFormatter.localizedString(from: date, dateStyle: .long, timeStyle: .none)
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
                        Text(fullName).foregroundStyle(Color.white).font(.headline).fontWeight(.bold)
                        Text("Desde " + toDateText(isoString: createdAt)).foregroundStyle(Color.white)
                    }.padding(.leading, 10)
                    Spacer()
                    Image("Right").resizable().scaledToFit()
                }.padding(10).clipShape(RoundedRectangle(cornerRadius:10)).frame(height: 70)
        }.background(Color(hex: "#1C1C1E")).cornerRadius(4)
    }
}

#Preview {
    FriendComponent(selectedItem: .none, coins: 10,userId: 2, username: "clanie1", createdAt: "2024-04-24T17:37:59.207776+00:00", fullName: "Daniel Barocio").background(Color(hex:"#87AFEC"))
}
