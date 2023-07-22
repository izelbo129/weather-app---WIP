//
//  DetailedWeatherView.swift
//  Weather
//
//  Created by Ian Zelbo on 6/14/23.
//

import SwiftUI

struct DetailedWeatherView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var day: String
    var imageName: String
    var temperature: Int
    var description: String
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                Text(day)
                    .font(.system(size: 40, weight: .heavy, design: .default))
                    .foregroundColor(.white)
                    .padding(50)
                
                
                
                VStack {
                    Image(systemName: imageName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180,height: 180)
                    
                    
                    Text("\(temperature)°")
                        .font(.system(size: 70, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .padding()
                }
                
                
                Text(description)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 25, weight: .heavy, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Dismiss")
                        .foregroundColor(.white)
                    
                    
                }
            }
        }
    }
    
    struct DetailedWeatherView_Previews: PreviewProvider {
        static var previews: some View {
            DetailedWeatherView(day: "testprev", imageName: "cloud",temperature: 22,description: "desc prev")
        }
    }
}
