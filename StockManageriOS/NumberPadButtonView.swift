//
//  NumberPadButtonView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/21/20.
//

import Foundation
import SwiftUI

// A struct representing the main number pad view
struct NumberPadButtonView: View {
    
    let buttonText: String?
    let buttonIcon: String?
    let action: ButtonAction
    
    @State private var timer: Timer?
    @State private var isLongPressing: Bool = false
    
    typealias ButtonAction = ()->()
    
    init(buttonText: String? = nil, buttonIcon: String? = nil, action: @escaping ButtonAction) {
        self.buttonText = buttonText
        self.buttonIcon = buttonIcon
        self.action = action
    }
    
    func wrappedAction() {
        print("spot 1")
        if self.isLongPressing {
            print("spot 2")
            self.isLongPressing.toggle()
            self.timer?.invalidate()
        }
        else {
            print("spot 3")
            self.action()
        }
    }
    
    var body: some View {
        
        Button(action: self.wrappedAction) {
            ZStack {
                
                Circle()
                    .fill(Color.primary)
                    .frame(width: 105, height: 105)
                
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 100, height: 100)
                    
                if self.buttonText != nil {
                    Text(self.buttonText ?? "")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                }
                else if self.buttonIcon != nil {
                    Image(systemName: buttonIcon ?? "")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                }
            }
        }.simultaneousGesture(LongPressGesture(minimumDuration: 0.5).onEnded({ (_) in
            self.isLongPressing = true
            print("spot 4")
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true, block: { (_) in
                self.action()
                print("spot 5")
            })
        }))
        
    }
    
}

struct NumberPadButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            NumberPadButtonView(buttonText: "1") {
                print("1")
            }
            NumberPadButtonView(buttonIcon: "xmark") {
                print("xmark")
            }
        }
    }
}
