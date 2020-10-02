//
//  SMTextField.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import SwiftUI

struct SMTextField: View {
    let title: String
    @Binding var text: String
    @State var type: UIKeyboardType? = nil
    
    init(_ title: String, text: Binding<String>, type: UIKeyboardType? = nil) {
        self.title = title
        self._text = text
        self.type = type
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).cornerRadius(8)
            TextField(self.title, text: self.$text)
            .foregroundColor(.primary)
            .font(.headline)
            .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.primary, lineWidth: 3)
                        .frame(maxHeight: 100)
                )
        }
    }
}

