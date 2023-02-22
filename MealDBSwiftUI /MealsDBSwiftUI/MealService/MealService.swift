//
//  MealService.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import Foundation

class MealService: ObservableObject {
    
    enum CategoryMealSort: String, CaseIterable {
        case Beef = "Beef"
        case Breakfast = "Breakfast"
        case Chicken = "Chicken"
        case Dessert = "Dessert"
        case Goat = "Goat"
        case Lamb = "Lamb"
        case Miscellaneous = "Miscellaneous"
        case Pasta = "Pasta"
        case Pork = "Pork"
        case Seafood = "Seafood"
        case Side = "Side"
        case Starter = "Starter"
        case Vegan = "Vegan"
        case Vegetarian = "Vegetarian"
        
       
    }
    //TODO:  Refactor MealRepo
    var mealRepo = MealRepositories()
    
    
    @Published var categorySelected = "Beef"
    @Published var sortType: CategoryMealSort = .Beef
   
    @Published var mealCategory: [Categories] = [] // category of meals
   // @Published var mealResponse: [MealsResponse] = [] //  topLevel JSon - for the meal
    @Published var randomDetailMeal: [Meals] = [] // random meal
    @Published var searchMeal: [Meals] = [] // search through the  meal API
    
    /// Get the category list of meals
    /// ```
    ///        mealService.fetchMealCategory(category:String)
    /// `
    @MainActor func fetchMealCategory(category:String)  async {
        do {
            mealCategory  = try await mealRepo.getCategoryList(category: category).mealsCategory.sorted(by: {$0.strMeal < $1.strMeal})
          
        } catch {
            print(error.localizedDescription)
        }
     }
    
   
    /// Get random meals
    /// ```
    ///        mealService.fetchRandomMeal()
    /// ```
    @MainActor func fetchRandomMeal() async {
        do {
            randomDetailMeal  = try await mealRepo.getRandomMeal().meals ?? []
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /// Search meals
    /// ```
    ///        mealService.fetchSearch(search: String)
    /// ```
    @MainActor func fetchSearch(search: String) async {
        
        do {
            //TODO: Make it debounce
            searchMeal  = try await mealRepo.getSearchMeals(mealName: search).meals ?? []
                
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
