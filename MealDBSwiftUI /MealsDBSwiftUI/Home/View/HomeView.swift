//
//  HomeView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var mealService: MealService
    @StateObject var homeVM = HomeViewModel()
    
    var animation: Namespace.ID
    var body: some View {
        NavigationStack {
            ScrollView{
                TopHomeView()
                HStack(spacing: 20) {
                    TapSearchView(tappedSearchWillNotWork: homeVM.search)
                        .onTapGesture {
                            homeVM.isSearchTapped.toggle()
                        }
                    
                    //TODO: Sort Meals
                    Menu {
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .padding()
                            .background{
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .foregroundColor(.gray.opacity(0.4))
                            }//: background
                    }//: Menu
                    .buttonStyle(.plain)
                }//: HStack
                .padding(.horizontal,30)
                .padding(.bottom, 40)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        
                        ForEach(MealService.CategoryMealSort.allCases,id:\.self){ category in
                            
                            Text(category.rawValue)
                                .fontWeight(.semibold)
                                .foregroundColor(mealService.categorySelected != category.rawValue ?  .brown : .black)
                                .padding(.vertical,8)
                                .padding(.horizontal, 12)
                                .frame(maxWidth: .infinity)
                            
                                .background {
                                    if mealService.categorySelected == category.rawValue {
                                        Capsule()
                                            .fill(.yellow.opacity(0.4))
                                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                                            .matchedGeometryEffect(id: "MENU", in: animation)
                                    }//: if
                                }//: HStack
                                .onTapGesture {
                                    withAnimation(.easeInOut){
                                        mealService.categorySelected = category.rawValue
                                        homeVM.search = ""
                                       
                                    }//: withAnimation
                                }//: onTapGesture
                        }//: ForEach-CategoryMealSort Enum
                    }//: HStack
                    .padding(.horizontal, 12)
                }//: ScrollView
                
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack {
                        ForEach(mealService.mealCategory, id:\.self){meals in
                       
                            NavigationLink(value: meals) {
                                CategoryView(category: meals)
                            }//: NavigationLink
                            
                        }//: ForEach-MealCcategory
                    }//: LazyHStack
                    
                }//: ScrollView
            }//: ScrollView
            .background {
                Color("mealDetailCardBG").ignoresSafeArea()
            }//: background
            .navigationDestination(for: Categories.self, destination: { meal in
                
                MealDetailView(detailVM: DetailViewModel(categoryDescription: meal))
            })//: navigationDestination for Categories
        }//: NavigationStack
        
        .fullScreenCover(isPresented: $homeVM.isSearchTapped) {
            NavigationStack{
                SearchMealRow()
            }//: NavigationStack-for Sheet
        }//: fullScreenCover
        .onChange(of: mealService.categorySelected, perform: { newCategory in
            Task{
                await mealService.fetchMealCategory(category: newCategory)
            }//: Task
        })//: onChange
        .task {
            await mealService.fetchMealCategory(category: mealService.categorySelected)
        }//: Task
    }
}

struct HomeView_Previews: PreviewProvider {
    @Namespace static var animation
    static var previews: some View {
        NavigationStack{
            HomeView(  animation:animation )
        }
        .environmentObject(MealService())
       
    }
}
