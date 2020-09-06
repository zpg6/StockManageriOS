//
//  ErrorProtocol.swift
//  StockManagerServerApplication
//
//  Created By Zachary Grimaldi and Joseph Paul on 8/20/20.
//

import Foundation

/// A custom protocol that conforms to LocalizedError,
/// with an additional, optional 'message' variable
protocol ErrorProtocol: LocalizedError {
    var title: String? { get }
    var message: String? { get }
    var code: Int { get }
}

/// A custom Error that can be used for throwing in a do/catch or
/// for printing a formatted output string. Necessary for standardizing
/// errors for our API reference web page.
struct StockManagerError: ErrorProtocol {
    
    var title: String?
    var message: String?
    
    /// Model Error codes exist in the range **1000-1099**
    /// Database Error codes exist in the range **1100-1199**
    /// Authentication Error codes exist in the range **1200-1299**
    /// API Error codes exist in the range **1300-1399**
    /// I/O Error codes exist in the range **1400-1499**
    /// JSON Error codes exist in the range **1500-1599**
    /// System Error codes exist in the range **1600-1699**
    var code: Int
    
    /// a computed variable for error formatting for printing
    var output: String {
        
        var result = ""
        result += "Error \(code)"
        if let title = self.title, let message = self.message {
            result += ": \(title.uppercased()) - \(message)"
        }
        else if let title = self.title {
            result += ": \(title)"
        }
        else if let message = self.message {
            result += ": \(message)"
        }
        return result
    }
    
    static let unreachableError = StockManagerError(title: "Unreachable Error", message: "If you see this error, please contact the StockManager team.", code: 999)
}
