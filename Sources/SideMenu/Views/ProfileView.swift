//
//  ProfileView.swift
//  
//
//  Created by hamdi on 11/9/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack(content: {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            VStack(alignment: .leading, content: {
                Text("John Wick")
                    .font(.headline)
                Text("View profile")
                    .font(.headline)
                    .foregroundStyle(.gray)
            })
            Spacer()
        }).padding(.bottom)
    }
}

#Preview {
    ProfileView()
}
