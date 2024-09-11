//
//  SwiftUIView.swift
//  
//
//  Created by hamdi on 11/9/2024.
//

import SwiftUI

struct SideMenuContent: View {
    var categorieItem: [SectionType:[SideMenuButton]]
    @ObservedObject var viewModel: SideMenuViewModel
    init(items: [SideMenuButton], viewModel: SideMenuViewModel) {
        self.viewModel = viewModel
        self.categorieItem = Dictionary(grouping: items, by: { $0.sectionType })
    }
    
    var body: some View {
        VStack {
            ForEach(Array(categorieItem.keys).sorted(by: {$0.sortOrder < $1.sortOrder}), id: \.self) { key in
                Divider()
                    HStack{
                        Text(key.rawValue)
                            .font(.headline)
                        Spacer()
                    }
                    HStack{
                        SideMenuCategorieContent(subitems: categorieItem[key]!,viewModel: viewModel)
                        Spacer()
                    }
            }
        }.padding()
    }
}
