//
//  ImageButtonItem.swift
//  AsyncApp
//
//  Created by hamdi on 21/8/2024.
//

import Foundation
import SwiftUI

struct ImageButtonItem :  Identifiable , Equatable  {
    var id = UUID()
    var title: String
    var logo: String
    var color : Color
    
    static func == (lhs: ImageButtonItem, rhs: ImageButtonItem) -> Bool {
        return lhs.title == rhs.title &&
        lhs.logo == rhs.logo &&
        lhs.color == rhs.color
    }
    
}

