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
            VStack(alignment: .leading){
                Image(systemName: "apple.logo")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.black)
                    .scaledToFit()
                    .frame(height: 60)
                
                
                Text("Movie app ")
                    .font(.headline)
                Divider()
                HStack{
                    VStack(alignment: .leading){
                        
                        Section{
                            
                            ForEach(mainSideButtons, id : \.id) { button in
                                SideTapButton(sideButton : button, selected: $selectedSide)
                            }
                        }
                        
                        if !othersSideButtons.isEmpty {
                            Divider()
                            Section{
                                ForEach(othersSideButtons, id : \.id) { button in
                                    SideTapButton(sideButton : button, selected: $selectedSide)
                                }
                            } header: {
                                Text("Tools")
                                    .font(.headline)
                            }
                        }
                        
                        if !settingsSideButtons.isEmpty {
                            Section {
                                ForEach(settingsSideButtons, id : \.id) { button in
                                    SideTapButton(sideButton : button, selected: $selectedSide)
                                }
                                
                            }header: {
                                Text("Others")
                                    .font(.headline)
                            }
                        }
                        
                    }
                    Spacer()
                    
                }
                .padding()
                Spacer()
                
                Text("Version : 1.0.0")
                    .font(.caption)
                    .fontWeight(.bold)
                
            }.padding()
            
            
            HStack{
                Image(systemName: "bolt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10)
                HStack(spacing: 3){
                    Text("Powered by")
                        .font(.caption2)
                    
                    Text("Mee")
                        .font(.caption2)
                        .fontWeight(.bold)
                    
                }
            }.ignoresSafeArea()
            
        }
    }
    
    
}








