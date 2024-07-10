//
//  ItemCollectionPage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI

struct LatestArrivalListPage: View {
    @State var index = 0
    var titles = ["All", "Top & T-Shirts","Hoodies & Pull over","Shooes & Footwares"]
    var body: some View {
        VStack {
            VStack {
                CustomTabItems(index: $index,titles: titles)
                TabView(selection: $index) {
                    ForEach (0..<titles.count) { pageId in
                        ItemsGridView().tag(pageId)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
        }.navigationTitle("N7 Collection").navigationBarTitleDisplayMode(.inline).navigationBarItems(trailing: HStack{
            Image(systemName: "slider.horizontal.3")
            Image(systemName: "text.magnifyingglass")
            
        })
    }
}




struct ItemsGridView: View {
    let items = Array(1...10) // Sample data
    
    // Define the grid layout
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.self) { item in
                    ZStack(alignment: .topTrailing) {
                        VStack(alignment: .leading){
                            Image("HomeItem2").resizable().frame(maxHeight: 180).cornerRadius(4)
                            Text("Jordan Essentials").padding(.bottom,2)
                            Text("Basketball Shoes").font(.callout).foregroundStyle(.gray).padding(.bottom,2)
                            Text("1 Color").font(.callout).foregroundStyle(.gray).padding(.bottom,2)
                            Text("US$170").bold()
                        }
                        ZStack {
                            Circle().fill(Color.white).shadow(radius: 4).frame(width: 30)
                            Image(systemName: "heart").clipShape(Circle()).padding(.all)
                        }
                        
                    }
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        LatestArrivalListPage()
    }
}
