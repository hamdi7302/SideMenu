//
//  SwiftUIView.swift
//  
//
//  Created by hamdi on 13/9/2024.
//

import SwiftUI

struct sideMenuFooter: View {
    var body: some View {
        VStack{
            Text("Version: 1.0.0")
                .fontWeight(.bold)
            HStack{
                Image(systemName: "bolt")
                Text("Powered by:")
                Text("Youu")
                    .fontWeight(.bold)
            }
        }
        .font(.caption)
        .padding()
    }
}
