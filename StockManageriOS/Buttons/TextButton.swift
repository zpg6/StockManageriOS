//
//  TextButton.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import SwiftUI

struct TextButton: View {
    
    let text: String
    let textColor: Color
    let grad: Gradient
    let action: ()->Void
    
    init(_ text: String, textColor: Color, grad: Gradient, action: @escaping ()->Void) {
        self.text = text
        self.textColor = textColor
        self.grad = grad
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
            .frame(width: UIScreen.main.bounds.width - 80)
            .background(
                LinearGradient(gradient: grad, startPoint: .top, endPoint: .bottom)
            )
        }.cornerRadius(8)
        .padding()
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
        TextButton("Text Button", textColor: .white, grad: Gradient(colors: [.blue,Color(.systemIndigo)]), action: {})
    }
}
