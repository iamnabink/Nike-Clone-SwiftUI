//
//  GeStartedPage2.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 10/07/2024.
//

import SwiftUI


struct GetStartedPage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                BodyView()
                
                GeometryReader { geo in
                    VStack {
                        ProgressView(value: 30, total: 100)
                            .tint(.white)
                            .background(.gray)
                            .padding(.top, 20).padding(.horizontal,geo.size.width*0.25)
                        
                        Spacer() // Push the rest of the content to the bottom
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        
    }
}

struct BodyView: View {
    @State private var currentPageId = 0 // 0 or 1
    
    var body: some View {
        var pages = [AnyView(View1(callback: {
            currentPageId = 1
        })), AnyView(View2())]

        TabView(selection: $currentPageId) {
            pages[currentPageId]
        }
        
    }
}



struct View2: View {
    @State private var isSelected = false // State to track selection
//    var callback : () -> Void
    var body: some View {
        ZStack {
            Color(.black).opacity(0.9).ignoresSafeArea()
            VStack {
                Text("First up, which product do you use the most?").font(.largeTitle).foregroundStyle(.white).padding(.top,50).padding(.horizontal,20)
                ForEach(0..<2) { item in
                    VStack(alignment:.leading) {
                        HStack() {
                            HStack {
                                ZStack {
                                    Circle().fill(.white).frame(width:80,height: 80)
                                    Image("LogoBlack").resizable().frame(width: 75,height: 75).padding(.all).clipShape(.circle)
                                }
                                Text("Mens \(item)").foregroundStyle(.gray)
                                    .padding()
                            }
                            Spacer()
                            // Radio button
                            Circle().stroke(.gray, lineWidth: 2).frame(width: 25)
                                .overlay(
                                    Circle()
                                        .fill(isSelected ? Color.white : .black.opacity(0.9))
                                        .frame(width: 25)
                                        .onTapGesture {
                                            isSelected.toggle()
                                        }
                                ).padding(.trailing,20)
                        }.padding(.leading,20)
                        Divider().background(.white)
                        
                    }
                }
                Spacer()
            }
            VStack(alignment:.center){
                Spacer()
                NavigationLink(destination: {
                    MainRoute()
                }, label: {
                    Text("Done")
                        .foregroundColor(.black)
                        .padding(.horizontal,50).padding(.vertical,20)
                        .background(.white)
                        .cornerRadius(30)
                    .padding(.bottom, 30)
                })
                
            }
        }
    }
}

struct View1: View {
    var callback: () -> Void
    var body: some View {
        ZStack {
            // this is the hack to fit image in screen : .frame(minWidth:0,maxWidth:.infinity)
            
            Image("HomeItem1").resizable().aspectRatio(contentMode: .fill).frame(minWidth: 0,maxWidth: .infinity).blur(radius: 1.5).edgesIgnoringSafeArea(.all)
            VStack {
                CustomSpace(height: 50)
                Text("To personalize your experience and connect you to sport, we’ve got a few questions for you.").font(.largeTitle.weight(.medium)).foregroundColor(.white).padding()
                Spacer() // Push the rest of the content to the bottom
            }
            
            VStack(alignment:.center){
                Spacer()
                Button(action: callback, label: {
                    Text("Get Started")
                        .foregroundColor(.black)
                        .padding(.horizontal,50).padding(.vertical,20)
                        .background(.white)
                        .cornerRadius(30)
                        .padding(.bottom, 30)
                })
                
            }
        }
    }
}


#Preview {
    GetStartedPage()
}

