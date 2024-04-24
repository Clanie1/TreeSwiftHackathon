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
        VStack(alignment:.center){
            Text("Actividad").font(.title).fontWeight(.bold).foregroundStyle(Color.white)
            HStack{
                Text("1 Mar - 31 Mar 2024").font(.subheadline).foregroundStyle(Color.white)
            }.frame(height: 20)
            Chart(data, id: \.name) { name, sales in
                SectorMark(angle: .value("Value", sales),innerRadius:.ratio(0.9), angularInset: 8)
                    .foregroundStyle(by: .value("Product category", name)).cornerRadius(8)
            }.padding(30)
        }.background(Color(hex: "#1C1C1E"))
    }
}

#Preview {
    ActividadView()
}
