SideMenu Framework
Overview
SideMenu is a versatile and customizable SwiftUI framework designed to enhance user navigation with a dynamic side menu experience. Perfect for iOS applications that require intuitive and fluid menu interactions, SideMenu provides a robust and flexible solution for integrating side menus into your app's user interface.

Features
Customizable Side Menu: Easily create and configure side menus with various styles and options to match your app’s design.
Dynamic Content: Add and manage side menu items dynamically based on user interactions or application state.
Integration with Tab Views: Seamlessly integrate with Tab Views to provide a cohesive navigation experience.
Smooth Animations: Enjoy smooth and responsive animations for menu transitions and interactions.
Extensible and Modular: Designed with extensibility in mind, allowing you to customize and extend the framework to meet your specific needs.
Installation
Swift Package Manager
Add the following dependency to your Package.swift file:

swift
Copy code
dependencies: [
    .package(url: "https://github.com/hamdi7302/SideMenu.git", from: "1.0.0")
 

swift
Copy code
import SideMenu
Create and configure the side menu:

swift
Copy code
struct ContentView: View {
    @State private var selectedItem = ImageButtonItem(title: "Movies", logo: "movieclapper.fill", color: .orange)
    
    var body: some View {
        SideMenuContent(selection: $selectedItem) {
            // Your main content here
        } tool: {
            // Your tool section here
        }
    }
}
Documentation
For detailed documentation and usage examples, please refer to the documentation.

