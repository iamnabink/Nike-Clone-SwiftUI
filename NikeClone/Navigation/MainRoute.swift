//
//  HomePage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI

struct MainRoute: View {
    var body: some View {
        // for more: https://blorenzop.medium.com/routing-navigation-in-swiftui-f1f8ff818937
        NavigationStack {
            HomePage()
        }
    }
}

#Preview {
    MainRoute()
}
