//
//  CategoryView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import SwiftUI

struct CategoryView: View {
    var category: Categories
    var body: some View {
            VStack(spacing: 12) {
                if category.strMealThumb != nil{
                    AsyncImage(url: category.strMealThumb) { img in
                        img
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height:  300)
                         
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: .black.opacity(0.4), radius: 2, x: -8, y: 5)
                           
                            .overlay {
                                LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                                    .cornerRadius(12)
                            }//: overlay-
                            .overlay(alignment: .bottomLeading) {
                                Text(category.strMeal)
                                    
                                    .multilineTextAlignment(.leading)
                                    .font(.headline)
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width: 120)
                                    .padding(.leading, 8)
                                    .padding(.bottom, 20)
                            }//: overlay
                    } placeholder: {
                        ProgressView()
                            .frame(width: 200, height:  300)
                    }
                } else {
                    Image(systemName: "photo.artframe")
                        .imageScale(.large)
                }//: if else -asyncImage
            }//: VStack
           
            .padding()
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: .categoryDescriptionTest)
    }
}
