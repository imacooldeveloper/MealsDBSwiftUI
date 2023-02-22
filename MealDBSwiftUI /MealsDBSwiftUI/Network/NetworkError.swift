//
//  NetworkError.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import Foundation

enum NetworkError: Error {
    case general(Error)
    case status(Int)
    case dataInvalid
    case dataError(Error)
    case httpError
    
    var description: String {
        switch self {
            
        case .general(let error):
            return "There was an error \(error)"
        case .status(let status):
            return "You status code is: \(status)"
        case .dataInvalid:
            return "Invalid data check your url"
        case .dataError(let error):
            return "There has been an error \(error)"
        case .httpError:
            return "The Http you enter is incorrect"
        }
    }
}
