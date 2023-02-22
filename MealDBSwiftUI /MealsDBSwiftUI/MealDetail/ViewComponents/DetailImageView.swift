//
//  DetailImageView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import SwiftUI

struct DetailImageView: View {
    var meal: Meals
    var body: some View {
        if   meal.strMealThumb != ""{
            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { img in
                img
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                   
                    .background {
                        Circle()
                            .stroke(lineWidth: 8)
                            .foregroundColor(.black)
                    }
            } placeholder: {
                ProgressView()
               
            }
        }  else {
            Image(systemName: "photo.artframe")
                .imageScale(.large)
        }
    }
}

struct DetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageView(meal: .mealTest)
    }
}
