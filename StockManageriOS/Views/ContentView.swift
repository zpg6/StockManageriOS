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
                LinearGradient(gradient: Gradient.init(colors: [Color("SM-Gold"),Color("SM-Yellow")]), startPoint: .bottomLeading, endPoint: .topTrailing).edgesIgnoringSafeArea(.all)
                Login(user: self.$user)
            }
            else {
                AppView(user: self.$user)
            }
        }.preferredColorScheme(.light)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
