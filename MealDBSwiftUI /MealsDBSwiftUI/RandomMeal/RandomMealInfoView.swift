//
//  RandomMealInfoView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/19/23.
//

import SwiftUI

struct RandomMealInfoView: View {
    var meals: [Meals] = []
    @State var isInstructionTaped: Bool = false
    var body: some View {
        ScrollView{
            VStack{
                ForEach(meals){ meals in
                    VStack{
                        
                      DetailImageView(meal: meals)
                            .padding(.top, 20)
                        HStack{
                            Text(meals.strMeal ?? "")
                                .font(.title)
                                .bold()
                            Spacer()
                        }//: HStack
                        .padding(.top, 16)
                        .padding(.horizontal, 12)
                        VStack{
                            HStack{
                                if isInstructionTaped {
                                    Text(meals.strInstructions ?? "")
                                    .fixedSize(horizontal: false, vertical: true)
                                    .onTapGesture(count: 2) {
                                      
                                        withAnimation(.easeInOut(duration:1)) {
                                            isInstructionTaped.toggle()
                                        }//: withAnimation
                                    }//: onTapGesture
                                } else {
                                    Text(meals.strInstructions ?? "")
                                        .lineLimit(3)
                                        .onTapGesture(count: 2) {
                                            withAnimation(.easeInOut(duration:1)) {
                                                isInstructionTaped.toggle()
                                            }//: withAnimation
                                        }//: onTapGesture
                                }//: iF else
                            }//: HStack
                            .overlay(alignment: .bottomTrailing) {
                                Button {
                                    withAnimation(.easeInOut(duration:1)) {
                                        isInstructionTaped.toggle()
                                    }//: withAnimation
                                } label: {
                                    Image(systemName: isInstructionTaped ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                                        .imageScale(.large).offset(x:10,y:36)
                                }
                                //: Button
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
                                    .frame( height: 6)
                                Text(ing.measure)
                                    .foregroundColor(.gray)
                                    .font(.footnote)
                                Text(ing.name)
                                    .font(.caption)
                                Spacer()
                            }//: HStack
                            .font(.title3)
                            .padding(.horizontal, 12)
                        }//: VStack
                    }//: ForEach-Ingredients
                }//: ForEach- Meal
            }//: VStack
           //TODO: Make a recommend List of meals
        }//: ScrollView
        .frame(maxWidth: .infinity)
        .background {
            Color("mealDetailCardBG").ignoresSafeArea()
        }//: background
        
    }
}

struct RandomMealInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RandomMealInfoView()
    }
}
