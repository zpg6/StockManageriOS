//
//  DatabaseErrors.swift
//  StockManagerServerApplication
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/20/20.
//

import Foundation


/// An extension for our custom StockManagerError object
extension StockManagerError {
    
    /// Database Error codes exist in the range **1100-1199**
    
    /// An inner-class of StockManagerError for statically available
    /// errors relating to Database operations within the application.
    class DatabaseErrors {
        
        static let connectionError = StockManagerError(title: "Unable to process",
        message: "An internal error occurred connecting to cloud database service. Please try again later",
        code: 1101)
        
        static let nonUniqueIdentifier = StockManagerError(title: "ID In Use",
                                                        message: "An item already exists with this ID. Please use a unique ID.",
                                                        code: 1102)
        
        static let missingField = StockManagerError(title: "Missing required field",
                                                           message: "Please include either the storeID or storeIDs field.",
                                                           code: 1103)
        
        static let noUserResultsFound = StockManagerError(title: "No results found",
                                                          message: "No user could be found with this email.",
                                                          code: 1104)
        
        static let noItemResultsFound = StockManagerError(title: "No results found",
                                                          message: "No item could be found with this search.",
                                                          code: 1105)
        
        static let internalDatabaseSyncError = StockManagerError(title: "Internal Database Error",
                                                          message: "Please try again later.",
                                                          code: 1106)
        
        
    }
    
    
}
