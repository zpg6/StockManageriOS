//
//  AddFieldButton.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI

struct AddFieldButton: View {
    
    let text: String = "Add"
    let textColor: Color = Color.white
    let grad: Gradient = Gradient.blue
    let action: ()->Void
    
    init(_ action: @escaping ()->Void) {
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(text)
            .font(.headline)
            .foregroundColor(textColor)
            .padding(12)
            .background(
                LinearGradient(gradient: grad, startPoint: .top, endPoint: .bottom)
            )
        }.cornerRadius(8)
        .padding()
    }
}

