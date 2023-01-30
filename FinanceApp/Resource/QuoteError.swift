//
//  QuoteError.swift
//  FinanceApp
//
//  Created by Lucas Freire Sabino on 1/19/23.
//

import Foundation

enum QuoteError: Error, LocalizedError {
    case badBaseURL
    case badBuiltURL
    case invalidData(String)
    
    var errorDescription: String? {
        switch self {
        case .badBaseURL:
            return NSLocalizedString("Issue with base URL", comment: "")
        case .badBuiltURL:
            return NSLocalizedString("Issue with fully built out URL", comment: "")
        case .invalidData:
            return NSLocalizedString("Issue with data from the API call", comment: "")
        }
    }
}
