//
//  ItemDetailContainer.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/25/20.
//

import SwiftUI

struct ItemDetailContainer: View {
    
    @Binding var item: InventoryItem?
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
            Image(systemName: "photo.fill")
            Text(self.unwrappedItem.name)
            Text(self.unwrappedItem.id)
            Text(self.unwrappedItem.userDesignatedID)
            Spacer()
        }.padding(20)
    }
}
