//
//  SignupPage.swift
//  NikeClone
//
//  Created by nex on 03/06/2024.
//

import SwiftUI

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
    var body: some View {
        HStack{
            Button(action: {
                showingAlert = true
            }, label:{
                Text("Join Us").padding(.horizontal,40).padding(.vertical,15)
            }).foregroundColor(.black).background().cornerRadius(25
            ).padding(.trailing,10).alert(isPresented: $showingAlert, content: {
                
                Alert(
                    title: Text("Permission Needed"),
                    message: Text("We need your permission to access the camera."),
                    primaryButton: .default(Text("Continue")) {
                        // Handle "OK" action here
                        
                    },
                    secondaryButton: .cancel()
                )
                
            })
            Button(action: {
                print("Sign in")
            }, label: {
                Text("Sign in").foregroundColor(.white).padding(.horizontal,40).padding(.vertical,15)
            }).background(
                RoundedRectangle(cornerRadius: 25.0).fill(.clear).strokeBorder(.white)
            )
            
            
        }
    }
}
