//
//  File.swift
//  
//
//  Created by hamdi on 12/9/2024.
//

import Foundation
import SwiftUI



 
struct SideMenuContentBackground: ViewModifier {
    
    var animate: Bool = false
    var color: Color
    var cornerRadius: CGFloat
    var scaleEffect: CGFloat
    var offsetRadiusX: CGFloat
    var animationDuration: Double
 
        
    func body(content: Content) -> some View {
        content
            .background(
                color
                    .opacity(0.2)
                    .cornerRadius(12)
                    .scaleEffect(scaleEffect)
                    .offset(x: offsetRadiusX )
//                    .animation(.easeIn(duration: animationDuration), value: offsetRadiusX)
            )
    }
}

extension View {
    /// if you need any adpt to parse you can add with deffault values
    func applyContentBackground (scaleEffect: CGFloat = 0.75, offsetRadiusX: CGFloat = 125) -> some View {
        modifier(SideMenuContentBackground(color: Color.primary, cornerRadius: 12, scaleEffect: scaleEffect, offsetRadiusX: offsetRadiusX, animationDuration: 2))
    }
}
