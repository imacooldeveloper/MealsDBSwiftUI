//
//  SearchMealRow.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/20/23.
//

import SwiftUI

struct SearchMealRow: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var mealService: MealService
    @State var search: String = ""
    var body: some View {
        ScrollView{
            HStack{
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            Circle()
                                .foregroundColor(.gray)
                        }
                }//: Button
                .buttonStyle(.plain)
                Spacer()
            }//: HStack
            .padding(.horizontal,12)
            VStack(spacing: 20){
                SearchBarView(searchMeal: $search)
                if search == "" {
                    VStack(spacing: 12){
                        HStack{
                            Text("Are you Hungry")
                            Text("🍖🥑🍩🍰 ")
                        }//: HStack
                        .font(.title2)
                            .bold()
                        Text("Search for a recipe")
                            .bold()
                    }//: VStack
                    .foregroundColor(.black)
                } else {
                    ForEach(mealService.searchMeal, id:\.self){meal in
                        
                        NavigationLink(value: meal) {
                            SearchMealView(meal: meal)
                                .foregroundColor(.black)
                        }//: NavigationLink
                        .buttonStyle(.plain)
                        
                    }//: ForEach
                }//: else
            }
            .padding(.horizontal, 12)
        }
        .background {
            Color("mealDetailCardBG").ignoresSafeArea()
        }
        .navigationDestination(for: Meals.self){meal in
            
            MealDetailsView(meals: meal)
        }
        .onChange(of: search) { newValue in
            Task{
                await mealService.fetchSearch(search:newValue)
                
            }//: Task
        }//: onChange
    }
}

struct SearchMealRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SearchMealRow()
                .environmentObject(MealService())
        }
    }
}
