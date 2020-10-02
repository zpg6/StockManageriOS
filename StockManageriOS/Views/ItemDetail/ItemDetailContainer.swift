//
//  ItemDetailContainer.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/25/20.
//

import SwiftUI

struct ItemDetailContainer: View {
    
    
    @Binding var item: InventoryItem
    @Binding var image: UIImage?
    @Binding var sheet: DisplaySheet
    
    @Binding var controlWindow: ControlWindow
    @Binding var unsavedChanges: Bool
    @Binding var associatedItem: InventoryItem?
    @Binding var associatedItemLocationIndex: Int
    
    
    
    let grad = Gradient(colors: [.blue,.blue])
    
    var body: some View {
        ZStack {
            ScrollView (.vertical, showsIndicators: false) {
                
                VStack {
                    HStack {
                        Button("Back") {
                            if self.unsavedChanges {
                                self.controlWindow.purpose = .saveChangesPrompt
                                self.controlWindow.state = .open
                            }
                        }
                        Spacer()
                    }
                    
                    ItemDetailMainPanel(image: self.$image, item: self.$item)
                    
                }.padding(20)
                .background(Color(.systemGray6))
                .padding(5)
                
                Divider()
                
                VStack {
                    
                    Text("Locations (\(self.item.locations.count))")
                        .font(.largeTitle)
                        .bold()
                    
                    ForEach(0..<self.item.locations.count, id:\.self) { i in
                        
                        VStack {
                            
                            ItemDetailLocationPanel(location:
                                                        Binding<Location>(get: {return self.item.locations[i]}, set: {self.item.locations[i] = $0}))
                            
                            if !self.item.locations[i].description.isEmpty {
                                VStack {
                                    HStack {
                                        Text("More Details:").bold()
                                        Spacer()
                                        Button(action: {
                                            self.controlWindow.purpose = .editDescription
                                            self.associatedItem = self.item
                                            self.associatedItemLocationIndex = i
                                            self.controlWindow.state = .open
                                        }) {
                                            Image(systemName: "pencil")
                                                .resizable()
                                                .foregroundColor(.primary)
                                                .frame(width: 25, height: 25)
                                        }
                                    }
                                    
                                    Text(self.item.locations[i].description)
                                }
                            } else {
                                TextButton("+ More Details", textColor: .black, grad: Gradient.SM) {
                                    self.controlWindow.purpose = .editDescription
                                    self.associatedItem = self.item
                                    self.associatedItemLocationIndex = i
                                    self.controlWindow.state = .open
                                }
                            }
                            
                            TextButton("Move Location", textColor: .white, grad: Gradient.blue) {
                                self.controlWindow.purpose = .editLocation
                                self.associatedItem = self.item
                                self.associatedItemLocationIndex = i
                                self.controlWindow.state = .open
                            }
                            
                            TextButton("Remove Location", textColor: .white, grad: Gradient.red) {
                                self.controlWindow.purpose = .removeLocation
                                self.associatedItem = self.item
                                self.associatedItemLocationIndex = i
                                self.controlWindow.state = .open
                            }
                            
                            Divider().padding()
                        }
                        
                        
                    }
                    
                    TextButton("+ Add Location", textColor: .black, grad: Gradient.green) {
                        self.item.locations.append(Location.newLocation)
                        self.controlWindow.purpose = .editLocation
                        self.associatedItem = self.item
                        self.associatedItemLocationIndex = (self.item.locations.count) - 1
                        self.controlWindow.state = .open
                    }
                    
                }
                
                
                
                Spacer()
            }.padding(20)
        }
    }
}
