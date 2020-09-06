//
//  SMSecureField.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import SwiftUI

struct SMSecureField: View {
    let title: String
    @Binding var text: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).cornerRadius(8)
            SecureField(self.title, text: self.$text)
            .foregroundColor(.primary)
            .font(.headline)
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.primary, lineWidth: 3))
        }
    }
}
