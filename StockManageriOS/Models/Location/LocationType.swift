//
//  LocationType.swift
//  
//
//  Created By Zachary Grimaldi and Joseph Paul on 5/23/20.
//


/// A string enumeration describing the type of location an `InventoryItem` is stored at.
enum LocationType: String, Codable {
    case jHook = "J-Hook"
    case sideStack = "Side Stack"
    case shelfSpace = "Shelf Space"
    case pod = "Pod"
    case floorModel = "Floor Model"
    case topStock = "Top Stock"
    case backroomStock = "Backroom Stock"
    case incoming = "Incoming"
    case outgoing = "Outgoing"
    case unprocessed = "Unprocessed"
    case bottomStock = "Bottom Stock"
    case unknown = "Unknown"
}
