//
//  MealDetailsView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/20/23.
//

import SwiftUI

struct MealDetailsView: View {
    //@EnvironmentObject var mealService: MealService
    var meals: Meals
    @State var isInstructionTaped: Bool = false
    var body: some View {
        ScrollView{
            VStack{
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
                            if isInstructionTaped {
                                
                                
                                Text(meals.strInstructions ?? "")
                                    .foregroundColor(.black)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .onTapGesture(count: 2) {
                                        
                                        withAnimation(.easeInOut(duration:1)) {
                                            isInstructionTaped.toggle()
                                        }
                                    }//: onTapGesture
                            } else {
                                Text(meals.strInstructions ?? "")
                                    .foregroundColor(.black)
                                    .lineLimit(3)
                                    .onTapGesture(count: 2) {
                                        
                                        withAnimation(.easeInOut(duration:1)) {
                                            isInstructionTaped.toggle()
                                        }
                                    }//: onTapGesture
                            }//: if else
                        }//: HStack
                        .overlay(alignment: .bottomTrailing) {
                            
                            Button {
                                withAnimation(.easeInOut(duration:1)) {
                                    isInstructionTaped.toggle()
                                }
                                
                            } label: {
                                Image(systemName: isInstructionTaped ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
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
                                .foregroundColor(.black)
                                .font(.caption)
                            Spacer()
                        }//: HStack
                        .font(.title3)
                        .padding(.horizontal, 12)
                    }//: VStack
                }//: ForEach
            }//: VStack
            //TODO: Make a recommend List of meals
        }//: ScrollView
        .frame(maxWidth: .infinity)
        .background {
            Color("mealDetailCardBG").ignoresSafeArea()
        }
    }
}

struct MealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailsView(meals: .mealTest)
            .environmentObject(MealService())
    }
}
