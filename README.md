# SideMenu Package

A custom SwiftUI package to create a side menu with selectable items and tool buttons. This package simplifies the process of adding a side menu to your SwiftUI apps and managing state between the menu items and the main content.

## Features

- Customizable side menu with various buttons and icons.
- Easy integration with SwiftUI's state management using `@State`.
- Support for tool buttons in a side toolbar.

## Installation

### Swift Package Manager

1. Open your Xcode project.
2. Go to File > Add Packages.
3. Enter the URL of this repository.
4. Choose the latest version and add the package to your project.

## Usage

Here is an example of how to use the `SideMenu` package in your SwiftUI project.

### Basic Example

```swift
import SwiftUI
import SideMenu

struct MyView: View {
    @State var selected = ImageButtonItem(title: "Series", logo: "movieclapper.fill", color: .orange)
    @State var selectedTabbar: TabBarItem = .movie

    var body: some View {
        SideMenuContent(selection: $selected, content: {
            VStack {
                // Main TabView content
                TabViewContent(selection: $selectedTabbar) {
                    Color.blue.customTabItem(tab: .movie, selected: selectedTabbar)
                    Color.cyan.customTabItem(tab: .serie, selected: selectedTabbar)
                }
            }
            .addSideMenuButton(item: ImageButtonItem(title: "Movies", logo: "popcorn.fill", color: .blue), selected: $selected)
            
            VStack {
                Color.indigo
            }
            .addSideMenuButton(item: ImageButtonItem(title: "Series", logo: "movieclapper.fill", color: .indigo), selected: $selected)
            
            VStack {
                Color.brown
            }
            .addSideMenuButton(item: ImageButtonItem(title: "Podcasts", logo: "homepod.fill", color: .brown), selected: $selected)
        }, tool: {
            // Tool buttons in side toolbar
            Color.pink.addSideToolButton(item: ImageButtonItem(title: "Favorite", logo: "star.fill", color: .pink), selected: $selected)
            Color.gray.addSideToolButton(item: ImageButtonItem(title: "Settings", logo: "gearshape.fill", color: .gray), selected: $selected)
        })
    }
}
