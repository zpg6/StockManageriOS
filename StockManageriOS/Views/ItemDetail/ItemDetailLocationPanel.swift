//
//  ItemDetailLocationPanel.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import SwiftUI

struct ItemDetailLocationPanel: View {
    
    @Binding var location: Location
    
    var body: some View {
        VStack {
            if !self.location.aisle.isEmpty {
                HStack {
                    Text("Aisle:").bold()
                    Spacer()
                    Text(self.location.aisle)
                }
            }
            
            if !self.location.aisleSection.isEmpty {
                HStack {
                    Text("Aisle Section:").bold()
                    Spacer()
                    Text(self.location.aisleSection)
                }
            }
            
            if !self.location.spot.isEmpty {
                HStack {
                    Text("Spot:").bold()
                    Spacer()
                    Text(self.location.spot)
                }
            }
            
            HStack {
                Text("Type:").bold()
                Spacer()
                Text(self.location.type.rawValue)
            }
            
            
            HStack {
                Text("Accessibility:").bold()
                Spacer()
                Text(self.location.accessibility.rawValue)
            }
        }
    }
}
