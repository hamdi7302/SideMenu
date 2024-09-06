//
//  SideMenuContent.swift
//  AsyncApp
//
//  Created by hamdi on 21/8/2024.
//

import Foundation
import SwiftUI

enum Sextion :  String, Equatable {
    case main
    case tools
    case others
}


public struct SideMenuContent< Content: View , Tool: View>: View {
    var content : Content
    var tool : Tool
    @Binding var selection : ImageButtonItem
    @State var SideButtons : [ImageButtonItem] = []
    @State var ToolsButtons : [ImageButtonItem] = []
    @State var SettingsButtons : [ImageButtonItem] = []
    
    @State var showMenu : Bool = true
    public  init( selection : Binding<ImageButtonItem>, @ViewBuilder content:() -> Content, @ViewBuilder tool:() -> Tool)
    {
        self.content = content()
        _selection  = selection
        self.tool = tool()
        
    }
    
    public var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            Color.gray.ignoresSafeArea().opacity(0.5)
            
            SideMenu(selectedSide: $selection, mainSideButtons: $SideButtons, othersSideButtons: $ToolsButtons, settingsSideButtons: $SettingsButtons)
            
            ZStack {
                
                Color.white.opacity(0.5)
                    .cornerRadius(12.0)
                    .offset(x: showMenu ?  -20 : 0)
                    .shadow(color: .black.opacity(0.07), radius: 5, x: -5, y: 0.0)
                    .padding(.vertical , 20)
                
                Color.white.opacity(0.5)
                    .cornerRadius(12.0)
                    .offset(x: showMenu ?  -40 : 0)
                    .shadow(color: .black.opacity(0.07), radius: 5, x: -5, y: 0.0)
                    .padding(.vertical , 50)
                
                NavigationView {
                    ZStack {
                        content
                            .cornerRadius(12.0)
                            .shadow(color: .black.opacity(0.07), radius: 5, x: -5, y: 0.0).onTapGesture {
                                withAnimation(.easeInOut) {
                                    showMenu = false
                                }
                            }
                            .ignoresSafeArea()
                        tool
                            .cornerRadius(12.0)
                            .shadow(color: .black.opacity(0.07), radius: 5, x: -5, y: 0.0)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    showMenu = false
                                }
                            }
                            .ignoresSafeArea()
                        
                    } .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text(selection.title)
                                .font(.headline)  // Customize the font
                                .foregroundColor(selection.color)  // Customize the color of the Nav Bar
                        }
                    }
                }
            }
            
            .scaleEffect(showMenu ? 0.84 : 1 )
            .offset(x: showMenu ?  300 : 0)
            Button(action: {
                withAnimation(.easeOut) {
                    showMenu =  true
                }
            }, label: {
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(showMenu ? Color.clear : Color.primary )
                    .padding()
            }
            )
            
        }
        .onChange(of: selection, perform: { value in
            withAnimation(.easeInOut) {
                withAnimation(.easeInOut) {
                    showMenu = false
                }
            }
        })
        .onPreferenceChange(SideItemPreferenceKey.self, perform: { preferences in
            
            for (section, items) in preferences {
                switch section {
                case .main:
                    // Handle section 1
                    print("Section 1 items: \(items)")
                    SideButtons.append(contentsOf: items)
                case .tools:
                    // Handle section 2
                    print("Section 2 items: \(items)")
                    ToolsButtons.append(contentsOf: items)
                    // Add more cases for other sections as needed
                case .others:
                    print("Section 2 items: \(items)")
                }
            }
        })
    }
}

extension SideMenuContent where Tool == EmptyView{
    public init(selection : Binding<ImageButtonItem> , @ViewBuilder content: () -> Content){
        self.init(selection: selection, content: content) {
        }
    }
}


