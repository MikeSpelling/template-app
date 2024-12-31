//
//  TemplateApp.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import SwiftUI

@main
struct TemplateApp: App {
    
    init() {
        setupAppearances()
    }
    var body: some Scene {
        WindowGroup {
            InitialTabView(StandardContext())
        }
    }

    private func setupAppearances() {
        let tintColor = UIColor(Color.blue) // Back Button / Active Tab Icon
        
        let tabBarBackgroundColor = UIColor(Color.gray)
        let tabBarUnselectedIconColor = UIColor(Color.white)
        
        let topNavColor = UIColor(Color.purple)

        // Color for all interactive elements like alerts / buttons including tab bar and back button
        UIView.appearance().tintColor = tintColor

        // Bottom tab bar
        UITabBar.appearance().backgroundColor = tabBarBackgroundColor
        UITabBar.appearance().barTintColor = tabBarBackgroundColor
        UITabBar.appearance().unselectedItemTintColor = tabBarUnselectedIconColor

        // Top navigation bar
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = topNavColor
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
}
