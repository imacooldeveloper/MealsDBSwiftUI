//
//  AreaMealRowView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/20/23.
//

import SwiftUI

struct AreaMealRowView: View {
    enum AreaSort: String, CaseIterable {
        case American = "American"
        case British = "British"
        case Canadian = "Canadian"
        case Chinese = "Chinese"
        case Croatian = "Croatian"
        case Dutch = "Dutch"
        case Egyptian = "Egyptian"
        case French = "French"
        case Greek = "Greek"
        case Indian = "Indian"
        case Irish = "Irish"
        case Italian = "Italian"
        case Jamaican = "Jamaican"
        case Japanese = "Japanese"
        case Kenyan = "Kenyan"
        case Malaysian = "Malaysian"
        case Mexican = "Mexican"
        case Moroccan = "Moroccan"
        case Polish = "Polish"
        case Portuguese = "Portuguese"
        case Russian = "Russian"
        case Spanish = "Spanish"
        case Thai = "Thai"
        case Tunisian = "Tunisian"
        case Turkish = "Turkish"
        case Unknown = "Unknown"
        case Vietnamese = "Vietnamese"
       
    }
    @State var sortType: AreaSort = .American
   
    var body: some View {
        ScrollView{
        //TODO: Create Area View
        }
    }
}

struct AreaMealRowView_Previews: PreviewProvider {
    static var previews: some View {
        AreaMealRowView()
    }
}
