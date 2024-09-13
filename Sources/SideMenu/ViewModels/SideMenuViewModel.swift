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
            showMenu.toggle()
        }
    }
    @Published var sideMenuButtons: [SideMenuButton]
    @Published var showMenu: Bool = true
    @Published var desiredContent: AnyView = AnyView(Color.clear)
    @Published var showMenuAndSearchButton: Bool = false
    
    let contentLoader: ContentLoader
    var buttonsProvider: [String] {
        return sideMenuButtons.map { $0.title }
    }
    
    func buttonTapped(_ sideButton : SideMenuButton) {
        getContent(by: sideButton.title)
    }
    
    func getContent(by title: String) {
        desiredContent = contentLoader.loadContent(with: title)
        showMenuAndSearchButton = true
    }
    
    public init(sideMenuButtons: [SideMenuButton], contentLoader: ContentLoader) {
        assert(!sideMenuButtons.isEmpty, "SideMenuButtons should not be empty.")
        self.sideMenuButtons = sideMenuButtons
        self.selectedButton = sideMenuButtons.first!
        self.contentLoader = contentLoader
        getContent(by: sideMenuButtons.first!.title)
    }
}


