//
//  CustomTabItems.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 10/07/2024.
//

import SwiftUI

struct CustomTabItems: View {
    @Binding var index: Int
     var titles: [String]
    private let leftOffset: CGFloat = 0.1
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
                .padding()
            }.onChange(of: index) { oldValue, newValue in
                withAnimation() {
                    proxy.scrollTo(newValue, anchor: UnitPoint(x: UnitPoint.leading.x + leftOffset, y: UnitPoint.leading.y))
                }
            }.animation(.easeOut,value: index)
        }
    }
    
}
