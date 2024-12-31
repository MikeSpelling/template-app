//
//  AlertModifier.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import SwiftUI

struct AlertModifier: ViewModifier {
    
    private let alert: Binding<AppAlert?>
    
    init(_ alert: Binding<AppAlert?>) {
        self.alert = alert
    }
    
    func body(content: Content) -> some View {
        content
            .if(alert.wrappedValue?.isConfirmationDialogue == false) { view in
                view
                    .alert(
                        alert.wrappedValue?.title ?? "",
                        isPresented: Binding(
                            get: { alert.wrappedValue != nil },
                            set: { if $0 == false { alert.wrappedValue = nil } }
                        ),
                        presenting: alert
                    ) { alert in
                        ForEach(alert.wrappedValue?.actions ?? []) { action in
                            Button(role: action.role) {
                                action.action?()
                            } label: {
                                Text(action.title)
                            }
                        }
                    } message: { alert in
                        if let message = alert.wrappedValue?.message { Text(message) }
                    }
            }
            .if(alert.wrappedValue?.isConfirmationDialogue == true) { view in
                view
                    .confirmationDialog(
                        alert.wrappedValue?.title ?? "",
                        isPresented: Binding(
                            get: { alert.wrappedValue != nil },
                            set: { if $0 == false { alert.wrappedValue = nil } }
                        ),
                        presenting: alert
                    ) { alert in
                        ForEach(alert.wrappedValue?.actions ?? []) { action in
                            Button(role: action.role) {
                                action.action?()
                            } label: {
                                Text(action.title)
                            }
                        }
                    } message: { alert in
                        if let message = alert.wrappedValue?.message { Text(message) }
                    }
            }
    }
}

