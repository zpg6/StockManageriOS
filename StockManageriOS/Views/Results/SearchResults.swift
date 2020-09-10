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
    @Binding var item: InventoryItem?
    @Binding var sheet: DisplaySheet
    @State var error: String = ""
    @State var items: [InventoryItem] = []
    @State var images: [String:UIImage] = [:]
    
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
                        
                        if self.images.keys.contains(self.items[itemIndex].id) {
                            Image(uiImage: self.images[self.items[itemIndex].id] ?? UIImage())
                        } else {
                            Image(systemName: "\(itemIndex+1).circle.fill").foregroundColor(.blue)
                        }
                        
                        Text(self.itemStringForIndex(itemIndex)).bold()
                    }.onTapGesture {
                        self.item = self.items[itemIndex]
                        self.sheet = .detail
                    }
                    Divider()
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
                    
                    for item in self.items {
                        if self.images.keys.contains(item.id) { continue }
                        else if API.main.imageCache.keys.contains(item.id) {
                            self.images[item.id] = API.main.imageCache[item.id]
                        }
                        else {
                            API.retrieveImage(id: item.id)
                        }
                    }
                    NotificationCenter.default.addObserver(forName: NSNotification.Name.imageRetrievalResult, object: nil, queue: .main) { (_) in
                        let ids = self.items.map({$0.id})
                        let cache = API.main.imageCache.filter({ids.contains($0.key)})
                        for image in cache {
                            if !self.images.keys.contains(image.key) {
                                self.images[image.key] = image.value
                            }
                        }
                    }
                }
            }
        }
    }
    
}
