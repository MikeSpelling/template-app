//
//  AppAlert.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import Foundation
import SwiftUI

struct AppAlert: Hashable, Identifiable {
    let title: String
    let message: String?
    let actions: [AlertAction]
    let isConfirmationDialogue: Bool

    var id: String { (title) + (message ?? "") }

    init(title: String, message: String? = nil, actions: [AlertAction] = [], isConfirmationDialogue: Bool = false) {
        self.title = title
        self.message = message
        self.actions = actions
        self.isConfirmationDialogue = isConfirmationDialogue
    }
}

struct AlertAction: Hashable, Identifiable {
    let title: String
    let role: ButtonRole?
    let action: (() -> Void)?

    var id: String { title + String(describing: role) }

    init(_ title: String, role: ButtonRole? = nil, action: (() -> Void)? = nil) {
        self.title = title
        self.role = role
        self.action = action
    }

    // MARK: - Hashable
    static func == (lhs: AlertAction, rhs: AlertAction) -> Bool { lhs.hashValue == rhs.hashValue }
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(String(describing: role))
    }
}
