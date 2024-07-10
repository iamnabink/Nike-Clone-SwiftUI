//
//  RootNavPage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI

struct RootNavPage: View {
    var body: some View {
                    TabView{
                        HomePage().tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                        ShopDetailPage().tabItem {
                            Image(systemName: "text.magnifyingglass")
                            Text("Shop")
                        }
                        Text("Favourites").tabItem {
                            Image(systemName: "suit.heart")
                            Text("Favourites")
                        }
                        Text("Home").tabItem {
                            Image(systemName: "cart")
                            Text("Bag")
                            
                            
                        }
                        SignupPage().tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                            
                            
                        }
                    }
    }
}

#Preview {
    RootNavPage()
}
