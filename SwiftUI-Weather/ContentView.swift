//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Fagner Silva on 09/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundGradientView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack {
                CityNameView(cityName: "São Paulo, SP")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 18)
                
                HStack(spacing: 15) {
                    WheaterDayView(dayOfWeek: "SEG",
                                   imageName: "sun.max.fill",
                                   temperature: 30)
                    WheaterDayView(dayOfWeek: "TER",
                                   imageName: "cloud.sun.fill",
                                   temperature: 21)
                    WheaterDayView(dayOfWeek: "QUA",
                                   imageName: "cloud.fill",
                                   temperature: 19)
                    WheaterDayView(dayOfWeek: "QUI",
                                   imageName: "cloud.bolt.fill",
                                   temperature: 14)
                    WheaterDayView(dayOfWeek: "SEX",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 15)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Altere a Localização", textColor: isNight ? .gray : .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WheaterDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 22, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct BackgroundGradientView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
        }
    }
}
