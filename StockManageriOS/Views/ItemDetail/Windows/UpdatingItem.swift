//
//  UpdatingItem.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI

struct UpdatingItem: View {
    
    @Binding var controlWindow: ControlWindow
    @State var status = "Updating Item"
    @State var error = false
    
    var body: some View {
        VStack {
            Text(self.status)
                .onAppear {
                    NotificationCenter.default.addObserver(forName: NSNotification.Name.updateItemResult, object: nil, queue: .main) { _ in
                        if API.main.updateItemError != "" {
                            self.error = true
                            self.status = API.main.updateItemError
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            self.controlWindow.state = .closed
                        }
                    }
                }
            if self.error {
                Text("Please try again.")
            }
        }
    }
}
