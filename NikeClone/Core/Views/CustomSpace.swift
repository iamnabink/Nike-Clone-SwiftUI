//
//  CustomSpace.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 03/06/2024.
//

import SwiftUI

struct CustomSpace: View {
    
    var width: CGFloat? = 10
    var height: CGFloat? = 10
    
    var body: some View {
        Spacer().frame(width:width,height:height)
    }
}

