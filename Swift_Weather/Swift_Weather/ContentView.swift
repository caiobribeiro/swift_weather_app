//
//  ContentView.swift
//  Swift_Weather
//
//  Created by Caio Beraldi Ribeiro on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "São Paulo")

                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 24)

                HStack(spacing: 20) {
                    WeathcerDayView(dayOffWeek: "Ter", imageName: "cloud.sun.fill", temperature: 24)
                    WeathcerDayView(dayOffWeek: "Qua", imageName: "sun.max.fill", temperature: 24)
                    WeathcerDayView(dayOffWeek: "Qui", imageName: "wind.snow", temperature: -2)
                    WeathcerDayView(dayOffWeek: "Sex", imageName: "sunset.fill", temperature: 24)
                    WeathcerDayView(dayOffWeek: "Sáb", imageName: "cloud.rain.fill", temperature: 24)
                }

                Spacer()

                Button(
                    action: {
                        isNight.toggle()
                    },
                    label: {
                        WeatherButton(title: "Mudar hora do dia", textColor: isNight ? .white : .blue, backgroundColor: isNight ? .black : .white)
                    }
                )
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeathcerDayView: View {
    var dayOffWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack {
            Text(dayOffWeek)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [Color(isNight ? .black : .blue), Color(isNight ? .gray : Color("lightBlue"))]
            ),
            startPoint: .topLeading,
            endPoint: .bottomLeading
        ).edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
            Text("\(temperature)°C")
                .font(.system(size: 64, weight: .semibold))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
