//
//  RepositoriesProtocol.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import Foundation
protocol MealRepositoryProtocol{
    
    func getCategoryList(category: String) async throws -> CategoryResponse
    func getMealDetail(mealID: String) async throws -> MealsResponse
    func getRandomMeal() async throws -> MealsResponse
    func getIngredients(ingredients: String) async throws -> Meals
    func getSearchMeals(mealName: String) async throws -> MealsResponse
}
