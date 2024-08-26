//
//  CustomtabViewContent.swift
//  AsyncApp
//
//  Created by hamdi on 24/3/2024.
//

import SwiftUI

public struct TabViewContent<Content>: View where Content: View {

    public var content: Content
    @Binding public var selection: TabBarItem
    @State private var tabs: [TabBarItem] = []

    // Public initializer
    public init(selection: Binding<TabBarItem>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        _selection = selection
    }

    // Public body property
    public var body: some View {
        ZStack(alignment: .bottom) {
            content
            CustomTabBarView(tabs: tabs, selection: $selection)
                .padding()
        }
        .onPreferenceChange(ItemPreferenceKey.self) { tab in
            tabs.append(contentsOf: tab)
        }
    }
}




