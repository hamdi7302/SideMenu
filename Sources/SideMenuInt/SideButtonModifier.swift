//
//  SideButtonModifier.swift
//  AsyncApp
//
//  Created by hamdi on 21/8/2024.
//

import Foundation
import SwiftUI


struct SideButton : ViewModifier{
    var item :  ImageButtonItem
    var section :  Sextion
    @Binding var selected :  ImageButtonItem
    func body(content: Content) -> some View {
        content.opacity(item == selected ? 1 : 0  ).preference(key:  SideItemPreferenceKey.self , value: [section:[item]] )
    }
}

