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
    @State var showNeededButton =  false
        
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
                .navigationBarTitleDisplayMode(.inline)
                
            }) .cornerRadius(12)
                .scaleEffect(viewModel.showMenu ? 0.8 : 1 )
                .offset(x: viewModel.showMenu ? 150 : 0)
                .animation(.smooth (duration: 0.75), value: viewModel.showMenu)
                .onTapGesture {
                    guard viewModel.showMenu else {return}
                    viewModel.showMenu.toggle()
                }
            //                .applyContentBackground(scaleEffect: animate ? 0.75 : 0.8, offsetRadiusX: animate ?  120 : 150)
            //                .animation(.bouncy(duration: 2), value: animate)
            //                .applyContentBackground(scaleEffect: animate ? 0.7 : 0.8, offsetRadiusX: animate ?  90 : 150)
            //                .animation(.bouncy(duration: 2), value: animate)
                .ignoresSafeArea()
            
            
            //                .background {
            //                    Color.primary.opacity(0.2)
            //                        .cornerRadius(12)
            //                        .scaleEffect(0.75)
            //                        .offset(x: 125)
            //                        .background {
            //                            Color.primary.opacity(0.2)
            //                                .cornerRadius(12)
            //                                .scaleEffect(0.7)
            //                                .offset(x: 100)
            //                        }
            //                }.animation(.easeInOut(duration: 2).repeatForever(autoreverses: false))
            
          
                if   showNeededButton {
                    HStack{
                        Button(action: {
                            viewModel.showMenu.toggle()
                        }, label: {
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: 30, height: 30)
                                .shadow(color: .gray.opacity(0.6), radius: 6, x: 0, y: 3)
                                .overlay(
                                    Image(systemName: false ? "xmark" : "list.dash")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.cyan)
                                )
                                .padding(.leading)
                        })
                    }  .transition(.opacity)
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            //                            viewModel.showMenu.toggle()
                        }, label: {
                            Circle()
                                .foregroundColor(.clear)
                                .frame(width: 30, height: 30)
                                .shadow(color: .gray.opacity(0.6), radius: 6, x: 0, y: 3)
                                .overlay(
                                    Image(systemName: false ? "xmark" : "magnifyingglass")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.cyan)
                                )
                                .padding(.trailing)
                        })
                    }.transition(.opacity)
                    
                }
            
        
        } 
        .onReceive(viewModel.$showMenu) { newValue in
            // Perform actions based on the new value of showMenu
            if newValue == false  {
                // Action to perform when showMenu is true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                                   withAnimation {
                                       showNeededButton = true
                                   }
                               }
            } else {
                // Action to perform when showMenu is false
                showNeededButton = false
            }
        }
//
        
    }
}

//#Preview {
//    SwiftUIView()
//}




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
