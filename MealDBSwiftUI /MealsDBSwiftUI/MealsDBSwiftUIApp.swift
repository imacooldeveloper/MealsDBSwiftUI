//
//  MealsDBSwiftUIApp.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import SwiftUI

@main
struct MealsDBSwiftUIApp: App {
    
    @StateObject var mealService = MealService()//
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(mealService)//
               
        }
    }
}
