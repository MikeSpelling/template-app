//
//  Untitled.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import SwiftUI

struct NavTitleModifier: ViewModifier {
    
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .foregroundColor(.white)
                }
            }
    }
}
