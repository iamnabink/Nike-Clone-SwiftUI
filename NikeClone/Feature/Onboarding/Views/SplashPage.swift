//
//  SplashPage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI

struct SplashPage: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            Image("LogoWhite")          .
            resizable()
                .scaledToFit() // Or .scaledToFill() depending on your requirement
                .frame(width: 120, height: 120) // Adjust the frame size as needed
                .clipped() // Ensures the image does not overflow the frame
                .padding(.all, 20) // Adds 20 points of padding to all sides
        }
    }
}

#Preview {
    SplashPage()
}
