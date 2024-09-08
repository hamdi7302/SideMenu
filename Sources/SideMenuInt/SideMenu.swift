//
//  SideMenu.swift
//  AsyncApp
//
//  Created by hamdi on 28/3/2024.
//

import SwiftUI

public struct SideMenu: View {
    @Binding var selectedSide: ImageButtonItem
    @Binding var mainSideButtons: [ImageButtonItem]
    @Binding var othersSideButtons: [ImageButtonItem]
    @Binding var settingsSideButtons: [ImageButtonItem]
    
    public var body: some View {
        VStack {
            headerView
            Divider()
            menuSections
            Spacer()
            footerView
        }
        .padding()
    }
    
    // MARK: - Header View
    private var headerView: some View {
        VStack(alignment: .leading) {
            Image(systemName: "apple.logo")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color.black)
                .scaledToFit()
                .frame(height: 60)
            
            Text("Movie app")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading) // Ensure header is aligned to the left
    }
    
    // MARK: - Menu Sections
    private var menuSections: some View {
        VStack(alignment: .leading) {
            contentSection
            Divider()
            if !othersSideButtons.isEmpty {
                toolsSection
            }
            if !settingsSideButtons.isEmpty {
                othersSection
            }
        }
        .padding()
    }
    
    // MARK: - Content Section
    private var contentSection: some View {
        sectionView(title: "Content", buttons: mainSideButtons)
    }
    
    // MARK: - Tools Section
    private var toolsSection: some View {
        sectionView(title: "Tools", buttons: othersSideButtons)
    }
    
    // MARK: - Others Section
    private var othersSection: some View {
        sectionView(title: "Others", buttons: settingsSideButtons)
    }
    
    // MARK: - Section View
    private func sectionView(title: String, buttons: [ImageButtonItem]) -> some View {
        Section(header: Text(title).font(.headline)) {
            ForEach(buttons, id: \.id) { button in
                SideTapButton(sideButton: button, selected: $selectedSide)
            }
        }
    }
    
    // MARK: - Footer View
    private var footerView: some View {
        VStack {
            Text("Version: 1.0.0")
                .font(.caption)
                .fontWeight(.bold)
            
            HStack {
                Image(systemName: "bolt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10)
                
                Text("Powered by")
                    .font(.caption2)
                
                Text("Mee")
                    .font(.caption2)
                    .fontWeight(.bold)
            }
        }
        .ignoresSafeArea()
    }
}
