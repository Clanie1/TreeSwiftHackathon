//
//  ActividadView.swift
//  TreeSwiftHackathon
//
//  Created by Daniel Barocio Valdez on 23/04/24.
//

import SwiftUI
import Charts

struct ActividadView: View {
    
    let data = [
        (name: "Agua", sales: 9631),
        (name: "Crêpe", sales: 6959),
        (name: "Injera", sales: 4891)
    ]
    
    var body: some View {
        ScrollView{
            
            VStack(alignment:.center){
                Text("Actividad").font(.title).fontWeight(.bold).foregroundStyle(Color.white)
                HStack{
                    Button(action: {
                        notify(title: "Mejoras de Patio", subtitle: "Daniel Barocio ha mejorado su Patio")
                    }) {
                        Text("1 Mar - 31 Mar 2024").font(.subheadline).foregroundStyle(Color.white)
                    }
                }.frame(height: 20)
                ZStack{
                    
                    Chart(data, id: \.name) { name, sales in
                        SectorMark(angle: .value("Value", sales),innerRadius:.ratio(0.9), angularInset: 8)
                            .foregroundStyle(by: .value("Product category", name)).cornerRadius(8)
                    }.padding(.top, 10).frame(height: 300).chartLegend(.hidden)
                    VStack{
                        Text("Huella total este mes").font(.title3).foregroundStyle(.gray)
                        Text("17,6 CO2 e").foregroundStyle(.white).font(.title)
                            
                    }
                }
                
                VStack(spacing:34){
                    ProgressView(value: 0.3, label: { Text("") }, currentValueLabel: { Text("48%") })
                        .progressViewStyle(BarProgressStyle(     color: .red, height: 60.0, progress: 0.48, title: "Transporte" )).padding()
                    ProgressView(value: 0.3, label: { Text("") }, currentValueLabel: { Text("30%") })
                        .progressViewStyle(BarProgressStyle(     color: .blue, height: 60.0, progress: 0.3, title: "Agua" )).padding()
                    ProgressView(value: 0.3, label: { Text("") }, currentValueLabel: { Text("50%") })
                        .progressViewStyle(BarProgressStyle(     color: .green, height: 60.0, progress: 0.5, title:"Energia" )).padding()
                }
                
            }
        }.background(Color(hex: "#1C1C1E"))
    }
}

#Preview {
    ActividadView()
}
