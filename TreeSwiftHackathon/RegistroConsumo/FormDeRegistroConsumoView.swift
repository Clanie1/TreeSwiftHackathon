//
//  FormDeRegistroConsumoView.swift
//  TreeSwiftHackathon
//
//  Created by Daniel Barocio Valdez on 24/04/24.
//

import SwiftUI

struct foodCount{
    var name: String
    var amount: Int
}

enum formType:String{
    case luz = "Luz"
    case transporte = "Transporte"
    case comida = "Comida"
}

struct FormDeRegistroConsumoView: View {
    
    @State private var formSelectedType:String = formType.comida.rawValue
    @State private var amount = "0"
    
    func imprimir(){
        print("")
        
    }
    
    @State private var inputLuz: String = "0.0"

    var registroTotalLuz: CGFloat {
        return ((CGFloat(Float(inputLuz) ?? 0.0) * 0.00056 * 1000) * 100).rounded() / 100
    }
    
    
    
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Spacer()
                Button("Luz"){
                    formSelectedType = formType.luz.rawValue
                }
                
                Button("Transporte"){
                    formSelectedType = formType.transporte.rawValue
                }
                Button("Comida"){
                    formSelectedType = formType.comida.rawValue
                }
                Spacer()
            }.padding(5)
            
            if formSelectedType == "Comida"{
                
                VStack(alignment:.leading){
                    Text("Registra tu consumo de alimentos")
                    Text("1 porcion = 100 grs.").font(.subheadline).foregroundStyle(.yellow).fontWeight(.bold)
                }.padding()
                
                HStack{
                    Text("Carne de Codero").padding()
                    TextField("porción(100g)", text: $amount)
                            .padding()
                            .font(.title) // Sets the font to "Title" style
                            .foregroundColor(.blue) // Sets the text color to blue
                            // Adds a gray background with 20% opacity
                            .padding(.horizontal) // Adds
                    
                }.background(
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray.opacity(0.2))
                ).padding()
               
                
                
                
                Divider().overlay(.white)
                HStack{
                    Text("Registro Total: ")
                    Spacer()
                    Text("12,2 CO2e").foregroundStyle(.green).fontWeight(.bold)
                }.padding()
                Button(action:imprimir ) {
                      Text("Register")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.horizontal,100)
                        .padding(.vertical, 10)
                    }
                    .background(Color.yellow)
                    .cornerRadius(10).padding().frame(maxWidth:.infinity)
            }
            else if formSelectedType == "Luz"{
                VStack(alignment:.leading){
                    Text("Registra tu consumo de Luz")
                    Text("En tu recibo podrás obtener los kWh/mes").font(.subheadline).foregroundStyle(.yellow).fontWeight(.bold)
                }.padding()
                HStack{
                    Text("Consumo   ").padding()
                    TextField("kWh", text: $inputLuz)
                            .padding()
                            .font(.title) // Sets the font to "Title" style
                            .foregroundColor(.blue) // Sets the text color to blue
                            // Adds a gray background with 20% opacity
                            .padding(.horizontal) // Adds
                    
                }.background(
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray.opacity(0.2))
                ).padding()
                Divider().overlay(.white)
                HStack{
                    Text("Registro Total: ")
                    Spacer()
                    Text(String(describing: registroTotalLuz) + " kgCO2").foregroundStyle(.green).fontWeight(.bold)
                }.padding()
                Button(action:imprimir ) {
                      Text("Register")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.horizontal,100)
                        .padding(.vertical, 10)
                    }
                    .background(Color.yellow)
                    .cornerRadius(10).padding().frame(maxWidth:.infinity)
            }
            else if formSelectedType == "Transporte"{
                VStack(alignment:.leading){
                    Text("Registra tú consumo de combustible")
                    Text("La unidad de medida es en litros (lts.)").font(.subheadline).foregroundStyle(.yellow).fontWeight(.bold)
                }.padding()
                HStack{
                    Text("Combustible").padding()
                    TextField("kWh", text: $amount)
                            .padding()
                            .font(.title) // Sets the font to "Title" style
                            .foregroundColor(.blue) // Sets the text color to blue
                            // Adds a gray background with 20% opacity
                            .padding(.horizontal) // Adds
                    
                }.background(
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray.opacity(0.2))
                ).padding(.horizontal)
                HStack{
                    Text("Consumo   ").padding()
                    TextField("lts", text: $amount)
                            .padding()
                            .font(.title) // Sets the font to "Title" style
                            .foregroundColor(.blue) // Sets the text color to blue
                            // Adds a gray background with 20% opacity
                            .padding(.horizontal) // Adds
                    
                }.background(
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray.opacity(0.2))
                ).padding(.horizontal)
                Divider().overlay(.white)
                HStack{
                    Text("Registro Total: ")
                    Spacer()
                    Text("12,2 CO2e").foregroundStyle(.green).fontWeight(.bold)
                }.padding()
                Button(action:imprimir ) {
                      Text("Register")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.horizontal,100)
                        .padding(.vertical, 10)
                    }
                    .background(Color.yellow)
                    .cornerRadius(10).padding().frame(maxWidth:.infinity)
            }
            //            Spacer()
        }.background(.black).foregroundColor(.white).cornerRadius(10).padding(8)
    }
}

#Preview {
    FormDeRegistroConsumoView()
}
