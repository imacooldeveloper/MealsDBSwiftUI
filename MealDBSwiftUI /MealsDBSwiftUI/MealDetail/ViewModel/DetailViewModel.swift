//
//  DetailViewModel.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import Foundation
class DetailViewModel: ObservableObject {
    
    
    var mealRepo = MealRepositories()
    var categoryDescription: Categories
    @Published var isInstructionTapped: Bool = false
    @Published var detailMeals: [Meals] = []
    init(categoryDescription: Categories){
        self.categoryDescription = categoryDescription
    }
    
    @MainActor
    func fetchMealsDetail() async {
        do {
            detailMeals = try await mealRepo.getMealDetail(mealID: categoryDescription.idMeal).meals ?? []
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
   
}
