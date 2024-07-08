//
//  Extensions.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 08/07/2024.
//

import Foundation
import SwiftUI

extension View {
    func withoutAnimation() -> some View {
        self.animation(nil, value: UUID())
    }
}
