//
//  View+.swift
//  AsyncApp
//
//  Created by hamdi on 28/3/2024.
//

import Foundation
import SwiftUI

extension View {
    public func getRect () -> CGRect {
        return UIScreen.main.bounds
    }
    
    public func addSideMenuButton(item : ImageButtonItem , selected : Binding<ImageButtonItem> ) -> some View {
        self.modifier(SideButton(item: item, section: .main, selected: selected))
        
    }
    
    public func addSideToolButton(item : ImageButtonItem , selected : Binding<ImageButtonItem>  ) -> some View {
        self.modifier(SideButton(item: item, section: .tools, selected: selected))
    }
}
 

