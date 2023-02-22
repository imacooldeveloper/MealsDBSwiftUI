//
//  Repositories.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import Foundation
final class MealRepositories: MealRepositoryProtocol {
    
    let requester = Requester()
    
    func getSearchMeals(mealName: String) async throws -> MealsResponse {
        let request = MealRequest.searchMealByName(mealName)
        return try await  requester.doRequest(request: request)
    }
    
    func getCategoryList(category: String) async throws -> CategoryResponse {
        let request = MealRequest.filterByCategory(category)
        return try await requester.doRequest(request: request)
    }
    
    
    func getMealDetail(mealID: String) async throws -> MealsResponse {
        let request = MealRequest.lookupFullMealDetailsById(mealID)
        return try await requester.doRequest(request: request)
    }
    
    
    func getIngredients(ingredients: String) async throws -> Meals {
        let request = MealRequest.ingredientsImage(ingredients)
        return try await requester.doRequest(request: request)
    }
    
    func getRandomMeal() async throws -> MealsResponse {
        let request = MealRequest.random
        return try await requester.doRequest(request: request)
    }
   
    
}
