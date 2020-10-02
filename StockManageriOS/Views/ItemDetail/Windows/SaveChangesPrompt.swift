//
//  SaveChangesPrompt.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI

struct SaveChangesPrompt: View {
    
    @Binding var controlWindow: ControlWindow
    @Binding var unsavedChanges: Bool
    @Binding var associatedItem: InventoryItem
    @Binding var associatedItemLocationIndex: Int
    
    @State var locationBackup: Location? = nil
    @State var itemBackup: InventoryItem? = nil
    
    var body: some View {
        
        VStack {
            
            Text("Save item changes?").font(.title)
            
            TextButton("Yes", textColor: .white, grad: Gradient.green) {
                API.updateItem(item: self.associatedItem)
                self.controlWindow.purpose = .updateItemLoading
                #warning("update item on endpoint and update in item cache")
                self.unsavedChanges = false
                self.controlWindow.state = .closed
            }
            
            TextButton("No", textColor: .white, grad: Gradient.red) {
                if let backup = self.itemBackup {
                    self.associatedItem = backup
                }
                self.unsavedChanges = false
                self.controlWindow.state = .closed
            }
            
        }
        
    }
}
