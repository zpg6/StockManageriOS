//
//  ItemDetailContainer.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/25/20.
//

import SwiftUI

struct ItemDetailContainer: View {
    
    @Binding var image: UIImage?
    @Binding var sheet: DisplaySheet
    
    @Binding var controlWindow: ControlWindow
    @Binding var unsavedChanges: Bool
    @Binding var associatedItem: InventoryItem
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
                            else {
                                self.sheet = .results
                            }
                        }
                        Spacer()
                        if self.unsavedChanges {
                            Button("Save") {
                                self.controlWindow.purpose = .saveChangesPrompt
                                self.controlWindow.state = .open
                            }
                        }
                    }
                    
                    ItemDetailMainPanel(image: self.$image, item: self.$associatedItem, unsavedChanges: self.$unsavedChanges)
                    
                }.padding(20)
                .background(Color(.systemGray6))
                .padding(5)
                
                Divider()
                
                VStack {
                    
                    Text("Locations (\(self.associatedItem.locations.count))")
                        .font(.largeTitle)
                        .bold()
                    
                    ForEach(0..<self.associatedItem.locations.count, id:\.self) { i in
                        
                        VStack {
                            
                            ItemDetailLocationPanel(location:
                                                        Binding<Location>(get: {return self.associatedItem.locations[i]}, set: {self.associatedItem.locations[i] = $0}))
                            
                            if !self.associatedItem.locations[i].description.isEmpty {
                                VStack {
                                    HStack {
                                        Text("More Details:").bold()
                                        Spacer()
                                        Button(action: {
                                            self.controlWindow.purpose = .editDescription
                                            self.associatedItemLocationIndex = i
                                            self.controlWindow.state = .open
                                        }) {
                                            Image(systemName: "pencil")
                                                .resizable()
                                                .foregroundColor(.primary)
                                                .frame(width: 25, height: 25)
                                        }
                                    }
                                    
                                    Text(self.associatedItem.locations[i].description)
                                }
                            } else {
                                TextButton("+ More Details", textColor: .black, grad: Gradient.SM) {
                                    self.associatedItemLocationIndex = i
                                    self.controlWindow.purpose = .editDescription
                                    self.controlWindow.state = .open
                                    print(self.associatedItem)
                                    print(self.associatedItemLocationIndex)
                                }
                            }
                            
                            TextButton("Move Location", textColor: .white, grad: Gradient.blue) {
                                self.associatedItemLocationIndex = i
                                self.controlWindow.purpose = .editLocation
                                self.controlWindow.state = .open
                                print(self.associatedItem)
                                print(self.associatedItemLocationIndex)
                            }
                            
                            TextButton("Remove Location", textColor: .white, grad: Gradient.red) {
                                self.associatedItemLocationIndex = i
                                self.controlWindow.purpose = .removeLocationPrompt
                                self.controlWindow.state = .open
                                print(self.associatedItem)
                                print(self.associatedItemLocationIndex)
                            }
                            
                            Divider().padding()
                        }
                        
                        
                    }
                    
                    TextButton("+ Add Location", textColor: .black, grad: Gradient.green) {
                        self.associatedItem.locations.append(Location.newLocation)
                        self.associatedItemLocationIndex = (self.associatedItem.locations.count) - 1
                        self.controlWindow.purpose = .addLocation
                        self.controlWindow.state = .open
                    }
                    
                }
                
                
                
                Spacer()
            }.padding(20)
        }
    }
}
