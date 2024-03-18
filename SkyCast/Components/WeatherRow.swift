//
//  WeatherRow.swift
//  SkyCast
//
//  Created by Akshay Kadam on 18/03/24.
//

import SwiftUI

struct WeatherRow: View {
    
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0, brightness: 0.888))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 20 ){
                Text(name)
                    .font(.caption)
                    .padding(.vertical, -10)
                
                Text(value)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, -10)
            }
        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer.sun.circle.fill", name: "Feels Like", value: "8°")
}
