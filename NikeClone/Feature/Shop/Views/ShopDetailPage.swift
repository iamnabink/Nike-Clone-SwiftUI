//
//  ShopDetailPage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 09/07/2024.
//

import SwiftUI

struct ShopDetailPage: View {
    @State private var index:Int = 0
    let titles: [String] = ["Men","Women","Kids"]
    var body: some View {
        VStack(alignment:.leading){
            CustomTabItems(index: $index, titles: titles)
            TabView(selection: $index) {
                ForEach (0..<titles.count) { index in
                    ShopBodyView().foregroundStyle(.black).tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }.scrollIndicators(.hidden).navigationTitle("Shop").navigationBarTitleDisplayMode(.large).navigationBarItems(trailing: HStack{
            Image(systemName: "magnifyingglass")
    })
    }
}

#Preview {
    NavigationStack {
        ShopDetailPage()
    }
}

struct ShopBodyView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment:.leading){
                Text("Must-Haves, Best Sellers & More").font(.title3.bold())
                CustomSpace(height: 15)
                HStack{
                    VStack(alignment:.leading) {
                        Image("EventImg1").resizable().frame(height: 250)
                        Text("Best Sellers")
                    }
                    VStack(alignment:.leading) {
                        Image("EventImg1").resizable().frame(height: 250)
                        Text("Featured in Nike Air")
                    }
                }
                ZStack {
                    Image("EventImg3").resizable().frame(height: 100)
                    Text("New & Featured").foregroundStyle(.white)
                }
                CustomSpace()
                ZStack {
                    Image("EventImg3").resizable().frame(height: 100)
                    Text("New & Featured").foregroundStyle(.white)
                }
                
            }
        }.padding().scrollIndicators(.hidden)
    }
}
