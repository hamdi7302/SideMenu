//
//  File.swift
//  
//
//  Created by hamdi on 11/9/2024.
//

import Foundation
import SwiftUI


public protocol ContentLoader  {
    func loadContent(with title: String) -> AnyView
}
