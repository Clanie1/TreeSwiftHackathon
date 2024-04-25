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
    @State private var carne = "0"
    @State private var transporteConsumo = "0"
    @State private var luzConsumo = "0"
    @State private var genero = ""

    @State private var amount = "0"
    
    @Binding var historicData: [BarData]
    @Binding var mes: String
    @Binding var mesMessagae: String
    @Binding var mesPasado: String
    @Binding var offsetTotal: String
    @Binding var coins: Int
    
    
    func imprimir(){
        historicData.append(BarData(value: 60, color: "#71C648"))
        mes = "Abril 2024"
        mesMessagae = "27.2 CO2e debajo de tú promedio"
        mesPasado = "60,2 CO2e"
        offsetTotal = "15,3 CO2e"
        
        print(mes)
        print(mesMessagae)
        print(mesPasado)
        print(offsetTotal)
        
        coins += 3420
    }
    
    @State private var inputLuz: String = "0.0"

    var registroTotalLuz: CGFloat {
        return ((CGFloat(Float(luzConsumo) ?? 0.0) * 0.00056 * 1000) * 100).rounded() / 100
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
                let carneValue = Double(carne) ?? 0.0
                let carneCO2 = carneValue * 70.6

                VStack(alignment:.leading){
                    Text("Registra tu consumo de alimentos")
                    Text("1 porcion = 100 grs.").font(.subheadline).foregroundStyle(.yellow).fontWeight(.bold)
                }.padding()
                
                HStack{
                    Text("Carne de Codero").padding()
                    TextField("porción(100g)", text: $carne)
                            .padding()
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding(.horizontal) // Adds
                    
                }.background(
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray.opacity(0.2))
                ).padding()
                
                Divider().overlay(.white)
                HStack{
                    Text("Registro Total: ")
                    Spacer()
                    Text("\(carneCO2) KgCO2e").foregroundStyle(.green).fontWeight(.bold)
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
                let luzValue = Double(luzConsumo) ?? 0.0
                let luzCO2 = luzValue * 0.0056
                VStack(alignment:.leading){
                    Text("Registra tu consumo de Luz")
                    Text("En tu recibo podrás obtener los kWh/mes").font(.subheadline).foregroundStyle(.yellow).fontWeight(.bold)
                }.padding()
                HStack{
                    Text("Consumo   ").padding()
                    TextField("kWh", text: $luzConsumo)
                            .padding()
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding(.horizontal)
                    
                }.background(
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray.opacity(0.2))
                ).padding()
                Divider().overlay(.white)
                HStack{
                    Text("Registro Total: ")
                    Spacer()
                    Text("\(luzCO2) kgCO2").foregroundStyle(.green).fontWeight(.bold)
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
                
                let trasnporteValue = Double(transporteConsumo) ?? 0.0
                let transporteCO2 = trasnporteValue * 2.3025
                
                VStack(alignment:.leading){
                    Text("Registra tú consumo de combustible")
                    Text("La unidad de medida es en litros (lts.)").font(.subheadline).foregroundStyle(.yellow).fontWeight(.bold)
                }.padding()
                HStack{
                    Text("Combustible").padding()
                    Picker("Select a paint color", selection: $genero) {
                        Text("Regular")
                        Text("Premium")
                        Text("Diesel")
                    }.frame(width:240)
                    
                }.background(
                    RoundedRectangle(cornerRadius: 10)
                      .fill(.gray.opacity(0.2))
                ).padding(.horizontal)
                HStack{
                    Text("Consumo   ").padding()
                    TextField("lts", text: $transporteConsumo)
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
                    HStack{
                        Text("\(transporteCO2) KgCO2e").foregroundStyle(.green).fontWeight(.bold)
                    }
                }.padding()
                Button(action:imprimir ) {
                      Text("Registrar")
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
