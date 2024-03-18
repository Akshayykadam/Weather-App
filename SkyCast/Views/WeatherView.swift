//
//  WeatherView.swift
//  SkyCast
//
//  Created by Akshay Kadam on 18/03/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max.fill")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                                .padding(.horizontal, 30)
                        }
                        .frame(width: 150, alignment: .leading)
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2019/04/29/20/41/amsterdam-4167026_1280.png")){image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                        
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather Now")
                        .foregroundColor(.white)
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer.low", name: "Min Temp", value: (weather.main.tempMin.roundDouble()+"°"))
                            
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer.high", name: "Max Temp        ", value: (weather.main.tempMax.roundDouble()+"°"))
                    }
                    
                    HStack{
                        WeatherRow(logo: "humidity", name: "humidity", value: (weather.main.humidity.roundDouble()+"%"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "wind", name: "Wind Speed   ", value: (weather.wind.speed.roundDouble()+"m/s"))
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.black)
                .background(Color.pink)
                .cornerRadius(25, corners: [.topLeft,.topRight])
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.white)
        .preferredColorScheme(.light)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
