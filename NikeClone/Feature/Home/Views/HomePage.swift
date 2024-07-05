//
//  HomePage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        // for more: https://blorenzop.medium.com/routing-navigation-in-swiftui-f1f8ff818937
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, content: {
                    TitieView()
                    CustomSpace(height: 30)
                    Image("HomeItem1").resizable().padding(.bottom,10)
                    VStack(alignment: .leading){
                        Text("What's New").font(.title3.bold()).padding(.vertical,10)
                        Text("The latest arrivals from Nike").font(.title).padding(.bottom,10)
                        ScrollView(.horizontal,showsIndicators: false) {
                            ItemList()
                        }
                    }.padding(.horizontal,10)
                })
                Spacer()
                
            }.navigationTitle("").navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HomePage()
}

struct TitieView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Discover").font(.title2.bold()).padding(.bottom,2)
            Text("Tuesday, 3 May").padding(.bottom,10)
        }.padding(.horizontal,10)
    }
}

struct ItemList: View {
    var body: some View {
       
        HStack(){
            NavigationLink(destination: {
                ItemCollectionPage()
            }, label: {
                Image("HomeItem2")
            })
            NavigationLink(destination: {
                ItemCollectionPage()
            }, label: {
                Image("HomeItem2")
            })
        }
    }
}
