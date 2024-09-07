//
//  SideMenuContent.swift
//  AsyncApp
//
//  Created by hamdi on 21/8/2024.
//

import Foundation
import SwiftUI

enum Sextion: String, Equatable {
    case main
    case tools
    case others
}

public struct SideMenuContent<Content: View, Tool: View>: View {
    var content: Content
    var tool: Tool
    @Binding var selection: ImageButtonItem
    @State private var sideButtons: [ImageButtonItem] = []
    @State private var toolsButtons: [ImageButtonItem] = []
    @State private var settingsButtons: [ImageButtonItem] = []
    @State private var showMenu: Bool = true
    
    public init(selection: Binding<ImageButtonItem>, @ViewBuilder content: @escaping () -> Content, @ViewBuilder tool: @escaping () -> Tool) {
        self.content = content()
        _selection = selection
        self.tool = tool()
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            backgroundOverlay
            sideMenuView
            mainContentView
            menuToggleButton
        }
        .onChange(of: selection) { _ in
            toggleMenu(show: false)
        }
    }

    // Background overlay with opacity
    private var backgroundOverlay: some View {
        Color.gray.ignoresSafeArea().opacity(0.5)
    }
    
    // Side menu with buttons
    private var sideMenuView: some View {
        SideMenu(selectedSide: $selection,
                 mainSideButtons: $sideButtons,
                 othersSideButtons: $toolsButtons,
                 settingsSideButtons: $settingsButtons)
    }
    
    // Main content with tool overlay and NavigationView
    private var mainContentView: some View {
        ZStack {
            backgroundLayers
            NavigationView {
                ZStack {
                    contentWithToolView
                }
                .padding()
                .cornerRadius(12)
                .navigationTitle(selection.title)
                .navigationBarTitleDisplayMode(.large)
                .onPreferenceChange(SideItemPreferenceKey.self, perform: handleSideItemPreferences)
            }
        }
        .background(Color.clear)
        .scaleEffect(showMenu ? 0.84 : 1)
        .offset(x: showMenu ? 200 : 0)
    }

    // Background layers with offset and shadow
    private var backgroundLayers: some View {
        ZStack {
            layerView(offset: showMenu ? -20 : 0, verticalPadding: 20)
            layerView(offset: showMenu ? -40 : 0, verticalPadding: 50)
        }
    }
    
    // Single layer view with offset, shadow, and corner radius
    private func layerView(offset: CGFloat, verticalPadding: CGFloat) -> some View {
        Color.white.opacity(0.5)
            .cornerRadius(12)
            .offset(x: offset)
            .shadow(color: .black.opacity(0.07), radius: 5, x: -5, y: 0)
            .padding(.vertical, verticalPadding)
    }
    
    // Content with tool and onTapGesture to close menu
    private var contentWithToolView: some View {
        ZStack {
            contentView
            toolView
        }
        .onTapGesture { toggleMenu(show: false) }
    }
    
    // Content view
    private var contentView: some View {
        content
            .shadow(color: .black.opacity(0.07), radius: 5, x: -5, y: 0)
    }
    
    // Tool view
    private var toolView: some View {
        tool
            .shadow(color: .black.opacity(0.07), radius: 5, x: -5, y: 0)
    }
    
    // Menu toggle button
    private var menuToggleButton: some View {
        Button(action: { toggleMenu(show: true) }) {
            Image(systemName: "line.3.horizontal")
                .foregroundColor(showMenu ? .clear : .primary)
                .padding()
        }
    }

    // Handle changes to side item preferences
    private func handleSideItemPreferences(_ preferences: [Sextion: [ImageButtonItem]]) {
        for (section, items) in preferences {
            switch section {
            case .main:
                sideButtons.append(contentsOf: items)
            case .tools:
                toolsButtons.append(contentsOf: items)
            case .others:
                break
            }
        }
    }
    
    // Toggle menu visibility with animation
    private func toggleMenu(show: Bool) {
        withAnimation(.easeInOut) {
            showMenu = show
        }
    }
}

// Extension for tool being EmptyView
extension SideMenuContent where Tool == EmptyView {
    public init(selection: Binding<ImageButtonItem>, @ViewBuilder content: @escaping () -> Content) {
        self.init(selection: selection, content: content, tool: { EmptyView() })
    }
}
