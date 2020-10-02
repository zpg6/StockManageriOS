//
//  SearchResults.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/22/20.
//

import Foundation
import SwiftUI

struct SearchResults: View {
    
    @Binding var itemIDQueryString: String
    @Binding var itemNameQueryString: String
    @State var image: UIImage? = nil
    @State var sheet: DisplaySheet = .results
    @State var error: String = ""
    @State var items: [InventoryItem] = []
    @State var images: [String:UIImage] = [:]
    
    @State var controlWindow: ControlWindow = ControlWindow(state: .closed, purpose: .none)
    @State var unsavedChanges: Bool = false
    @State var associatedItem: InventoryItem = InventoryItem()
    @State var associatedItemLocationIndex: Int = -1
    
    func itemStringForIndex(_ index: Int) -> String {
        return self.items[index].name
    }
    
    var body: some View {
        ZStack {
            ScrollView (.vertical) {
                Text("You searched for:")
                Text(itemIDQueryString)
                    .font(.largeTitle)
                Divider().padding()
                Text("Results:").font(.title)
                
                if self.items.count > 0 {
                    ForEach(0..<self.items.count, id:\.self) { itemIndex in
                        VStack {
                            HStack {
                                
                                if self.images.keys.contains(self.items[itemIndex].id) {
                                    Image(uiImage: self.images[self.items[itemIndex].id] ?? UIImage())
                                } else {
                                    Image(systemName: "\(itemIndex+1).circle.fill").foregroundColor(.blue)
                                }
                                
                                Text(self.itemStringForIndex(itemIndex)).bold()
                            }
                            .padding()
                            .onTapGesture {
                                self.associatedItem = self.items[itemIndex]
                                self.sheet = .detail
                            }
                            Divider()
                        }
                    }
                } else if self.error.count > 0 {
                    Text(self.error).bold().padding()
                }
            }
                .padding(.vertical,50)
                .onAppear {
                    if let storeID = API.main.user?.storeID {
                        if self.itemIDQueryString != "" {
                            API.retrieveItems(withUserDesignatedID: self.itemIDQueryString, storeID: storeID)
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
                        else if self.itemNameQueryString != "" {
                            API.retrieveItems(withName: self.itemNameQueryString, storeID: storeID)
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
            
            if self.sheet == .detail {
                Color(.systemBackground).edgesIgnoringSafeArea(.all)
                ItemDetailContainer(image:
                                        Binding<UIImage?>(
                                            get: {
                                                if let image = self.images[self.associatedItem.id] {
                                                    return image
                                                }
                                                return nil
                                            },
                                            set: {
                                                let _ = $0
                                            }
                                    ), sheet: self.$sheet,
                                    controlWindow: self.$controlWindow,
                                    unsavedChanges: self.$unsavedChanges,
                                    associatedItem: self.$associatedItem,
                                    associatedItemLocationIndex: self.$associatedItemLocationIndex
                )
                .onDisappear {
                    if self.unsavedChanges {
                        self.controlWindow.purpose = .saveChangesPrompt
                        self.controlWindow.state = .open
                    }
                }
            }
            
            if self.controlWindow.state == .open && self.associatedItem.id != "" {
                
                ItemDetailControlWindow(controlWindow: self.$controlWindow, unsavedChanges: self.$unsavedChanges,
                                        associatedItem: self.$associatedItem, associatedItemLocationIndex: self.$associatedItemLocationIndex)
                
            }
            
        }
    }
    
}
