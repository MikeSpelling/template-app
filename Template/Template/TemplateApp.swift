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
        let barBackgroundColor = UIColor(Color.blue)

        // Color for all interactive elements like alerts / buttons including tab bar and back button
        UIView.appearance().tintColor = UIColor(Color.green)

        // Bottom tab bar
        UITabBar.appearance().backgroundColor = barBackgroundColor
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray

        // Top navigation bar
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = barBackgroundColor
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
}
