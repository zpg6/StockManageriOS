//
//  ItemDetailMainPanel.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI

struct ItemDetailMainPanel: View {
    
    @Binding var image: UIImage?
    @Binding var item: InventoryItem
    
    var body: some View {
        
        VStack {
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
                Text(self.item.name)
            }
            HStack {
                Text("ID:").bold()
                Spacer()
                Text(self.item.userDesignatedID)
            }
            HStack {
                Text("Customer-Accessible:").bold()
                Spacer()
                Text("Backstock:").bold()
            }
            HStack {
                HStack {
                    Spacer()
                    NumberPadButtonIsolated(display: "minus", small: true, action: {
                        if (self.item.customerAccessibleQuantity ?? 0) > 0 {
                            self.item.customerAccessibleQuantity? -= 1
                        }
                    })
                    Text("\(self.item.customerAccessibleQuantity ?? 0)").font(.title).bold().padding()
                    NumberPadButtonIsolated(display: "plus", small: true, action: {
                        self.item.customerAccessibleQuantity? += 1
                    })
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    NumberPadButtonIsolated(display: "minus", small: true, action: {
                        if (self.item.backstockQuantity ?? 0) > 0 {
                            self.item.backstockQuantity? -= 1
                        }
                    })
                    Text("\(self.item.backstockQuantity ?? 0)").font(.title).bold().padding()
                    NumberPadButtonIsolated(display: "plus", small: true, action: {
                        self.item.backstockQuantity? += 1
                    })
                    Spacer()
                }
            }
        }
        
    }
}
