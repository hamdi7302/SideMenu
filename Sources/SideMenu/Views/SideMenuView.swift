//
//  SideMenuView.swift
//
//
//  Created by hamdi on 11/9/2024.
//

import SwiftUI

public struct SideMenuView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel: SideMenuViewModel
    
    public init(viewModel: SideMenuViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        ZStack (alignment: .topLeading){
            LinearGradient(gradient: Gradient(colors: [.cyan, .black, .black, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack(spacing: 0){
                ProfileView()
                Divider()
                Spacer()
                AppLogo()
                SideMenuContent(items: viewModel.sideMenuButtons,viewModel: viewModel)
                
                Spacer()
                sidemenuFooter()
                    .font(.headline)
            }.padding()
                .frame(maxWidth: 250)
//                .background(colorScheme == .dark ? .black : .white)
                
                .cornerRadius(12)
                .shadow(radius: 10)
            
            
            NavigationView(content: {
                VStack{
                    viewModel.desiredContent.cornerRadius(12)
                }
                .padding()
                .navigationTitle(viewModel.selectedButton.title)
                
            }) .cornerRadius(12)
                .scaleEffect(0.8)
                .offset(x: 150)
                .background {
                    Color.primary.opacity(0.2)
                        .cornerRadius(12)
                        .scaleEffect(0.75)
                        .offset(x: 125)
                        .background {
                            Color.primary.opacity(0.2)
                                .cornerRadius(12)
                                .scaleEffect(0.7)
                                .offset(x: 100)
                        }
                }
        }
//        Circle().frame(width: 50, height: 50, alignment: .trailing)
        
    }
}

//#Preview {
//    SwiftUIView()
//}
