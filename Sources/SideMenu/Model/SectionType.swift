//
//  File.swift
//  
//
//  Created by hamdi on 11/9/2024.
//

import Foundation

public enum SectionType: String{
    case Main
    case Tools
    case Settings
    public var sortOrder: Int {
        switch self {
        case .Main:
            return 1
        case .Tools:
            return 2
        case .Settings:
            return 3
        }
    }
}
