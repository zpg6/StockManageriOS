//
//  NumberPadButtonIsolated.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/27/20.
//

import Foundation
import SwiftUI
import SFSafeSymbols

/// A view representing a number pad button
struct NumberPadButtonIsolated: View {
    
    /// the string or icon raw value to be displayed on the button
    @State var display: String = ""
    
    @State var small = false
    
    @State var action: ()->Void
    
    /// a formatted text view for integer button labels
    var buttonText: some View {
        Text(self.display)
            .font(small ? .title:.largeTitle)
            .foregroundColor(.white)
    }
    
    /// a formatted image view for icon button labels
    var buttonIcon: some View {
        Image(systemSymbol: SFSymbol(rawValue: self.display)!)
            .font(small ? .title:.largeTitle)
            .foregroundColor(.white)
    }
    
    /// the main view for the button struct, containing the outer (border) circle,
    /// a slightly smaller gray circle on top, and then the appropriate label
    var body: some View {
        
        Button(action: self.action) {
            ZStack {
                
                /// the outer circle, larger making a border
                RoundedRectangle(cornerRadius: small ? 11.5:23)
                    .fill(Color(.black))
                    .frame(width: small ? 54:108, height: small ? 54:108)
                    .shadow(radius: small ? 2:4)
                
                /// the smaller, main circle for the button
                RoundedRectangle(cornerRadius: small ? 7.5:15)
                    .fill(Color(.white))
                    .frame(width: small ? 49:98, height: small ? 49:98)
                
                /// the smaller, main circle for the button
                RoundedRectangle(cornerRadius: small ? 7.5:15)
                    .fill(Color(.black))
                    .frame(width: small ? 50:100, height: small ? 50:100)
                    .opacity(0.8)
                 
                /// if our display parameter was an icon raw value, display that
                if SFSymbol(rawValue: self.display) != nil {
                    self.buttonIcon
                }
                /// otherwise, display the string sent in
                else {
                    self.buttonText
                }
                
            }
        }
        
    }
    
}
