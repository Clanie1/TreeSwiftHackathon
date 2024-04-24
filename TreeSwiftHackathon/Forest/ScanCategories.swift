//
//  ScanCategories.swift
//  TreeSwiftHackathon
//
//  Created by Mauricio Munoz on 4/24/24.
//

import SwiftUI

struct ScanCategories: View {
    @State private var category = 0
    

    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        VStack {
            Picker("Selecciona una categoría", selection: $category) {
                Text("Agua").tag(0)
                Text("Luz").tag(1)
                Text("Transporte").tag(2)
            }.pickerStyle(.segmented).foregroundColor(.white)
                
            Button(action: {
            }) {
                Text("Salir").foregroundColor(.white)
            }
           
        }.padding().background(Color(hex: "#1C1C1E")).clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 5.0, bottomLeading: 0.0, bottomTrailing: 0.0, topTrailing: 5.0), style: .continuous))    }
}

#Preview {
    @State var isScanning = true
    return ScanCategories()
}
