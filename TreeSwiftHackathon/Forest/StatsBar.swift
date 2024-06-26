//
//  StatsBar.swift
//  TreeSwiftHackathon
//
//  Created by Mauricio Munoz on 4/23/24.
//

import SwiftUI

struct StatsBar: View {
    
    @State var value: CGFloat
    @State var color: String
    @State var index: Int
    
    func toMonthAbbreviation(idx: Int) -> String {
           let months = ["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic"]
           return months[(idx + 6) % 12]
       }
    
    var body: some View {
        VStack {
            Rectangle().fill(.black.opacity(0)).frame(width: 20, height: 100 - value)
            Rectangle().fill(Color(hex: color)).frame(width: 20, height: value).clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 5.0, bottomLeading: 0.0, bottomTrailing: 0.0, topTrailing: 5.0), style: .continuous))
            Text(toMonthAbbreviation(idx: index)).foregroundColor(Color(hex: "#8E8E93")).font(.system(size: 12))
        }
    }
}

#Preview {
    StatsBar(value: 90, color: "#71C648", index: 0)
}
