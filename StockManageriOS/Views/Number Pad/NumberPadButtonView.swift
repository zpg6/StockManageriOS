//
//  NumberPadButtonView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/21/20.
//

import Foundation
import SwiftUI
import SFSafeSymbols

/// A view representing a number pad button
struct NumberPadButtonView: View {
    
    /// the string or icon raw value to be displayed on the button
    @State var display: String = ""
    
    /// the query string that we edit with button presses
    @Binding var resultString: String
    
    
    @Binding var sheet: DisplaySheet
    
    @State var small = false
    
    /// a formatted text view for integer button labels
    var buttonText: some View {
        Text(self.display)
            .font(.largeTitle)
            .foregroundColor(.white)
    }
    
    /// a formatted image view for icon button labels
    var buttonIcon: some View {
        Image(systemSymbol: SFSymbol(rawValue: self.display)!)
            .font(.largeTitle)
            .foregroundColor(.white)
    }
    
    /// the main view for the button struct, containing the outer (border) circle,
    /// a slightly smaller gray circle on top, and then the appropriate label
    var body: some View {
        
        Button(action: self.action) {
            ZStack {
                
                /// the outer circle, larger making a border
                RoundedRectangle(cornerRadius: small ? 15:23)
                    .fill(Color(.black))
                    .frame(width: small ? 75:108, height: small ? 75:108)
                    .shadow(radius: small ? 3:4)
                
                /// the smaller, main circle for the button
                RoundedRectangle(cornerRadius: small ? 10:15)
                    .fill(Color(.white))
                    .frame(width: small ? 70:98, height: small ? 70:98)
                
                /// the smaller, main circle for the button
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.black))
                    .frame(width: small ? 72:100, height: small ? 72:100)
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
    
    /// the required action of a number pad button, either adding to the query (integer),
    /// deleting the last character (xmark button), or submitting the query for results (arrow.right button)
    func action() {
        
        /// if this button is an integer, print that it was pressed
        /// and append it to the result string binding from the parent view
        if let digit = Int(self.display) {
            print("\(digit) pressed.")
            self.resultString += "\(digit)"
        }
        /// otherwise, if the button is an icon ,print that it was pressed
        /// and take the appropriate action either removing last character or submitting query
        else if let symbol = SFSymbol(rawValue: self.display) {
            print(symbol.rawValue + " pressed.")
            switch symbol {
                case .xmark:
                    self.resultString = String(resultString.dropLast())
                case .arrowRight:
                    if resultString.count > 0 {
                        self.sheet = .results
                    }
                default:
                    print("an unexpected icon was pressed on the number pad")
            }
        }
        
    }
    
}

/// some  preview bindings to make binding-dependent views more easily declarable
class PreviewBindings {
    static let string = Binding<String>(get: { return "1" }, set: { let _ = $0 })
    static let bool = Binding<Bool>(get: { return false }, set: { let _ = $0 })
}

//struct NumberPadButtonView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        HStack {
//            NumberPadButtonView(display: "1", resultString: PreviewBindings.string, showResults: PreviewBindings.bool, sheet: self.s)
//            NumberPadButtonView(display: SFSymbol.xmark.rawValue, resultString: PreviewBindings.string, showResults: PreviewBindings.bool, sheet: <#Binding<DisplaySheet>#>)
//        }
//    }
//}
