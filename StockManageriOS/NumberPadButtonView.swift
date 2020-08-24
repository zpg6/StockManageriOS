//
//  NumberPadButtonView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/21/20.
//

import Foundation
import SwiftUI
import SFSafeSymbols

struct NumberPadButtonView: View {
    
    @State private var buttonDigit: Int?
    @State private var sfSymbol: SFSymbol?
    @Binding var resultString: String
    
    init(_ display: AnyHashable, result: Binding<String>) {
        self._resultString = result
        if let digit = display as? Int {
            self.buttonDigit = digit
            self.sfSymbol = nil
        }
        else if let symbol = display as? SFSymbol {
            self.sfSymbol = symbol
            self.buttonDigit = nil
        }
    }
    
    init(_ number: Int, result: Binding<String>) {
        self._resultString = result
        self.sfSymbol = nil
        self.buttonDigit = number
    }
    
    init(_ sfSymbol: SFSymbol, result: Binding<String>) {
        self._resultString = result
        self.buttonDigit = nil
        self.sfSymbol = sfSymbol
    }
    
    func action() {
        if let digit = self.buttonDigit {
            print("\(digit) pressed.")
            self.resultString += "\(digit)"
        }
        else if let symbol = self.sfSymbol {
            print(symbol.rawValue + " pressed.")
            switch symbol {
                case .xmark:
                    self.resultString = String(resultString.dropLast())
                case .arrowRight:
                    if resultString.count >= 0 {  } // fill in what hitting enter does
                default:
                    print("an unexpected icon was pressed on the number pad")
            }
        }
        
    }
    
    var buttonContent: some View {
        Group {
            if let digit = self.buttonDigit {
                Text("\(digit)")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
            }
            else if let symbol = self.sfSymbol {
                Image(systemSymbol: symbol)
                    .font(.largeTitle)
                    .foregroundColor(.primary)
            }
        }
    }
    
    var body: some View {
        
        Button(action: self.action) {
            ZStack {
                
                Circle()
                    .fill(Color.primary)
                    .frame(width: 105, height: 105)
                
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 100, height: 100)
                    
                self.buttonContent
                
            }
        }
        
    }
    
}

struct NumberPadButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            NumberPadButtonView(1, result: Binding<String>(get: { return "1" }, set: { let _ = $0 }))
            NumberPadButtonView(.xmark, result: Binding<String>(get: { return "X" }, set: { let _ = $0 }))
        }
    }
}
