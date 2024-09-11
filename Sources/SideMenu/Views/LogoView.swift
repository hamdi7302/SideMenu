//
//  SwiftUIView.swift
//  
//
//  Created by hamdi on 11/9/2024.
//

import SwiftUI

struct AppLogo: View {
    var body: some View {
        VStack {
            HStack(content: {
                Image(systemName: "apple.logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                 Spacer()
            })
            HStack{
                Text("Movie App")
                    .font(.headline)
                Spacer()
            }
        }.padding(.top)
    }
}
