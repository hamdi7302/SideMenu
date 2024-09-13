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
    @State var applyAnimationOnshowSideMenu =  false
    
    var backGroundView: some View {
        LinearGradient(gradient: Gradient(colors: [.cyan, .black, .black, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
    
    var sideLeftMenu: some View {
        ZStack (alignment: .topLeading){
            VStack(spacing: 0){
                ProfileView()
                Divider()
                Spacer()
                AppLogo()
                SideMenuContent(items: viewModel.sideMenuButtons,viewModel: viewModel)
                Spacer()
            }.padding()
                .frame(maxWidth: 250)
                .cornerRadius(12)
                .shadow(radius: 10)
        }
    }
    
    var content: some View{
        NavigationView(content: {
            VStack{
                viewModel.desiredContent.cornerRadius(12)
            }
            .padding()
            .navigationTitle(viewModel.selectedButton.title)
            .navigationBarTitleDisplayMode(.inline)
            
        }) .cornerRadius(12)
            .scaleEffect(viewModel.showMenu ? 0.75 : 1 )
            .offset(x: viewModel.showMenu ? 180 : 0)
            .animation(.easeOut (duration: 0.5), value: viewModel.showMenu)
            .applyContentBackground(scaleEffect: applyAnimationOnshowSideMenu ?   0.75 : 0.7, offsetRadiusX: applyAnimationOnshowSideMenu ?  180 : 150)
            .animation(.easeOut(duration: 1.25), value: applyAnimationOnshowSideMenu)
            .applyContentBackground(scaleEffect: applyAnimationOnshowSideMenu ? 0.75 : 0.65, offsetRadiusX: applyAnimationOnshowSideMenu ?  180 : 120)
            .animation(.easeOut(duration: 1.25), value: applyAnimationOnshowSideMenu)
            .onTapGesture {
                guard viewModel.showMenu else {return}
                viewModel.showMenu.toggle()
            }
        
            .ignoresSafeArea()
    }
    
    var showMenubarButton: some View {
        HStack{
            Button(action: {
                viewModel.showMenu.toggle()
            }, label: {
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 30, height: 30)
                    .shadow(color: .gray.opacity(0.6), radius: 6, x: 0, y: 3)
                    .overlay(
                        Image(systemName: "list.dash")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.cyan)
                    )
                    .padding(.leading)
            })
        }
    }
    var showSearchBarButton: some View {
        HStack{
            Spacer()
            Button(action: {
                //  viewModel.showMenu.toggle()
            }, label: {
                Circle()
                    .foregroundColor(.clear)
                    .frame(width: 30, height: 30)
                    .shadow(color: .gray.opacity(0.6), radius: 6, x: 0, y: 3)
                    .overlay(
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.cyan)
                    )
                    .padding(.trailing)
            })
        }.transition(.opacity)
    }
    
    public var body: some View {
        ZStack {
            backGroundView
            VStack{
                Spacer()
                sideMenuFooter()
                    .font(.headline)
            }
            ZStack (alignment: .topLeading){
                sideLeftMenu
                content
                if applyAnimationOnshowSideMenu {
                    showMenubarButton
                    showSearchBarButton
                }
            }
            .onReceive(viewModel.$showMenu) { newValue in
                if newValue == false  {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            applyAnimationOnshowSideMenu = true
                    }
                } else {
                    applyAnimationOnshowSideMenu = false
                }
            }
        }
    }
}

//Mark: For the Preview & Project that implement that package

class MyContentLoader: ContentLoader {
    private var buttonsTitle: [String]
    init(buttonsTitle: [String]) {
        self.buttonsTitle = buttonsTitle
    }
    
    func loadContent(with title: String) -> AnyView {
        switch title {
        case "Movie":
            AnyView(ContentPresentation())
        case "Series":
            AnyView(ContentPresentation())
        case "Tools":
            AnyView(ContentPresentation())
        default:
            AnyView(Text("Not Available \(title) Content "))
        }
    }
}


struct SideMenuPreview: PreviewProvider {
    
    static let buttonsProvider = {return buttons.map({$0.title})}()
    static let contentLoader = {return buttons.map({$0.title})}()
    static let buttons = [
        SideMenuButton(title: "Movie", image: "movieclapper", sectionType: SectionType.Main),
        SideMenuButton(title: "Series", image: "play.rectangle", sectionType: SectionType.Main),
        SideMenuButton(title: "Favoris", image: "star.square", sectionType: SectionType.Main),
        SideMenuButton(title: "Settings", image: "gearshape", sectionType: SectionType.Settings),
        SideMenuButton(title: "Tools", image: "rectangle.on.rectangle.badge.gearshape", sectionType: SectionType.Tools)
    ]
    static var previews: some View {
        
        
        SideMenuView(
            viewModel: SideMenuViewModel(sideMenuButtons: buttons, contentLoader: MyContentLoader(buttonsTitle: buttonsProvider))
        )
    }
}
