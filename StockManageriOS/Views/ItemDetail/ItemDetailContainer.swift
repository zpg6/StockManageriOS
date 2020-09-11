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
    
    var body: some View {
        ScrollView (.vertical) {
            HStack {
                Button("Back") { self.sheet = .results }
                Spacer()
            }
            if self.image != nil {
                Image(uiImage: self.image ?? UIImage())
            } else {
                Image(systemName: "photo.fill").foregroundColor(.blue)
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
                Text("Total In-Store Qty:").bold()
                Spacer()
                Text("\(self.unwrappedItem.totalInStoreQuantity ?? 0)")
            }
            Spacer()
        }.padding(20)
    }
}
