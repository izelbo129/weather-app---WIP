//
//  ContentView.swift
//  Weather
//
//  Created by Ian Zelbo on 6/14/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State private var showNewView = false
    
    var days: [String] = ["Mon" , "Tues" , "Wed", "Thurs"]
    
    
    var body: some View {
        NavigationStack {
            
            
            ZStack {
                LinearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    Text("Ulan Bator")
                        .font(.system(size: 40, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .padding()
                        .opacity(0.9)
                    
                    
                    
                    VStack {
                        Image(systemName: "cloud.rain.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180,height: 180)
                            .opacity(0.9)
                        
                        
                        Text("45°")
                            .font(.system(size: 70, weight: .heavy, design: .default))
                            .foregroundColor(.white)
                            .padding()
                            .opacity(0.95)
                            .shadow(color: .init(red: 0.2, green: 0.2, blue: 0.2), radius: 10, x: 0, y: 2)
                        
                    }
                    
                    
                    VStack {
                        HStack(spacing: 20) {
                            
                            
                            DayView(dayOfWeek: ("Now"), dayFull: "Now", imageName: "cloud.rain.fill", temperature: 45, description: "")
                            DayView(dayOfWeek: "3PM", dayFull: "3PM", imageName: "cloud.rain.fill", temperature: 42, description: "")
                            DayView(dayOfWeek: "4PM", dayFull: "4PM", imageName: "cloud.fill", temperature: 47, description: "")
                            DayView(dayOfWeek: "5PM", dayFull: "5PM", imageName: "cloud.sun.fill", temperature: 55, description: "")
                            DayView(dayOfWeek: "6PM", dayFull: "6PM", imageName: "cloud.sun.fill", temperature: 57, description: "")
                        }
                        
                        
                        
                        ZStack {
                            Rectangle()
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [.green, .white,.yellow,.yellow,.orange]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ))
                                
                                .frame(width: 300, height: 8)
                                //.clipShape(Circle())
                                .cornerRadius(20)
                                .opacity(0.9)
                            
                            
                            Circle()
                                .frame(width: 8,height: 8)
                                .foregroundColor(.white)
                                .offset(x: -25, y: 0)
                            
                        }
                    }
                    
                    
                    .padding(15)
                    .background(.white.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
                    
                    
                    
                    
                    
                    Spacer()
                    
                    
                    
                    HStack(spacing: 20) {
                        
                        
                        let tueDesc: String = "Put on a light jacket. You should see a high of 65° and a low of 53°."
                        let wedDesc: String = "Should be a beautiful day! Look for a high of 72° and a lot of 65°."
                        let thursDesc: String = "It's going to be a cold and windy day. Expect a high of 47° and a low of 34°."
                        let friDesc: String = "No need for a jacket. Look for a high of 72° and a low of 68°."
                        let satDesc: String = "Put on your winter coat! Expect a high of 20° and a low of 18°."
                        
                        
                        DayView(dayOfWeek: "Tue", dayFull: "Tuesday", imageName: "cloud.sun.fill", temperature: 56, description: tueDesc)
                        DayView(dayOfWeek: "Wed", dayFull: "Wednesday", imageName: "sun.max.fill", temperature: 65, description: wedDesc)
                        DayView(dayOfWeek: "Thurs", dayFull: "Thursday", imageName: "wind.snow", temperature: 43, description: thursDesc)
                        DayView(dayOfWeek: "Fri", dayFull: "Friday", imageName: "cloud.sun.fill", temperature: 68, description: friDesc)
                        DayView(dayOfWeek: "Sat", dayFull: "Saturday", imageName: "snow", temperature: 22, description: satDesc)
                    }
                    .padding(15)
                    .background(.white.opacity(0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style:.continuous))
                    
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
    
    
    struct DayView: View {
        
        @State private var showingSheet = false
        
        
        var dayOfWeek: String
        var dayFull: String
        var imageName: String
        var temperature: Int
        var description: String
        
        
        var body: some View {
            VStack {
                Text(dayOfWeek)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .opacity(0.9)
                
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40,height: 40)
                    .opacity(0.9)
                
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .opacity(0.9)
                
            } .contentShape(Rectangle())
                .onTapGesture {
                    showingSheet.toggle()
                }
                .sheet (isPresented: $showingSheet) {
                    DetailedWeatherView(day: dayFull,imageName: imageName,temperature: temperature,description: description)
                }
        }
    }
}
