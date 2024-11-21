//
//  ProductDetailPage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 31/07/2024.
//

import SwiftUI

struct ProductDetailPage: View {
    var body: some View {
        
        VStack(alignment:.leading){
            Image("EventImg2")
            CustomSpace(height: 4)
            Text("Training Crew Socks")
            CustomSpace(height: 4)
            Text("Nike Everyday Plus Cushioned").font(.title3)
            Spacer()
            
        }.navigationTitle("Shocks by nike").navigationBarItems(trailing: Image(systemName: "magnifyingglass")).navigationBarTitleDisplayMode(.inline)
        
    }
}
#Preview {
    NavigationStack {
        ProductDetailPage()
    }
}
