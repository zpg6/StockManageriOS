//
//  LocationType+Extensions.swift
//  
//
//  Created By Zachary Grimaldi and Joseph Paul on 5/23/20.
//

extension LocationType {
    
    /// string (singular) version of the enumeration
    var value: String {
        switch self {
        case .jHook:
            return "JHook"
        case .sideStack:
            return "Side Stack"
        case .shelfSpace:
            return "Shelf Space"
        case .pod:
            return "Pod"
        case .floorModel:
            return "Floor Model"
        case .topStock:
            return "Top Stock"
        case .backroomStock:
            return "Backroom Stock"
        case .incoming:
             return "Incoming"
        case .outgoing:
            return "Outgoing"
        case .unprocessed:
            return "Unprocessed"
        case .bottomStock:
            return "Bottom Stock"
        case .unknown:
            return "Unknown"
            
        //Cases are exhaustive, no default needed
        }
    }
    
    /// string (plural) version of the enumeration
    var plural: String {
        switch self {
        case .jHook:
            return "JHooks"
        case .sideStack:
            return "Side Stacks"
        case .shelfSpace:
            return "Shelf Spaces"
        case .pod:
            return "Pods"
        case .floorModel:
            return "Floor Models"
        case .topStock:
            return "Top Stock"
        case .backroomStock:
            return "Backroom Stock"
        case .incoming:
             return "Incoming"
        case .outgoing:
            return "Outgoing"
        case .unprocessed:
            return "Unprocessed"
        case .bottomStock:
            return "Bottom Stock"
        case .unknown:
            return "Unknown"
            
        //Cases are exhaustive, no default needed
        }
    }
    
    /// a forgiving decoder for values that are similar to LocationType raw values
    static func from(_ string: String) throws -> LocationType {
        switch string {
        case "JHook", "JHooks":
            return .jHook
        case "Side Stack", "Side Stacks", "SideStack":
            return .sideStack
        case "Shelf Space", "Shelf Spaces", "ShelfSpace":
            return .shelfSpace
        case "Pod", "Pods":
            return .pod
        case "Floor Model", "Floor Models", "FloorModel":
            return .floorModel
        case "Top Stock", "Top Stock Items", "TopStock":
            return .topStock
        case "Backroom Stock", "Backroom Stock Items":
            return .backroomStock
        case "Incoming", "Incoming Items":
            return .incoming
        case "Outgoing", "Outgoing Items":
            return .outgoing
        case "Unprocessed", "Unprocessed Items":
            return .unprocessed
        case "Bottom Stock", "Bottom Stock Items":
            return .bottomStock
        case "Unknown", "Unknown Location":
            return .unknown
        default:
            throw StockManagerError.ModelErrors.illegalLocationType
            
        }
    }
    
    /// all `LocationTypes`, for purposes of iterating
    static func all() -> [LocationType] {
        return [.jHook, .sideStack, .shelfSpace, .pod, .floorModel, .topStock, .backroomStock, .incoming, .outgoing, .unprocessed, .bottomStock, .unknown]
    }
}
