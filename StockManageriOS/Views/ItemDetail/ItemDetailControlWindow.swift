//
//  ItemDetailControlWindow.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI

struct ItemDetailControlWindow: View {
    
    @Binding var controlWindow: ControlWindow
    @Binding var unsavedChanges: Bool
    @Binding var associatedItem: InventoryItem
    @Binding var associatedItemLocationIndex: Int
    
    @State var locationBackup: Location? = nil
    @State var itemBackup: InventoryItem? = nil
    
    
    var body: some View {
        
        ZStack {
            Color.white.opacity(0.3).edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    if self.unsavedChanges {
                        self.controlWindow.purpose = .saveChangesPrompt
                        self.controlWindow.state = .open
                    } else {
                        self.controlWindow.state = .closed
                    }
                }
            
            VStack {
                
                if self.controlWindow.purpose == .addLocation || self.controlWindow.purpose == .editLocation {
                    EditLocation(controlWindow: self.$controlWindow, unsavedChanges: self.$unsavedChanges, associatedItem: self.$associatedItem, associatedItemLocationIndex: self.$associatedItemLocationIndex)
                }
                
                if self.controlWindow.purpose == .editDescription {
                    EditDescription(controlWindow: self.$controlWindow, unsavedChanges: self.$unsavedChanges, associatedItem: self.$associatedItem, associatedItemLocationIndex: self.$associatedItemLocationIndex)
                }
                
                if self.controlWindow.purpose == .removeDescriptionPrompt {
                    RemoveDescriptionPrompt(controlWindow: self.$controlWindow, unsavedChanges: self.$unsavedChanges, associatedItem: self.$associatedItem, associatedItemLocationIndex: self.$associatedItemLocationIndex)
                }
                
                if self.controlWindow.purpose == .saveChangesPrompt {
                    SaveChangesPrompt(controlWindow: self.$controlWindow, unsavedChanges: self.$unsavedChanges, associatedItem: self.$associatedItem, associatedItemLocationIndex: self.$associatedItemLocationIndex)
                }
                
                if self.controlWindow.purpose == .removeLocationPrompt {
                    RemoveLocationPrompt(controlWindow: self.$controlWindow, unsavedChanges: self.$unsavedChanges, associatedItem: self.$associatedItem, associatedItemLocationIndex: self.$associatedItemLocationIndex)
                }
                
                
            }
            .padding(20)
            .background(Color.black)
            .padding(.horizontal, 20)
        }
        
        .onAppear {
            self.itemBackup = self.associatedItem
            if self.associatedItemLocationIndex != -1 {
                self.locationBackup = self.associatedItem.locations[self.associatedItemLocationIndex]
            }
        }
        
        
        
    }
}
