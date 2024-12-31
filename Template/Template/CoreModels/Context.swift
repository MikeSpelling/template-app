//
//  Context.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import Foundation

protocol Context: AnyObject {
    
}

final class StandardContext: Context {
    
    @MainActor init() {
        handleAppLaunch()
    }
    
    @MainActor func handleAppLaunch() {
        
    }
}
