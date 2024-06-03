//
//  HomePage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack(alignment: .leading, content: {
            TitieView()
            CustomSpace(height: 30)
            Image("HomeItem1")
            Spacer()
        })
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
