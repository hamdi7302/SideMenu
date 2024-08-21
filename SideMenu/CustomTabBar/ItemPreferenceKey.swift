//
//  ItemPreferenceKey.swift
//  AsyncApp
//
//  Created by hamdi on 23/3/2024.
//

import Foundation
import SwiftUI



struct ItemPreferenceKey : PreferenceKey {
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
    
    
    static var defaultValue: [TabBarItem] = []
}

struct  TabBarItemViewModifier  : ViewModifier {
    var tab: TabBarItem
    var selected : TabBarItem
    func body(content: Content) -> some View  {
        content.opacity(tab == selected ? 1 : 0 )
            .preference(key: ItemPreferenceKey.self, value: [tab])
          
    }
}


extension View {
    
    func customTabItem(tab: TabBarItem , selected :  TabBarItem ) -> some View {
        self.modifier(TabBarItemViewModifier(tab: tab , selected : selected ))
    }
    
    
}


