//
//  ProgressView.swift
//  TreeSwiftHackathon
//
//  Created by Daniel Barocio Valdez on 24/04/24.
//

import SwiftUI

struct RegistroProgressView: View {
     let step: Int
    
    var body: some View {
        HStack{
            ForEach(1...3, id: \.self) { index in
                Circle()
                    .fill(index <= step ? Color(hex: "#F9C701") : Color.white)
                    .frame(width: 20, height: 20)
            }
        }
    }
}

#Preview {
    RegistroProgressView(step: 2)
}
