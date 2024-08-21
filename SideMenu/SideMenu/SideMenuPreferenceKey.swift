//
//  SideMenuPreferenceKey.swift
//  AsyncApp
//
//  Created by hamdi on 21/8/2024.
//

import Foundation
import SwiftUI

struct SideItemPreferenceKey: PreferenceKey {
    typealias Value = Dictionary<Sextion, [ImageButtonItem]>
    
    static var defaultValue: Value = [:]
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        let next = nextValue()
        for (section, items) in next {
            value[section, default: []].append(contentsOf: items)
        }
    }
}

