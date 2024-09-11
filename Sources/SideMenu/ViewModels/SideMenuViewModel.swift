//
//  SwiftUIView.swift
//  
//
//  Created by hamdi on 11/9/2024.
//

import SwiftUI

public class SideMenuViewModel: ObservableObject {
    
    @Published var selectedButton: SideMenuButton{
        didSet{
            buttonTapped(selectedButton)
        }
    }
    @Published var sideMenuButtons: [SideMenuButton]
    @Published var showMenu: Bool = true
    @Published var desiredContent: AnyView = AnyView(Color.clear)
    
    let contentLoader: ContentLoader
    var buttonsProvider: [String] {
        return sideMenuButtons.map { $0.title }
    }
    
    func buttonTapped(_ sideButton : SideMenuButton) {
        getContent(by: sideButton.title)
       }
    
    func getContent(by title: String ) {
        desiredContent = contentLoader.loadContent(with: title)
    }
    
public init(sideMenuButtons: [SideMenuButton], contentLoader: ContentLoader) {
        assert(!sideMenuButtons.isEmpty, "SideMenuButtons should not be empty.")
        self.sideMenuButtons = sideMenuButtons
        self.selectedButton = sideMenuButtons.first!
        self.contentLoader = contentLoader
        getContent(by: sideMenuButtons.first!.title)
      
    }
}


//
//  SwiftUIView.swift
//
//
//  Created by hamdi on 9/9/2024.
//

import SwiftUI


//struct SideMenuPreview: PreviewProvider {
//
//    static let buttonsProvider = {return buttons.map({$0.title})}()
//    static let buttons = [
//        SideMenuButton(title: "Movie", image: "movieclapper", sectionType: SectionType.Main),
//        SideMenuButton(title: "Series", image: "play.rectangle", sectionType: SectionType.Main),
//        SideMenuButton(title: "Favoris", image: "star.square", sectionType: SectionType.Main),
//        SideMenuButton(title: "Settings", image: "gearshape", sectionType: SectionType.Settings),
//        SideMenuButton(title: "Tools", image: "rectangle.on.rectangle.badge.gearshape", sectionType: SectionType.Tools)
//    ]
//    static var previews: some View {
//
//
//        SideMenuView(
//            content: ZStack {
//                // Your content goes here
//            },
//            viewModel: SideMenuViewModel(sideMenuButtons: buttons, contentLoader: MyContentLoader(buttonsTitle: buttonsProvider))
//        )
//    }
//}





 



 

struct sidemenuFooter: View {
    var body: some View {
        VStack{
            Text("Version: 1.0.0")
                .fontWeight(.bold)
            HStack{
                Image(systemName: "bolt")
                Text("Powered by:")
                Text("Youu")
                    .fontWeight(.bold)
            }
        }
        .font(.caption)
        .padding()
    }
}




struct ContentPresentation: View {
    let arrayMovie = ["movie1", "movie2", "movie3", "movie4", "movie5"]
    
    var body: some View {
        VStack(spacing: 20) {
            // Trending Section
            SectionHeaderView(title: "Trending")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(1...5, id: \.self) { index in
                        Image("movie\(index)")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                            .cornerRadius(12.0)
                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 0)
                        
                    }
                }
                .padding()
            }
             
             
            // All Movies Section
            SectionHeaderView(title: "All Movies")
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(arrayMovie.indices.reversed(), id: \.self) { index in
                        Image(arrayMovie[index])
                            .resizable()
                        
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                            .cornerRadius(10.0)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 2)
                    }
                }
                .padding()
            }
            
            Spacer()
        }
        .padding(.top, 20)
        .background(Color.random()) // Light background color for contrast
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding(.horizontal)
    }
}


public extension Color {

    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}
