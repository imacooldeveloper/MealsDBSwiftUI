//
//  HomeViewModel.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import SwiftUI

final class HomeViewModel: ObservableObject {

    @Published  var search = ""
    @Published var isSearchTapped: Bool = false

}


