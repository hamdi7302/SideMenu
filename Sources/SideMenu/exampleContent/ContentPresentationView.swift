//
//  SwiftUIView.swift
//  
//
//  Created by hamdi on 13/9/2024.
//

import SwiftUI

struct ContentPresentation: View {
    let arrayMovie = ["movie1", "movie2", "movie3", "movie4", "movie5"]
    
    var body: some View {
        VStack(spacing: 20) {
            // Trending Section
            SectionHeaderView(title: "Trending")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(1...5, id: \.self) { index in
                        Image("movie\(index)")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                            .cornerRadius(12.0)
                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 0)
                        
                    }
                }
                .padding()
            }
            
            
            // All Movies Section
            SectionHeaderView(title: "All Movies")
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(arrayMovie.indices.reversed(), id: \.self) { index in
                        Image(arrayMovie[index])
                            .resizable()
                        
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                            .cornerRadius(10.0)
                            .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 2)
                    }
                }
                .padding()
            }
            
            Spacer()
        }
        .padding(.top, 20)
        .background(Color.random()) // Light background color for contrast
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding(.horizontal)
    }
}


public extension Color {
    
    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}


