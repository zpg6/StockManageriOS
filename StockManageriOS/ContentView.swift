//
//  ContentView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/21/20.
//

import SwiftUI

struct ContentView: View {
    
    let spacing: CGFloat = 15
    @State var typed = ""
    
    
    var body: some View {
        
        VStack (spacing: self.spacing) {
            
            Text(" \(self.typed) ")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primary)
            
            HStack (spacing: self.spacing) {
                
                NumberPadButtonView(buttonText: "1") {
                    let button = "1"
                    print(button)
                    self.typed += button
                }
                NumberPadButtonView(buttonText: "2") {
                    let button = "2"
                    print(button)
                    self.typed += button
                }
                NumberPadButtonView(buttonText: "3") {
                    let button = "3"
                    print(button)
                    self.typed += button
                }
                
            }
            
            HStack (spacing: self.spacing) {
                
                NumberPadButtonView(buttonText: "4") {
                    let button = "4"
                    print(button)
                    self.typed += button
                }
                NumberPadButtonView(buttonText: "5") {
                    let button = "5"
                    print(button)
                    self.typed += button
                }
                NumberPadButtonView(buttonText: "6") {
                    let button = "6"
                    print(button)
                    self.typed += button
                }
                
            }
            
            
            HStack (spacing: self.spacing) {
                
                NumberPadButtonView(buttonText: "7") {
                    let button = "7"
                    print(button)
                    self.typed += button
                }
                NumberPadButtonView(buttonText: "8") {
                    let button = "8"
                    print(button)
                    self.typed += button
                }
                NumberPadButtonView(buttonText: "9") {
                    let button = "9"
                    print(button)
                    self.typed += button
                }
                
            }
            
            HStack (spacing: self.spacing) {
                
                if self.typed.count > 0 {
                    NumberPadButtonView(buttonIcon: "xmark") {
                        let button = "xmark"
                        print(button)
                        self.typed = String(self.typed.dropLast())
                    }
                } else {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 105, height: 105)
                }
                
                NumberPadButtonView(buttonText: "0") {
                    let button = "0"
                    print(button)
                    self.typed += button
                }
                
                if self.typed.count > 0 {
                    NumberPadButtonView(buttonIcon: "arrow.right") {
                        print("arrow.right")
                    }
                } else {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 105, height: 105)
                }
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
