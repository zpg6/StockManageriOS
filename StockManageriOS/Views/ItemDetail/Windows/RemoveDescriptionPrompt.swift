//
//  RemoveDescriptionPrompt.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI

struct RemoveDescriptionPrompt: View {
    
    @Binding var controlWindow: ControlWindow
    @Binding var unsavedChanges: Bool
    @Binding var associatedItem: InventoryItem
    @Binding var associatedItemLocationIndex: Int
    
    @State var locationBackup: Location? = nil
    @State var itemBackup: InventoryItem? = nil
    
    var body: some View {
        VStack {
            
            Text("Remove Description?").font(.title)
            
            TextButton("Yes", textColor: .white, grad: Gradient.green) {
                self.associatedItem.locations[self.associatedItemLocationIndex].description = ""
                self.unsavedChanges = true
                self.controlWindow.state = .closed
            }
            
            TextButton("No", textColor: .white, grad: Gradient.red) {
                self.controlWindow.state = .closed
            }
            
        }
    }
}

