//
//  NumberPadView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/21/20.
//

import SwiftUI
import SFSafeSymbols

/// a view representing a number pad with integers 0-9 and
/// a delete and submit button using SF Icons (Apple-provided system icons)
/// already installed on all iOS 13.0+ devices (our target anyways for SwiftUI compatibility)
struct NumberPadView: View {
    
    /// spacing between each number pad button, used vertically
    /// and horizontally
    let spacing: CGFloat = 15
    
    /// the variable containing the typed string of numbers
    @Binding var typed: String
    
    /// a boolean determining whether the results screen is open
    /// this is used by the 'Enter' button (arrow pointing right)
    @Binding var showResults: Bool
    
    /// Formatted string that contains what has been typed by the number pad
    var queryDisplay: some View {
        Text(" \(self.typed) ")
            .font(.largeTitle)
            .bold()
            .foregroundColor(.primary)
    }
    
    /// Private class to keep icon raw values with short variable names
    /// making them more inclined to fit in the double-nested array below
    private class I {
        static let x: String = SFSymbol.xmark.rawValue
        static let e: String = SFSymbol.arrowRight.rawValue
    }
    
    /// The  buttons in the number pad, displaying  how they will on screen
    let rows: [[String]] =  [    [ "1", "2", "3"],
                                [ "4", "5", "6"],
                                [ "7", "8", "9"],
                                [ I.x, "0", I.e],
                            ]
    
    /// The double nested forEach that loops over each row, then each item in those rows
    /// and produces a NumberPadButtonView for each
    var buttons: some View {
        ForEach(rows, id: \.self) { row in
            HStack(spacing: self.spacing) {
                ForEach(row, id: \.self) { item in
                    ZStack {
                        NumberPadButtonView(display: item, resultString: self.$typed, showResults: self.$showResults)
                    }
                }
            }
        }
    }
    
    /// The main view of the NumberPad
    var body: some View {
        
        VStack (spacing: self.spacing) {
            
            self.queryDisplay
            
            self.buttons
            
        }
    }
}

