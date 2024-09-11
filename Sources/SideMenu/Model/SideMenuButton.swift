//
//  File.swift
//  
//
//  Created by hamdi on 11/9/2024.
//

import Foundation

public struct SideMenuButton: Identifiable {
    public let id: UUID = UUID()
    public let title: String
    public let image: String
    public let sectionType: SectionType
    public init(title: String, image: String, sectionType: SectionType) {
         self.title = title
         self.image = image
         self.sectionType = sectionType
     }
}
