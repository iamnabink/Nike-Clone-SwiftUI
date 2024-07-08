//
//  ItemCollectionPage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI

struct LatestArrivalListPage: View {
    @State var index = 0
    var body: some View {
        VStack {
            VStack {
                TabBarView(index: $index).padding(.vertical,10)
                TabView(selection: $index) {
                    ForEach (0..<4) { pageId in
                        ItemsGridView().tag(pageId)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            //            TabView{
            //
            //                Text("All").tabItem {
            //                    Text("All")
            //                }
            //                Text("Top & T-Shirts").tabItem {
            //                    Text("Top & T-Shirts")
            //                }
            //                Text("Hoodies & Pullover").tabItem {
            //                    Text("Hoodies & Pullover")
            //                }
            //            }
            
        }.navigationTitle("N7 Collection").navigationBarTitleDisplayMode(.inline).navigationBarItems(trailing: HStack{
            Image(systemName: "slider.horizontal.3")
            Image(systemName: "text.magnifyingglass")
            
        })
    }
}


struct TabBarView: View {
    @Binding var index: Int
    private let leftOffset: CGFloat = 0.1
    var titles = ["All", "Top & T-Shirts","Hoodies & Pull over","Shooes & Footwares"]
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    // alternative way fot his exp: titles.indices is 0..<titles.count
                    ForEach(titles.indices,id: \.self) {id in
                        let title = Text(titles[id]).id(id)
                            .onTapGesture {
                                withAnimation() {
                                    index = id
                                }
                            }
                        if self.index == id {
                            title.foregroundColor(.black)
                        } else {
                            title.foregroundColor(.gray)
                        }
                    }
                    
                    .padding(.horizontal, 5)
                }
                .padding(.leading, 20)
            }.onChange(of: index) { oldValue, newValue in
                withAnimation() {
                    proxy.scrollTo(newValue, anchor: UnitPoint(x: UnitPoint.leading.x + leftOffset, y: UnitPoint.leading.y))
                }
            }.animation(.easeOut,value: index)
        }
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
