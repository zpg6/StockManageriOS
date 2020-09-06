//
//  Accessibility.swift
//  
//
//  Created By Zachary Grimaldi and Joseph Paul on 5/24/20.
//


/// an enumeration describing the ability of a customer to buy an item
/// an item may be in-store but Processed or Unprocessed
enum Accessibility: String, Codable {
    case processed = "Processed"
    case unprocessed = "Unprocessed"
}
