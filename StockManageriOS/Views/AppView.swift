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
                    SearchResults(searchString: self.itemIDQueryString)
                        .onDisappear {
                            self.itemIDQueryString = ""
                        }
                }
        }
            
        
    }
}
