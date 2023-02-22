//
//  MainView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/19/23.
//

import SwiftUI

struct MainView: View {
   
    @EnvironmentObject var mealService: MealService
    @Namespace var animation
    var body: some View {
        TabView {
            HomeView( animation: animation)
                .tabItem {
                    Text("Home")
                    Image(systemName: "fork.knife.circle")
                }
                .environmentObject(mealService)
              
            RandomMealView()
                  .tabItem {
                      Text("Random")
                      Image(systemName: "die.face.6")
                  }
                  .environmentObject(mealService)
        }//: TabView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MealService())
    }
}
