//
//  FriendProfileView.swift
//  TreeSwiftHackathon
//
//  Created by Daniel Barocio Valdez on 23/04/24.
//

import SwiftUI

struct FriendProfileView: View {
    
    @State var selectedItem: ItemType = .none
    @State var coins: Int = 0
    
    @State var userId: Int
    @State var username: String
    @State var createdAt: String
    @State var fullName: String
    

    func imprimir(){
        print("hello")
    }
    
    var body: some View {
        VStack(alignment: .leading){
                
                
                HStack{
                    
                    Text(fullName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).foregroundStyle(Color.white)
                    Text("200 pts").font(.title).fontWeight(.bold).foregroundStyle(Color.yellow)
                }
                HStack{
                    Text("@" + username).font(.subheadline).fontWeight(.medium).foregroundColor(.white)
                    Text("*")
                    Text(toDateString(isoString: createdAt)).font(.subheadline).fontWeight(.medium)
                    Spacer()
                }
            
            GridView( userId: userId, selectedItem: $selectedItem, coins: $coins)

            HStack(alignment:.center ){
                
                Button(action: imprimir) {
                    HStack {
                        Text("Agregar")
                        Text("+").fontWeight(.bold)
                    }.frame(width: 120, height: 40)
                }.foregroundColor(.black).background(Color.yellow).cornerRadius(40)
                Button(action: imprimir) {
                    Image(systemName: "person.2").frame(width: 40, height: 40)
                }.foregroundColor(.black).background(Color.yellow).cornerRadius(40)
                
                Button(action: imprimir){
                    Image("share").resizable()
                        .scaledToFit()
                }.frame(width:40, height: 40).cornerRadius(8)
                
            }.padding(.top,20)
            
            HStack(alignment: .bottom){
                Text("Logros").padding(.top,20).font(.title2).fontWeight(.semibold
                ).foregroundColor(Color.white)
                Spacer()
                Button(action:imprimir ,label:{
                    Text("Ver Todos").padding(.bottom,5).foregroundColor(.yellow).fontWeight(.bold)
                    
                }
                )
            }
            HStack{
                Image("logro1").resizable().scaledToFit().clipShape(RoundedRectangle(cornerRadius: 10)).padding(8).shadow(radius: 10)
                Image("logro2").resizable().scaledToFit().clipShape(RoundedRectangle(cornerRadius: 10)).padding(8).shadow(radius: 10)
                Image("logro3").resizable().scaledToFit().clipShape(RoundedRectangle(cornerRadius: 10)).padding(8).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
            }
            Spacer()
        }.padding().background(Color(hex: "#87AFEC"))
        
    }
}

#Preview {
    FriendProfileView(userId: 2, username: "clanie1", createdAt: "Ayer", fullName: "Daniel Barocio")
}
