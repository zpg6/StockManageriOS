//
//  ContentView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/24/20.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State var itemIDQueryString: String = ""
    @State var showQueryResults: Bool = false
    
    var body: some View {
        
        NumberPadView(typed: self.$itemIDQueryString, showResults: self.$showQueryResults)
            .sheet(isPresented: self.$showQueryResults, content: {
                SearchResults(searchString: self.itemIDQueryString)
            })
            .onAppear {
                self.itemIDQueryString = ""
            }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
