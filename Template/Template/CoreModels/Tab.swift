//
//  Tab.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import SwiftUI

enum Tab: Int, Hashable, CaseIterable {
    case tab1, tab2, tab3
    
    var name: String { "\(self)".capitalized }
    var image: Image {
        switch self {
        case .tab1: return Image(systemName: "hammer")
        case .tab2: return Image(systemName: "magnifyingglass")
        case .tab3: return Image(systemName: "gear")
        }
    }
}
