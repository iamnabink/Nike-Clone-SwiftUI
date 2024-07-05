//
//  ItemCollectionPage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI

struct ItemCollectionPage: View {
    @State var index = 0
    var body: some View {
        VStack {
            VStack {
                      TabBarView(index: $index)
                      TabView(selection: $index) {
                          ForEach (0..<4) { pageId in
                              Text("Page \(pageId+1)").tag(pageId)
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
            
        }.navigationTitle("N7 Collection").navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemCollectionPage()
    }
}
struct TabBarView: View {
    @Binding var index: Int
    var titles = ["All", "Top & T-Shirts","Hoodies & Pull over","Shooes & Footwares"]
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(titles.indices) {id in
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
            }.onChange(of: index) { value in
                withAnimation() {
                    proxy.scrollTo(value, anchor: UnitPoint(x: UnitPoint.leading.x + leftOffset, y: UnitPoint.leading.y))
                }
            }.animation(.easeInOut)
        }
    }
    private let leftOffset: CGFloat = 0.1
}
