//
//  FriendProfileView.swift
//  TreeSwiftHackathon
//
//  Created by Daniel Barocio Valdez on 23/04/24.
//

import SwiftUI

struct FriendProfileView: View {
    
    func imprimir(){
        print("hello")
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                
                Text("Daniel Barocio").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold).foregroundStyle(Color.white)
                Text("200").font(.title).fontWeight(.bold).foregroundStyle(Color.yellow)
            }
            HStack{
                Text("@DaniBarocio11").font(.subheadline).fontWeight(.medium)
                Text("*")
                Text("Desde Abril  2017 ").font(.subheadline).fontWeight(.medium)
                Spacer()
            }.padding(.top,0.6)
            
            HStack(alignment:.center ){
                
                Button(action: imprimir) {
                    HStack {
                        Text("Agregar Amigo")
                        Text("+").fontWeight(.bold)
                    }.frame(width: 250, height: 40)
                }.foregroundColor(.black).background(Color.yellow).cornerRadius(8).shadow(radius: 3)
                
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
                
            }.border(Color.white).clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
        }.padding().background(Color(hex: "#87AFEC"))
    }
}

#Preview {
    FriendProfileView()
}
