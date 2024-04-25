//
//  BarGroup.swift
//  TreeSwiftHackathon
//
//  Created by Mauricio Munoz on 4/24/24.
//

import SwiftUI

struct BarGroup: View {
    
    @Binding var historicData: [BarData]
    
    var body: some View {
        HStack {
            ForEach(historicData.indices, id: \.self) { index in
                let data = historicData[index]
                StatsBar(value: data.value, color: data.color, index: index)
            }
        }
    }
}
//
//#Preview {
//    BarGroup()
//}
