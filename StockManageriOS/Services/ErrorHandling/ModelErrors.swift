//
//  ModelErrors.swift
//  StockManagerServerApplication
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/20/20.
//

import Foundation


/// An extension for our custom StockManagerError object
extension StockManagerError {
    
    static let itemReferenceURL = ""
    static let itemReference = " Visit \(StockManagerError.itemReferenceURL) for more information."
    
    /// Model Error codes exist in the range **1000-1099**
    
    /// An inner-class of StockManagerError for statically available
    /// errors relating to Model values within the application.
    class ModelErrors {
        
        static let illegalLocationType = StockManagerError(title: "Illegal LocationType value in InventoryItem",
                                                        message: "Please retry with the defined format.\(StockManagerError.itemReference).",
                                                        code: 1001)
        
        static let illegalPackaging = StockManagerError(title: "Illegal Packaging value in InventoryItem",
                                                     message: "Please retry with the defined format.\(StockManagerError.itemReference).",
                                                     code: 1002)
        
        static let missingIdentifier = StockManagerError(title: "Illegal format of data",
                                                      message: "Please include the itemID field.\(StockManagerError.itemReference).",
                                                      code: 1003)
        
        
        
        
        
        
        
        static let all: [StockManagerError] = [illegalLocationType, illegalPackaging]
    }
    
    
}
