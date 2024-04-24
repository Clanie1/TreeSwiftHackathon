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
    @State private var nacimiento = Date.now
    @State private var genero  = "";
    @State private var miembros = "0";
    @State private var showGreeting = true
    
    var body: some View {
        NavigationView{
            
            VStack{
                Spacer()
                Text("Registro").font(.title).fontWeight(.bold).foregroundStyle(Color.white)
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
                //end if
                if section == 2{
                    VStack(spacing: 0){
                        DatePicker(selection: $nacimiento, in: ...Date.now, displayedComponents: .date) {
                            Text("Fecha de Nacimiento").foregroundStyle(Color.gray)
                        }
                        .padding(10).padding(.bottom, 0)
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))                        .cornerRadius(5).padding(.bottom, 0)
                    }.padding().padding(.bottom, 0)
                    HStack(spacing: 0){
                        Text("Genero").foregroundStyle(.gray).padding().padding(.bottom, 0)
                        Spacer()
                        Picker("Select a paint color", selection: $genero) {
                            Text("Hombre")
                            Text("Mujer")
                        }.padding(.top, 0)
                    }.background(Color.white).cornerRadius(5).padding().padding(.top, -30)
                    
                    HStack(spacing: 0){
                        Text("Miembros en tu Casa").foregroundStyle(.gray).padding().padding(.bottom, 0).frame(width:200)
                        Spacer()
                        TextField("Genero", text: $miembros).padding(.top, 0)
                    }.background(Color.white).cornerRadius(5).padding().padding(.top, -30)
                    HStack(spacing: 0){
                        Text("Miembros en tu Casa").foregroundStyle(.gray).padding().padding(.bottom, 0).frame(width:200)
                        Spacer()
                        TextField("Habitaciones", text: $miembros).padding(.top, 0)
                    }.background(Color.white).cornerRadius(5).padding().padding(.top, -30)
                }
                if section == 3{
                    Text("¿Con qué frecuencia dejas luces encendidas en habitaciones vacías?").foregroundStyle(Color(hex:"#48484A")).padding(.top, 10)
                    HStack(spacing: 0){
                        Text("Frecuencia").foregroundStyle(.gray).padding().padding(.bottom, 0)
                        Spacer()
                        Picker("Select a paint color", selection: $genero) {
                            Text("Casi Nunca")
                            Text("Casi Siempre")
                        }
                    }.background(Color.white).cornerRadius(5).padding().padding(.top, -10)
                    
                    Text("Utiliza bombillas de bajo consumo o LED en tu hojar ").foregroundStyle(Color(hex:"#48484A"))
                    
                    
                    HStack(spacing: 0){
                        Toggle("Frecuencia", isOn: $showGreeting).padding(12)
                    }.background(Color.white).cornerRadius(5).padding().padding(.top, -10)
                }
                HStack{
                    Button("Atras"){
                        section -= 1
                    }.disabled(section == 1)
                    Spacer()
                    if section < 3{
                        Button("Continuar"){
                            section += 1
                        }
                    }else{
                        NavigationLink(destination: ContentView()){
                            Text("Continuar").foregroundStyle(.blue)
                        }
                    }
                }.padding().padding(.top, 0).offset(y:-20)
                RegistroProgressView(step:section)
                Image("nube").resizable().scaledToFit().frame( height: 300)
                Spacer()
            }.background(Color(hex: "#87AFEC"))
        }.navigationBarHidden(true)
    }
}

#Preview {
    RegistroView()
}
