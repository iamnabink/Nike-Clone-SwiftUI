//
//  SignupPage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI
import WebKit

struct SignupPage: View {
    var body: some View {
        ZStack(alignment: .leading){
            Background()
            SignupContent()
            
        }
    }
}

struct SignupContent: View {
    
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            Image("LogoWhite").resizable().frame(width: 80,height: 80)
            Text("Nike App Bringing Nike Members the best products, inspiration and stories in sport.").foregroundColor(.white).font(.system(size: 30)).padding(.bottom,20)
            Buttons()
            CustomSpace(height: 20) //custom height box
            
        }.padding(.all,30)
    }
}



#Preview {
    SignupPage()
}

struct Background: View {
    var body: some View {
        Image("SignUpBGImage").resizable().edgesIgnoringSafeArea(.all)
    }
}

struct Buttons: View {
    @State private var showingAlert = false
    @State private var showingWebView = false
    var body: some View {
        HStack{
            Button(action: {
                showingAlert = true
            }, label:{
                Text("Join Us").padding(.horizontal,40).padding(.vertical,15)
            }).foregroundColor(.black).background().cornerRadius(25
            ).padding(.trailing,10).alert(isPresented: $showingAlert, content: {
                
                Alert(
                    title: Text("“Nike” Wants to Use “nike.com” to Sign In"),
                    message: Text("This allows the app ans website to share information about you."),
                    primaryButton: .default(Text("Continue")) {
                        
                        
                    },
                    secondaryButton: .cancel()
                )
                
            })
            
            
            Button(action: {
                showingWebView = true
            }, label: {
                Text("Sign in").foregroundColor(.white).padding(.horizontal,40).padding(.vertical,15)
            }).background(
                RoundedRectangle(cornerRadius: 25.0).fill(.clear).strokeBorder(.white)
            ).sheet(isPresented: $showingWebView, content: {
                ZStack {
                    
                    CustomBottomSheet(showingWebView:$showingWebView)
                    
                }
            })
        }
    }
    
    struct CustomBottomSheet: View {
        @Binding var showingWebView: Bool
        @ObservedObject var webViewModel = WebViewModel(url: "https://www.nike.com/login")

        var body: some View {
            VStack {
                VStack{
                    CustomSpace(height: 10)
                    HStack {
                        Button(action: {
                            // Cancel action
                            showingWebView = false
                        }) {
                            Text("Cancel")
                            
                        }
                        Spacer()
                        Button(action: {
                            // Reload action
                            //                                       reloadContent()
                        }) {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                    .padding()
                    Divider()
                }.background(.gray.opacity(0.1))
                
                ZStack {
                    CustomWebView(webViewModel: webViewModel)
                    if webViewModel.isLoading {
                                        ProgressView()
                                            .frame(height: 30)
                                    }
                }
            }
        }
    }
}

