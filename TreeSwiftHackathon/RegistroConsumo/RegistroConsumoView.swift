//
//  RegistroConsumoView.swift
//  TreeSwiftHackathon
//
//  Created by Daniel Barocio Valdez on 24/04/24.
//

import SwiftUI

struct RegistroConsumoView: View {
    
    @State var selectedItem: ItemType = .none
    @State var coins: Int = 10000
    
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
                
               FormDeRegistroConsumoView()
                
                Spacer()
            }.background(Color(hex:"#87AFEC"))
        }
    }
}

#Preview {
    RegistroConsumoView()
}
