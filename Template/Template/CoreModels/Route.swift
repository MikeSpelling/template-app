//
//  Route.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import SwiftUI

enum Route: Hashable {
    case view1
    case view2
    case view3

    @ViewBuilder func view(context: Context, router: any Router) -> some View {
        switch self {
        case .view1: View1(context: context, router: router)
        case .view2: View2(context: context, router: router)
        case .view3: View3(context: context, router: router)
        }
    }
}
