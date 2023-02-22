//
//  MealDetailView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import SwiftUI

struct MealDetailView: View {
    
    @EnvironmentObject var mealService: MealService
    @StateObject var detailVM: DetailViewModel
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(detailVM.detailMeals){ meals in
                    VStack{
                        DetailImageView(meal: meals)
                        HStack{
                            Text(meals.strMeal ?? "")
                                .foregroundColor(.black)
                                .font(.title)
                                .bold()
                            
                            Spacer()
                        }//: HStack
                        .padding(.top, 16)
                        .padding(.horizontal, 12)
                        VStack{
                            HStack{
                                if detailVM.isInstructionTapped {
                                    Text(meals.strInstructions ?? "")
                                        .foregroundColor(.black)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .onTapGesture(count: 2) {
                                            withAnimation(.easeInOut(duration:1)) {
                                                detailVM.isInstructionTapped.toggle()
                                            }//: withAnimation
                                        }//: onTapGesture
                                } else {
                                    Text(meals.strInstructions ?? "")
                                        .foregroundColor(.black)
                                        .lineLimit(3)
                                        .onTapGesture(count: 2) {
                                            withAnimation(.easeInOut(duration:1)) {
                                                detailVM.isInstructionTapped.toggle()
                                            }//: withAnimation
                                        }//: onTapGesture
                                }//: if else
                            }//: HStack
                            .overlay(alignment: .bottomTrailing) {
                                Button {
                                    withAnimation(.easeInOut(duration:1)) {
                                        detailVM.isInstructionTapped.toggle()
                                    }//: withAnimation
                                } label: {
                                    Image(systemName: detailVM.isInstructionTapped ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                                        .foregroundColor(.black)
                                        .imageScale(.large).offset(x:10,y:36)
                                }//: Button
                                .buttonStyle(.plain)
                            }//: overlay
                            
                        }//: VStack
                        .padding()
                        .background{
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .foregroundColor(.gray.opacity(0.4))
                        }//: background
                        
                        .padding(.horizontal, 12)
                        .padding(.top, 30)
                        
                    }//: VStack
                    .padding(.bottom,30)
                    ForEach(meals.ingredients ?? [], id:\.self){ ing in
                        VStack{
                            HStack{
                                Circle()
                                    .foregroundColor(.black)
                                    .frame( height: 6)
                                Text(ing.measure)
                                    .foregroundColor(.gray)
                                    .font(.footnote)
                                Text(ing.name)
                                    .font(.caption)
                                    .foregroundColor(.black)
                                Spacer()
                            }//: HStack
                            .font(.title3)
                            .padding(.horizontal, 12)
                        }//: VStack
                    }//: ForEach-Ingredients
                }//: ForEach-Meals
            }//: VStack
            
            //TODO: Make a recommend List of meals
        }//: ScrollView
        .frame(maxWidth: .infinity)
        .background {
            Color("mealDetailCardBG").ignoresSafeArea()
        }//: background
        .task {
            await detailVM.fetchMealsDetail()
        }//: task
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(detailVM: DetailViewModel(categoryDescription: .categoryDescriptionTest))
    }
}
