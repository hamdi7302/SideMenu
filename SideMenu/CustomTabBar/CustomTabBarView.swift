//
//  CustomTabBarView.swift
//  AsyncApp
//
//  Created by hamdi on 24/3/2024.
//

import SwiftUI

public struct CustomTabBarView: View {
    
    let tabs : [TabBarItem]
    @Binding var selection : TabBarItem
    @Namespace private var nameSpace
    
     func tabView (_ tabItem :  TabBarItem) -> some View {
        VStack{
            Image(systemName: tabItem.iconName)
                .font(.subheadline)
            Text(tabItem.title).font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tabItem ? tabItem.color : Color.gray)
        .padding(.vertical,8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                if (selection == tabItem) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tabItem.color.opacity(0.2))
                        .matchedGeometryEffect(id: "anyid", in:  nameSpace)
                }
            }
           
        )
    }
    private func switchToSelectionTab (_ selectionTab : TabBarItem){
        withAnimation(.easeInOut) {
            selection = selectionTab
        }
    }
    
    public var body: some View
    {
        tabBarVersion()
    }
}

extension CustomTabBarView {
    
    func tabBarVersion () -> some View {
        
        VStack {
            HStack{
                ForEach(tabs , id: \.self) { tabItem in
                    tabView(tabItem).onTapGesture {
                        
                        switchToSelectionTab(tabItem)
                        
                    }
                }
            }.padding(6)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5)
                .padding(.horizontal,20)
        }
        
    }
}


#Preview {
    CustomTabBarView(tabs: [.movie,.serie], selection: .constant(.movie))
}
