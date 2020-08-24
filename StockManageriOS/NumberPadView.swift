//
//  NumberPadView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/21/20.
//

import SwiftUI
import SFSafeSymbols

struct NumberPadView: View {
    
    let spacing: CGFloat = 15
    @State var typed = ""
    @State var showResults = false
    
    let rows: [Int:[AnyHashable]] = [     1:[1,2,3],
                                         2:[4,5,6],
                                         3:[7,8,9],
                                         4:[SFSymbol.xmark,0,SFSymbol.arrowRight]
                                  ]
    
    
    var body: some View {
        
        VStack (spacing: self.spacing) {
            
            Text(" \(self.typed) ")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primary)
            
            ForEach(rows.keys.map({$0}), id: \.self) { row in
                ForEach(rows[row]!, id: \.self) { item in
                    NumberPadButtonView(item, result: self.$typed)
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
