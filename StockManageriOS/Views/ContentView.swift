//
//  ContentView.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 8/24/20.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State var user: User? = nil
    
    var body: some View {
        
        ZStack {
            if self.user == nil {
                Color(.systemBackground).edgesIgnoringSafeArea(.all)
                Login(user: self.$user)
            }
            else {
                AppView(user: self.$user)
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
