# SideMenu Swift Package

`SideMenu` is a SwiftUI package for creating a customizable side menu with dynamic content loading capabilities, leveraging MVVM architecture and dependency injection (DI). 
This package provides an easy-to-integrate solution for side menus with dynamic content.

## Features

- **Customizable Side Menu**: Easily configure buttons and their appearances.
- **Dynamic Content Loading**: Load different views based on the selected menu item.
- **SwiftUI Integration**: Seamlessly integrates with SwiftUI projects.
- **Swift Package Manager (SPM)**: Simple integration with SPM.

## Requirements

- **iOS**: 14.0+
- **Xcode**: 12.0+
- **Swift**: 5.3+

## Installation

### Swift Package Manager (SPM)

To add `SideMenu` to your project:

1. Open your project in Xcode.
2. Navigate to `File` > `Add Packages...`.
3. Enter the following URL in the search bar:  
https://github.com/hamdi7302/SideMenuPackage
4. Choose the package and add it to your project.

## Usage

### 1. Define Side Menu Buttons

Create instances of `SideMenuButton` to represent each item in the side menu. Each button requires a title, an image, and a section type.

```swift
let buttons = [
 SideMenuButton(title: "Movie", image: "movieclapper", sectionType: SectionType.Main),
 SideMenuButton(title: "Series", image: "play.rectangle", sectionType: SectionType.Main),
 SideMenuButton(title: "Tools", image: "wrench", sectionType: SectionType.Tools)
]
```

### 2. Create a Content Loader
```swift
class MyContentLoader: ContentLoader {
    private var buttonsTitle: [String]

    init(buttonsTitle: [String]) {
        self.buttonsTitle = buttonsTitle
    }

    func loadContent(with title: String) -> AnyView {
        switch title {
        case "Movie":
            return AnyView(ContentPresentation()) // Replace with your movie view
        case "Series":
            return AnyView(ContentPresentation()) // Replace with your series view
        case "Tools":
            return AnyView(ContentPresentation()) // Replace with your tools view
        default:
            return AnyView(Text("Not Available \(title) Content"))
        }
    }
}
```
### 3. Use the Side Menu in Your View

```swift
struct ContentView: View {
    var body: some View {
        SideMenuView(viewModel: SideMenuViewModel(sideMenuButtons: buttons, 
                     contentLoader: MyContentLoader(buttonsTitle: buttons.map { $0.title }))
    }
}
```


