//
//  RootNavPage.swift
//  NikeClone
//
//  Created by nex on 03/06/2024.
//

import SwiftUI

struct RootNavPage: View {
    var body: some View {
                    TabView{
                        HomePage().tabItem {
                            Image(systemName: "house")
                            Text("Home")
                        }
                        Text("Search").tabItem {
                            Image(systemName: "text.magnifyingglass")
                            Text("Search")
                        }
                        Text("Favourites").tabItem {
                            Image(systemName: "suit.heart")
                            Text("Favourites")
                        }
                        Text("Home").tabItem {
                            Image(systemName: "cart")
                            Text("Bag")
                            
                            
                        }
                        Text("Profile").tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                            
                            
                        }
                    }
    }
}

#Preview {
    RootNavPage()
}
