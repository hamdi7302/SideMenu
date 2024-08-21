//
//  TabItem.swift
//  AsyncApp
//
//  Created by hamdi on 24/3/2024.
//

import Foundation
import SwiftUI


enum TabBarItem  {
    case movie ,  serie , favorite
    
    
    var title : String {
        switch self {
      
        case .movie:
            return "Movie"
        case .serie:
            return "Series"
        case .favorite:
            return "Favorite"
        }
    }
    
    var iconName : String {
        switch self {
        case .movie:
            return "movieclapper"
        case .serie:
            return "popcorn"
        case .favorite:
            return "star.fill"
        }
    }
    
    var color : Color {
        switch self {
      
        case .movie:
            return .blue
        case .serie:
            return .green
        case .favorite:
            return .red
        }
    }
}
