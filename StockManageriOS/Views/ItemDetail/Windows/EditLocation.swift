//
//  EditLocation.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI

struct EditLocation: View {
    
    @Binding var controlWindow: ControlWindow
    @Binding var unsavedChanges: Bool
    @Binding var associatedItem: InventoryItem
    @Binding var associatedItemLocationIndex: Int
    
    @State var locationBackup: Location? = nil
    @State var itemBackup: InventoryItem? = nil
    
    let spacing: CGFloat = 15
    
    let letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    var body: some View {
    
        VStack {
            
            VStack {
                Text("Aisle").font(.headline).bold()
                if self.associatedItem.locations[associatedItemLocationIndex].aisle != "" {
                    HStack (spacing: self.spacing) {
                        NumberPadButtonIsolated(display: "minus", small: true, action: {
                            self.prevAisle()
                        })
                        Text("\(self.associatedItem.locations[self.associatedItemLocationIndex].aisle)").font(.headline).bold().padding()
                        NumberPadButtonIsolated(display: "plus", small: true, action: {
                            self.nextAisle()
                        })
                    }.padding(5)
                } else {
                    AddFieldButton {
                        self.associatedItem.locations[associatedItemLocationIndex].aisle = "1"
                    }
                }
            }.padding(5)
            
            VStack {
                Text("Aisle Section").font(.headline).bold()
                if !self.associatedItem.locations[associatedItemLocationIndex].aisleSection.isEmpty {
                    HStack (spacing: self.spacing) {
                        NumberPadButtonIsolated(display: "minus", small: true, action: {
                            self.prevAisleSection()
                        })
                        Text("\(self.associatedItem.locations[self.associatedItemLocationIndex].aisleSection)").font(.headline).bold().padding()
                        NumberPadButtonIsolated(display: "plus", small: true, action: {
                            self.nextAisleSection()
                        })
                    }.padding(5)
                } else {
                    AddFieldButton {
                        self.associatedItem.locations[associatedItemLocationIndex].aisleSection = "A"
                    }
                }
            }.padding(5)
            
            VStack {
                Text("Spot").font(.headline).bold()
                if !self.associatedItem.locations[associatedItemLocationIndex].spot.isEmpty {
                    HStack (spacing: self.spacing) {
                        NumberPadButtonIsolated(display: "minus", small: true, action: {
                            self.prevSpot()
                        })
                        Text("\(self.associatedItem.locations[self.associatedItemLocationIndex].spot)").font(.headline).bold().padding()
                        NumberPadButtonIsolated(display: "plus", small: true, action: {
                            self.nextSpot()
                        })
                    }.padding(5)
                } else {
                    AddFieldButton {
                        self.associatedItem.locations[associatedItemLocationIndex].spot = "1"
                    }
                }
            }.padding(5)
            
            VStack {
                Text("Type").font(.headline).bold()
                HStack (spacing: self.spacing) {
                    NumberPadButtonIsolated(display: "arrow.left", small: true, action: {
                        self.prevType()
                    })
                    Text("\(self.associatedItem.locations[self.associatedItemLocationIndex].type.rawValue)").font(.headline).bold().padding()
                    NumberPadButtonIsolated(display: "arrow.right", small: true, action: {
                        self.nextType()
                    })
                }.padding(5)
            }.padding(5)
            
            VStack {
                Text("Accessibility").font(.headline).bold()
                HStack (spacing: self.spacing) {
                    NumberPadButtonIsolated(display: "arrow.left", small: true, action: {
                        self.prevAccessibility()
                    })
                    Text("\(self.associatedItem.locations[self.associatedItemLocationIndex].accessibility.rawValue)").font(.headline).bold().padding()
                    NumberPadButtonIsolated(display: "arrow.right", small: true, action: {
                        self.nextAccessibility()
                    })
                }.padding(5)
            }.padding(5)
            
            TextButton("Done", textColor: .white, grad: Gradient.green) {
                if self.controlWindow.purpose == .addLocation {
                    self.unsavedChanges = true
                }
                self.controlWindow.state = .closed
            }
            
            TextButton("Cancel", textColor: .white, grad: Gradient.red) {
                if let backup = self.locationBackup {
                    self.associatedItem.locations[self.associatedItemLocationIndex] = backup
                }
                self.controlWindow.state = .closed
            }
            
        }
        
    }
    
    
    func nextAisle() {
        let numberString = self.associatedItem.locations[self.associatedItemLocationIndex].aisle
        if let number = Int64(numberString) {
            if number >= 100 {
                self.associatedItem.locations[self.associatedItemLocationIndex].aisle = "1"
            } else {
                self.associatedItem.locations[self.associatedItemLocationIndex].aisle = "\(number+1)"
            }
            self.unsavedChanges = true
        }
    }
    
    func prevAisle() {
        let numberString = self.associatedItem.locations[self.associatedItemLocationIndex].aisle
        if let number = Int64(numberString) {
            if number <= 1 {
                self.associatedItem.locations[self.associatedItemLocationIndex].aisle = "100"
            } else {
                self.associatedItem.locations[self.associatedItemLocationIndex].aisle = "\(number-1)"
            }
            self.unsavedChanges = true
        }
    }
    
    func nextAisleSection() {
        if self.associatedItem.locations[self.associatedItemLocationIndex].aisleSection == "Z" {
            self.associatedItem.locations[self.associatedItemLocationIndex].aisleSection = "A"
            self.unsavedChanges = true
            return
        }
        for i in 0..<self.letters.count {
            if self.associatedItem.locations[self.associatedItemLocationIndex].aisleSection == self.letters[i] {
                print ("i=\(i), letters[i]=\(letters[i]), letters[i+1]=\(letters[i+1])")
                self.associatedItem.locations[self.associatedItemLocationIndex].aisleSection = self.letters[i+1]
                self.unsavedChanges = true
                return
            }
        }
    }
    
    func prevAisleSection() {
        if self.associatedItem.locations[self.associatedItemLocationIndex].aisleSection == "A" {
            self.associatedItem.locations[self.associatedItemLocationIndex].aisleSection = "Z"
            self.unsavedChanges = true
            return
        }
        for i in 0..<self.letters.count {
            if self.associatedItem.locations[self.associatedItemLocationIndex].aisleSection == self.letters[i] {
                self.associatedItem.locations[self.associatedItemLocationIndex].aisleSection = self.letters[i-1]
                self.unsavedChanges = true
                return
            }
        }
    }
    
    func nextSpot() {
        let numberString = self.associatedItem.locations[self.associatedItemLocationIndex].spot
        if let number = Int64(numberString) {
            if number >= 100 {
                self.associatedItem.locations[self.associatedItemLocationIndex].spot = "1"
            } else {
                self.associatedItem.locations[self.associatedItemLocationIndex].spot = "\(number+1)"
            }
            self.unsavedChanges = true
        }
    }
    
    func prevSpot() {
        let numberString = self.associatedItem.locations[self.associatedItemLocationIndex].spot
        if let number = Int64(numberString) {
            if number <= 1 {
                self.associatedItem.locations[self.associatedItemLocationIndex].spot = "100"
            } else {
                self.associatedItem.locations[self.associatedItemLocationIndex].spot = "\(number-1)"
            }
            self.unsavedChanges = true
        }
    }
    
    func nextType() {
        if self.associatedItem.locations[self.associatedItemLocationIndex].type == LocationType.all().last {
            self.associatedItem.locations[self.associatedItemLocationIndex].type = LocationType.all().first ?? LocationType.unknown
            self.unsavedChanges = true
            return
        }
        for i in 0..<LocationType.all().count {
            if self.associatedItem.locations[self.associatedItemLocationIndex].type == LocationType.all()[i] {
                self.associatedItem.locations[self.associatedItemLocationIndex].type = LocationType.all()[i+1]
                self.unsavedChanges = true
                return
            }
        }
    }
    
    func prevType() {
        if self.associatedItem.locations[self.associatedItemLocationIndex].type == LocationType.all().first {
            self.associatedItem.locations[self.associatedItemLocationIndex].type = LocationType.all().last ?? LocationType.unknown
            self.unsavedChanges = true
            return
        }
        for i in 0..<LocationType.all().count {
            if self.associatedItem.locations[self.associatedItemLocationIndex].type == LocationType.all()[i] {
                self.associatedItem.locations[self.associatedItemLocationIndex].type = LocationType.all()[i-1]
                self.unsavedChanges = true
                return
            }
        }
    }
    
    func nextAccessibility() {
        if self.associatedItem.locations[self.associatedItemLocationIndex].accessibility == Accessibility.all.last {
            self.associatedItem.locations[self.associatedItemLocationIndex].accessibility = Accessibility.all.first ?? Accessibility.unprocessed
            self.unsavedChanges = true
            return
        }
        for i in 0..<Accessibility.all.count {
            if self.associatedItem.locations[self.associatedItemLocationIndex].accessibility == Accessibility.all[i] {
                self.associatedItem.locations[self.associatedItemLocationIndex].accessibility = Accessibility.all[i+1]
                self.unsavedChanges = true
                return
            }
        }
    }
    
    func prevAccessibility() {
        if self.associatedItem.locations[self.associatedItemLocationIndex].accessibility == Accessibility.all.first {
            self.associatedItem.locations[self.associatedItemLocationIndex].accessibility = Accessibility.all.last ?? Accessibility.unprocessed
            self.unsavedChanges = true
            return
        }
        for i in 0..<Accessibility.all.count {
            if self.associatedItem.locations[self.associatedItemLocationIndex].accessibility == Accessibility.all[i] {
                self.associatedItem.locations[self.associatedItemLocationIndex].accessibility = Accessibility.all[i-1]
                self.unsavedChanges = true
                return
            }
        }
    }
    
}

