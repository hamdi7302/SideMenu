//
//  TabItem.swift
//  AsyncApp
//
//  Created by hamdi on 24/3/2024.
//

import Foundation
import SwiftUI


public enum TabBarItem  {
    case movie ,  serie , favorite
    
    
    public var title : String {
        switch self {
      
        case .movie:
            return "Movie"
        case .serie:
            return "Series"
        case .favorite:
            return "Favorite"
        }
    }
    
    public  var iconName : String {
        switch self {
        case .movie:
            return "movieclapper"
        case .serie:
            return "popcorn"
        case .favorite:
            return "star.fill"
        }
    }
    
    public  var color : Color {
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
