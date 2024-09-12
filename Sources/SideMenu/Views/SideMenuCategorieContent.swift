//
//  SwiftUIView.swift
//  
//
//  Created by hamdi on 11/9/2024.
//

import SwiftUI

struct SideMenuCategorieContent: View {
  
    var subitems: [SideMenuButton]
    @ObservedObject var viewModel: SideMenuViewModel

    var body: some View {
        VStack(spacing: 0) {
            ForEach(subitems) { item in
                Button(action: {
                    viewModel.selectedButton = item
                    
                }, label: {
                    ButtonItem(viewModel: viewModel, sideMenuButton: item)
                        .foregroundColor(.primary)
                })
            }
        }
    }
}

 

//#Preview {
//    SideMenuCategorieContent(subitems: [SideMenuButton(title: "Movie", image: "popcorn.circle.fill", sectionType: .Main)], viewModel: SideMenuViewModel(sideMenuButtons: [SideMenuButton(title: "Movie", image: "popcorn.circle.fill", sectionType: .Main)], contentLoader: <#T##any ContentLoader#>))
//}
