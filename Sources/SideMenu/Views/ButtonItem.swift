//
//  ButtonItem.swift
//
//
//  Created by hamdi on 11/9/2024.
//

import SwiftUI

struct ButtonItem: View {
    @ObservedObject var viewModel: SideMenuViewModel
    var sideMenuButton: SideMenuButton
    var body: some View {
        HStack{
            Image(systemName: sideMenuButton.image)
                .resizable()
                .scaledToFit()
                .frame( height: 30)
            Text(sideMenuButton.title)
        }.padding()
    }
}

//#Preview {
//    ButtonItem(viewModel: SideMenuView(viewModel: SideMenuViewModel), sideMenuButton: SideMenuButton(title: "Movie", image: "popcorn.circle.fill", sectionType: .Main))
//}
