//
//  ImageButtonItem.swift
//  AsyncApp
//
//  Created by hamdi on 21/8/2024.
//

import Foundation
import SwiftUI

public struct ImageButtonItem: Identifiable, Equatable {
    public var id = UUID()
    public var title: String
    public var logo: String
    public var color: Color

    // Explicit public initializer
    public init(title: String, logo: String, color: Color) {
        self.title = title
        self.logo = logo
        self.color = color
    }

    // Equatable conformance
    public static func == (lhs: ImageButtonItem, rhs: ImageButtonItem) -> Bool {
        return lhs.title == rhs.title &&
               lhs.logo == rhs.logo &&
               lhs.color == rhs.color
    }
}
