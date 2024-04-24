//
//  BarProgressStyle.swift
//  TreeSwiftHackathon
//
//  Created by Daniel Barocio Valdez on 24/04/24.
//
import SwiftUI
import Charts

struct BarProgressStyle: ProgressViewStyle {
    
    var color: Color = .purple
    var height: Double = 20.0
    var labelFontStyle: Font = .body
    var progress: Double = 0
    var title: String = ""
    
    
    func makeBody(configuration: Configuration) -> some View {
        
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                configuration.label
                    .font(labelFontStyle)
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color(hex: "#3A3A3C"))
                    .frame(height: height)
                    .frame(width: geometry.size.width)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(color)
                            .frame(width: geometry.size.width * progress)
                            .overlay {
                                if let currentValueLabel = configuration.currentValueLabel {
                                    HStack{
                                        Image(title).resizable().scaledToFit().padding(8)
                                        VStack(alignment:.leading){
                                            Text(title).fontWeight(.bold)
                                            currentValueLabel
                                                .font(.headline)
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                    }
            }
        }
    }
}

