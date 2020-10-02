//
//  EditDescription.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI

struct EditDescription: View {
    
    @Binding var controlWindow: ControlWindow
    @Binding var unsavedChanges: Bool
    @Binding var associatedItem: InventoryItem
    @Binding var associatedItemLocationIndex: Int
    
    @State var locationBackup: Location? = nil
    @State var itemBackup: InventoryItem? = nil
    
    var body: some View {
        
        VStack {
            
            Text("Edit Description").font(.title)
            
            SMTextField("Location Description", text: Binding<String>(
                                                get: {
                                                    return self.associatedItem.locations[self.associatedItemLocationIndex].description
                                                },
                                                set: {
                                                    self.associatedItem.locations[self.associatedItemLocationIndex].description = $0
                                                }
            )).onDisappear {
                if let backup = self.locationBackup {
                    if self.associatedItem.locations[self.associatedItemLocationIndex].description != backup.description {
                        self.unsavedChanges = true
                    }
                }
            }
            
            TextButton("Done", textColor: .white, grad: Gradient.green) {
                if let backup = self.locationBackup {
                    if self.associatedItem.locations[self.associatedItemLocationIndex].description != backup.description {
                        self.unsavedChanges = true
                    }
                }
                self.controlWindow.state = .closed
            }
            
            TextButton("Cancel", textColor: .white, grad: Gradient.red) {
                if let backup = self.locationBackup {
                    self.associatedItem.locations[self.associatedItemLocationIndex].description = backup.description
                }
                self.controlWindow.state = .closed
            }
        }.onAppear {
            if self.associatedItemLocationIndex != -1 {
                self.locationBackup = self.associatedItem.locations[self.associatedItemLocationIndex]
            }
        }
        
    }
}
