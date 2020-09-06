//
//  IOErrors.swift
//  StockManagerServerApplication
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/20/20.
//

import Foundation


/// An extension for our custom StockManagerError object
extension StockManagerError {
    
    /// I/O Error codes exist in the range **1400-1499**
    
    /// An inner-class of StockManagerError for statically available
    /// errors relating to I/O operations within the application.
    class IOErrors {
        
        static let encryptionError = StockManagerError(title: "Encryption Error",
        message: "Error encrypting password for storage.",
        code: 1401)
        
        static let retrievalError = StockManagerError(title: "Retrieval Error",
        message: "Error retrieving file.",
        code: 1402)
        
    }
    
    
}
