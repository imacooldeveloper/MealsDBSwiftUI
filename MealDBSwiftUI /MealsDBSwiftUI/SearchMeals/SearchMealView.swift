//
//  SearchMealView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/20/23.
//

import SwiftUI

struct SearchMealView: View {
   
    var meal: Meals
    var body: some View {
        VStack{
            HStack{
               
                AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { img in
                    img
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                } placeholder: {
                    Image(systemName: "photo.artframe")
                        .imageScale(.large)
                }//: AsyncImage
                VStack(alignment: .leading,spacing: 8){
                    Text(meal.strMeal ?? "")
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                    HStack{
                        Text( "Category:")
                            .foregroundColor(.gray)
                        Text(meal.strCategory ?? "")
                            .foregroundColor(Color.black)
                            .bold()
                    }//: HStack
                }//: VStack
               Spacer()
            }//: HStack
        }//: VStack
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(lineWidth: 2)
        }//: background
    }
}

struct SearchMealView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMealView(meal: .mealTest)
    }
}
