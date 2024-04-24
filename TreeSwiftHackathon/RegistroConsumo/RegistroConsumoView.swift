//
//  RegistroConsumoView.swift
//  TreeSwiftHackathon
//
//  Created by Daniel Barocio Valdez on 24/04/24.
//

import SwiftUI

struct RegistroConsumoView: View {
    
    @State var selectedItem: ItemType = .none
    
    
    
    @Binding var historicData: [BarData]
    @Binding var mes: String
    @Binding var mesMessagae: String
    @Binding var mesPasado: String
    @Binding var offsetTotal: String
    @Binding var coins: Int

    
    
    var body: some View {
        NavigationView{
            VStack {
                VStack(spacing: 2) {
                    HStack {
                        Text("Actividad").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                        Spacer()
                    }.padding()
                    
                    CoinView(coins: $coins)
                }
                
                GridView(selectedItem: $selectedItem, coins: $coins).padding(.leading, 20).padding(.trailing, 20)
                
                FormDeRegistroConsumoView(historicData: $historicData, mes: $mes, mesMessagae: $mesMessagae, mesPasado: $mesPasado, offsetTotal: $offsetTotal, coins: $coins)
                
                Spacer()
            }.background(Color(hex:"#87AFEC"))
        }
    }
}

