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
    
    var body: some View {
        Text(searchString).font(.largeTitle)
    }
    
}
