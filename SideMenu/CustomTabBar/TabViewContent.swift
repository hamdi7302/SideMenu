//
//  CustomtabViewContent.swift
//  AsyncApp
//
//  Created by hamdi on 24/3/2024.
//

import SwiftUI

struct TabViewContent<Content> : View where Content : View  {
    
    var content : Content
    @Binding var selection: TabBarItem
    @State var tabs: [TabBarItem] = []
    
    public init(selection: Binding<TabBarItem>, @ViewBuilder content:() -> Content)
    {
        self.content = content()
        _selection  = selection
    }
    
    var body: some View {
        ZStack(alignment: .bottom){
            content
            CustomTabBarView(tabs: tabs , selection: $selection).padding()
            }
           
        .onPreferenceChange(ItemPreferenceKey.self, perform: { tab in
            tabs.append(contentsOf: tab)
        })
        
    }
}
 




