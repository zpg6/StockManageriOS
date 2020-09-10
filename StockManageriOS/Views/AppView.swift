//
//  AppView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 9/5/20.
//

import SwiftUI

struct AppView: View {
    
    @State var itemIDQueryString: String = ""
    @State var showQueryResults: Bool = false
    @Binding var user: User?
    @State var sheet: DisplaySheet = .results
    @State var itemDetailed: InventoryItem? = nil
    
    var firstNameWelcome : String {
        if let user = self.user {
            return "Welcome, \(user.firstName)!"
        } else {
            return ""
        }
    }
    
    var body: some View {
        
        VStack {
            if self.firstNameWelcome != "" {
                Text(self.firstNameWelcome).font(.headline)
            }
            
            NumberPadView(typed: self.$itemIDQueryString, showResults: self.$showQueryResults)
                .sheet(isPresented: self.$showQueryResults) {
                    if self.sheet == .results {
                        SearchResults(searchString: self.itemIDQueryString, item: self.$itemDetailed, sheet: self.$sheet)
                            .onDisappear {
                                self.itemIDQueryString = ""
                            }
                    }
                    else if self.sheet == .detail && self.itemDetailed != nil {
                        ItemDetailContainer(item: self.$itemDetailed, sheet: self.$sheet)
                    }
                }
        }
            
        
    }
}

enum DisplaySheet {
    case results, detail
}
