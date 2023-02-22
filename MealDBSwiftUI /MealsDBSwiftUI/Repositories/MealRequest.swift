//
//  MealRequest.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import Foundation

enum MealRequest{
    case searchMealByName(String)
    case listAllMealsByFirstLetter(String)
    case lookupFullMealDetailsById(String)
    case random
    case listAllMealCategories
    case listAllCategories
    case listAllArea
    case listAllIngredients
    case ingredientsImage(String)
    case filterByCategory(String)
    case filterByArea(String)
    case filterByMainIngredient(String)
}

extension MealRequest: APIRequest {
    
    
    var path: String {
        switch self {
        case .searchMealByName: return "/search.php"
        case .listAllMealsByFirstLetter: return "/search.php"
        case .lookupFullMealDetailsById: return "lookup.php"
        case .random: return "random.php"
        case .listAllMealCategories: return "categories.php"
        case .listAllCategories: return "list.php"
        case .listAllArea: return "list.php"
        case .listAllIngredients: return "list.php"
        case .filterByCategory: return "filter.php"
        case .filterByArea: return "filter.php"
        case .filterByMainIngredient: return "filter.php"
        case .ingredientsImage(let ingredients): return "/images/ingredients/\(ingredients).png"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .searchMealByName: return .get
        case .listAllMealsByFirstLetter: return .get
        case .lookupFullMealDetailsById: return .get
        case .random: return .get
        case .listAllMealCategories: return .get
        case .listAllCategories: return .get
        case .listAllArea: return .get
        case .listAllIngredients: return .get
        case .filterByCategory: return .get
        case .filterByArea: return .get
        case .filterByMainIngredient: return .get
        case .ingredientsImage: return .get
            
        }
    }
    var queryItems: [URLQueryItem]? {
        switch self {
        case .searchMealByName(let search):
            return [URLQueryItem(name: "s", value: search)]
        case .listAllMealsByFirstLetter(let firstLetter):
            return [URLQueryItem(name: "f", value: firstLetter)]
        case .lookupFullMealDetailsById(let id):
            return [URLQueryItem(name: "i", value: id)]
        case .random:
            return []
        case .listAllMealCategories:
            return []
        case .listAllCategories:
            return [URLQueryItem(name: "c", value: "list")]
        case .listAllArea:
            return [URLQueryItem(name: "a", value: "list")]
        case .listAllIngredients:
            return [URLQueryItem(name: "i", value: "list")]
            
        case .filterByCategory(let category):
            return [URLQueryItem(name: "c", value: category)]
            
        case .filterByArea(let area):
            return [URLQueryItem(name: "a", value: area)]
            
        case .filterByMainIngredient(let ingredient):
            return [URLQueryItem(name: "i", value: ingredient)]
        case .ingredientsImage(_):
            return []
        }
    }
}
