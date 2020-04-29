//
//  ContentView.swift
//  Demo SwiftUI 1
//
//  Created by Do Le Duy on 4/25/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            TopContentView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopContentView: View {
    
    @State private var creditCount:Int = 990
    @State private var imageIndexs = [0,1,2]
    @State private var backgroundColors = [Color.white,Color.white,Color.white]
    @State private var imageNames = ["apple", "star", "cherry"]
    private var betAmount = 10
    
    var body: some View {
        VStack {
            Spacer()
            
            /* Title */
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("SwiftUI Slots")
                    .bold()
                    .foregroundColor(.white)
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }.scaleEffect(2)
            
            Spacer()
            
            /* Credit Text */
            Text("Credits: \(creditCount)")
                .padding(.all,10)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
            
            Spacer()
            
            /* 3 Cards */
            HStack {
                CardView(imageName: $imageNames[imageIndexs[0]], backgroundColor: $backgroundColors[imageIndexs[0]])
                CardView(imageName: $imageNames[imageIndexs[1]], backgroundColor: $backgroundColors[imageIndexs[1]])
                CardView(imageName: $imageNames[imageIndexs[2]], backgroundColor: $backgroundColors[imageIndexs[2]])
                
            }.padding()
            
            Spacer()
            
            /* Spin Button */
            Button(action: {
                
                self.backgroundColors = self.backgroundColors.map { _ in
                    Color.white
                }
                
                self.imageIndexs = self.imageIndexs.map({ _ in
                    Int.random(in:0...self.imageIndexs.count - 1)
                })
                
                /* Check win or not */
                if self.imageIndexs[0] == self.imageIndexs[1] && self.imageIndexs[1] == self.imageIndexs[2] {
                    // Win
                    self.creditCount += 100
                    
                    self.backgroundColors = self.backgroundColors.map { _ in
                        Color.green
                    }
                }
            }) {
                Text("Spin")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.all,10)
                    .padding([.leading, .trailing],30)
                    .background(Color.pink)
                    .cornerRadius(20)
            }
            
            Spacer()
        }
    }
}

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/555))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
        }
    }
}
