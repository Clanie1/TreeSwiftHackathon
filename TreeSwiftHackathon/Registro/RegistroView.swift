//
//  RegistroView.swift
//  TreeSwiftHackathon
//
//  Created by Daniel Barocio Valdez on 24/04/24.
//

import SwiftUI

struct RegistroView: View {
    
    @State private var nombre:String = ""
    @State private var section:Int = 1
    
    var body: some View {
        VStack{
            Spacer()
            Text("Registro").font(.title).fontWeight(.bold).foregroundStyle(Color.white).padding(.bottom, 10)
            Text("Primero queremos conocerte").foregroundStyle(Color(hex: "#5A6B86"))
            
            if section == 1{ VStack(spacing: 0){
                TextField("Nombre completo", text: $nombre
                ).disableAutocorrection(true).onSubmit {
                    print("hello")
                }
                .padding()
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))                        .cornerRadius(5).padding(.bottom, 5)
                
                TextField("Usuario", text: $nombre
                ).disableAutocorrection(true).onSubmit {
                    print("hello")
                }
                .padding()
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))                        .cornerRadius(5).padding(.bottom, 20)
            }.padding().padding(.bottom, 0)
            }
            HStack{
                Button("Atras"){
                    section -= 1
                }
                Spacer()
                Button("Continuar"){
                    section += 1
                }
            }.padding().padding(.top, 0).offset(y:-50)
            RegistroProgressView(step:section)
            Image("nube").resizable().scaledToFit().frame( height: 300)
            Spacer()
        }.background(Color(hex: "#87AFEC"))
    }
}

#Preview {
    RegistroView()
}
