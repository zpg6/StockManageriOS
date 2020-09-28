//
//  ItemDetailContainer.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/25/20.
//

import SwiftUI

struct ItemDetailContainer: View {
    
    @Binding var item: InventoryItem?
    @Binding var image: UIImage?
    @Binding var sheet: DisplaySheet
    
    
    var unwrappedItem: InventoryItem {
        if let unwrapped = self.item {
            return unwrapped
        } else {
            return InventoryItem(name: "Error")
        }
    }
    
    let grad = Gradient(colors: [.blue,.blue])
    
    var body: some View {
        ScrollView (.vertical) {
            
            VStack {
                HStack {
                    Button("Back") { self.sheet = .results }
                    Spacer()
                }
                if self.image != nil {
                    Image(uiImage: self.image ?? UIImage())
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                }
                HStack {
                    Text("Name:").bold()
                    Spacer()
                    Text(self.unwrappedItem.name)
                }
                HStack {
                    Text("ID:").bold()
                    Spacer()
                    Text(self.unwrappedItem.userDesignatedID)
                }
                HStack {
                    Text("Customer-Accessible Qty:").bold()
                    Spacer()
                    
                }
                HStack {
                    Spacer()
                    NumberPadButtonIsolated(display: "minus", small: true, action: {
                        
                    })
                    Text("\(self.unwrappedItem.customerAccessibleQuantity ?? 0)").font(.title).bold().padding()
                    NumberPadButtonIsolated(display: "plus", small: true, action: {
                        
                    })
                    Spacer()
                }
                
                HStack {
                    Text("Backstock Qty:").bold()
                    Spacer()
                    
                }
                HStack {
                    Spacer()
                    NumberPadButtonIsolated(display: "minus", small: true, action: {
                        
                    })
                    Text("\(self.unwrappedItem.backstockQuantity ?? 0)").font(.title).bold().padding()
                    NumberPadButtonIsolated(display: "plus", small: true, action: {
                        
                    })
                    Spacer()
                }
                
                
            }.padding(.vertical,20)
            
            
            
            VStack {
                
                Text("Locations")
                    .font(.title)
                    .bold()
                
                ForEach(0..<self.unwrappedItem.locations.count, id:\.self) { i in
                    
                    VStack {
                        if !self.unwrappedItem.locations[i].aisle.isEmpty {
                            HStack {
                                Text("Aisle:").bold()
                                Spacer()
                                Text(self.unwrappedItem.locations[i].aisle)
                            }
                        }
                        
                        if !self.unwrappedItem.locations[i].aisleSection.isEmpty {
                            HStack {
                                Text("Aisle Section:").bold()
                                Spacer()
                                Text(self.unwrappedItem.locations[i].aisleSection)
                            }
                        }
                        
                        if !self.unwrappedItem.locations[i].spot.isEmpty {
                            HStack {
                                Text("Spot:").bold()
                                Spacer()
                                Text(self.unwrappedItem.locations[i].spot)
                            }
                        }
                        
                        HStack {
                            Text("Type:").bold()
                            Spacer()
                            Text(self.unwrappedItem.locations[i].type.rawValue)
                        }
                        
                        
                        HStack {
                            Text("Accessibility:").bold()
                            Spacer()
                            Text(self.unwrappedItem.locations[i].accessibility.rawValue)
                        }
                        
                        if !self.unwrappedItem.locations[i].description.isEmpty {
                            VStack {
                                HStack {
                                    Text("More Details:").bold()
                                    Spacer()
                                    Button(action: {
                                        
                                    }) {
                                        Image(systemName: "pencil")
                                            .resizable()
                                            .foregroundColor(.primary)
                                            .frame(width: 25, height: 25)
                                    }
                                }
                                
                                Text(self.unwrappedItem.locations[i].description)
                            }
                        } else {
                            TextButton("+ More Details", textColor: .black, grad: Gradient.SM) {
                                
                            }
                        }
                        
                        Divider().padding()
                    }
                }
                
                
                
            }
            
            
            
            Spacer()
        }.padding(20)
    }
}
