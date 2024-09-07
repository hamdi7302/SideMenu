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
    
    private let sectionSpacing: CGFloat = 16
    
    public var body: some View {
        VStack {
            headerView
            Divider()
            sideMenuContent
            Spacer()
            footerView
        }
        .padding()
    }
    
    // MARK: - Header View
    private var headerView: some View {
        VStack(alignment: .leading, spacing: sectionSpacing) {
            Image(systemName: "apple.logo")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(Color.black)
                .scaledToFit()
                .frame(height: 60)
            
            Text("Movie App")
                .font(.headline)
        }
    }
    
    // MARK: - Side Menu Content
    private var sideMenuContent: some View {
        VStack(alignment: .leading, spacing: sectionSpacing) {
            sectionView(title: "Content", buttons: mainSideButtons)
            if !othersSideButtons.isEmpty {
                sectionView(title: "Tools", buttons: othersSideButtons)
            }
            if !settingsSideButtons.isEmpty {
                sectionView(title: "Others", buttons: settingsSideButtons)
            }
        }
        .padding()
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
