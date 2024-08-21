//
//  TapButton.swift
//  AsyncApp
//
//  Created by hamdi on 28/3/2024.
//

import SwiftUI

    struct SideTapButton  : View {
        
        @State var sideButton : ImageButtonItem
        @Binding var selected : ImageButtonItem
     
        var body: some View {

            Button(action: {
                selected = sideButton
            }, label: {
                HStack{
                    Image(systemName: sideButton.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        
                    Text(sideButton.title)
                        .font(.headline)
                }.foregroundColor(sideButton.color)
            }).padding()
            
                .background(
                    ZStack{
                        if (sideButton == selected ) {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white.opacity(0.5)
                                )
                        }
                    }
                    
                )   
        }
    }


//#Preview {
//    SideTapButton(sideButton: "settings", image: "gearshape", color: .black, selected: .constant("settings"))
//}
