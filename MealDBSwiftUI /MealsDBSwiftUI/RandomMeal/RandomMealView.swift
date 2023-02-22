//
//  RandomMealView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/19/23.
//

import SwiftUI


struct RandomMealView: View {
    @EnvironmentObject var mealService: MealService
   
    @State private var isShowingRandomMealSheet: Bool = false
    var body: some View {
        VStack{
            VStack {
                Text("Cant Decide what to eat")
                Text("We Got you Covered")
            }//: VStack
            .font(.headline)
            .bold()
            
            Button {
              
                isShowingRandomMealSheet.toggle()
                Task {
                    await mealService.fetchRandomMeal()
                }
            } label: {
                Text("Tap me 🍰")
                    .foregroundColor(.white)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                    }//: background
            }//: Button
        }//: VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color("mealDetailCardBG").ignoresSafeArea()
        }//: background
        
        .sheet(isPresented: $isShowingRandomMealSheet) {
            
            RandomMealInfoView(meals: mealService.randomDetailMeal)
        }//: sheet
    }
}

struct RandomMealView_Previews: PreviewProvider {
    static var previews: some View {
        RandomMealView()
        
            .environmentObject(MealService())
    }
}
