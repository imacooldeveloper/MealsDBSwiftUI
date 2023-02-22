//
//  SearchBarView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchMeal: String
    var body: some View {
       TextField("Search", text: $searchMeal)
            .font(.headline)
            .foregroundColor(.black)
            .frame(height: 40)
            .offset(x: 40)
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .foregroundColor(.gray.opacity(0.4))
            }//: background
            .overlay(alignment: .leading) {
                Image(systemName: "fork.knife.circle")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .offset(x: 6)
            }//: overlay
    }
}
struct TapSearchView: View {
    @State var tappedSearchWillNotWork: String = ""
    var body: some View {
        TextField("Search", text: $tappedSearchWillNotWork)
            .disabled(true)
        .font(.headline)
        .foregroundColor(.black)
        .frame(height: 40)
        .offset(x: 40)
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(.gray.opacity(0.4))
        }//: background
        .overlay(alignment: .leading) {
            Image(systemName: "fork.knife.circle")
                .foregroundColor(.black)
                .font(.largeTitle)
                .offset(x: 6)
        }//: overlay
    }
}
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchMeal: .constant("Cake"))
    }
}
