//
//  ItemDetailNavigation.swift
//  StockManageriOS
//
//  Created by Zachary Grimaldi on 10/1/20.
//

import Foundation


struct ControlWindow {
    
    var state: WindowState = .closed
    var purpose: WindowPurpose = .none
    
    enum WindowState {
        case open, closed
    }
    
    enum WindowPurpose {
        case none
        case addLocation
        case editLocation
        case editDescription
        case removeDescriptionPrompt
        case removeLocationPrompt
        case saveChangesPrompt
        case updateItemLoading
    }
}
