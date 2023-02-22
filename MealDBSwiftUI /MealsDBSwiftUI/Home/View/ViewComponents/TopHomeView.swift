//
//  TopHomeView.swift
//  MealsDBSwiftUI
//
//  Created by Martin Gallardo on 2/18/23.
//

import SwiftUI

struct TopHomeView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.title)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .foregroundColor(.gray.opacity(0.4))
                    }//: background
                Spacer()
                Image(systemName: "person.circle.fill")
                    .font(.title)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .foregroundColor(.gray.opacity(0.4))
                    }//: background
            }//: HStack
            
            VStack(alignment: .leading){
                Text("Tasty Food That's")
                HStack{
                    Text("Easy")
                        .foregroundColor(.blue)
                    Text("To Make")
                }//: HStack
            }//: VStack
           
            .font(.largeTitle.bold())
        }//: VStack
        .padding(.horizontal, 12)
    }
}

struct TopHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TopHomeView()
    }
}
