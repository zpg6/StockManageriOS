//
//  SearchResults.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/22/20.
//

import Foundation
import SwiftUI

struct SearchResults: View {
    
    let searchString: String
    @State var error: String = ""
    @State var items: [InventoryItem] = []
    
    func itemStringForIndex(_ index: Int) -> String {
        return self.items[index].name
    }
    
    var body: some View {
        ScrollView (.vertical) {
            Text("You searched for:")
            Text(searchString)
                .font(.largeTitle)
            Divider()
            Text("Results:")
            if self.items.count > 0 {
                ForEach(0..<self.items.count, id:\.self) { itemIndex in
                    HStack {
                        Image(systemName: "\(itemIndex+1).circle.fill").foregroundColor(.blue)
                        Text(self.itemStringForIndex(itemIndex)).bold()
                    }
                }
            } else if self.error.count > 0 {
                Text(self.error).bold().padding()
            }
        }.padding(.vertical,50).onAppear {
            if let storeID = API.main.user?.storeID {
                API.retrieveItems(withUserDesignatedID: self.searchString, storeID: storeID)
                NotificationCenter.default.addObserver(forName: NSNotification.Name.itemRetrievalResult, object: nil, queue: .main) { (_) in
                    self.items = API.main.itemQueryResult
                    self.error = API.main.itemQueryError
                }
            }
        }
    }
    
}
