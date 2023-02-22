//
//  AreaMealCardView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/20/23.
//

import SwiftUI

struct AreaMealCardView: View {
    
    var area: String
    var body: some View {
        VStack {
            Text(area)
                .padding(60)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.gray)
                }
        }
    }
}

struct AreaMealCardView_Previews: PreviewProvider {
    static var previews: some View {
        AreaMealCardView(area:  "American")
    }
}
