//
//  View1.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import SwiftUI

struct View1: View {

    private let context: Context
    private let router: any Router

    init(context: Context, router: any Router) {
        self.context = context
        self.router = router
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                Text("View 1")
                
                Button { router.pushTo(.view1)
                } label: { Text("Push View1") }
                
                Button { router.pushTo(.view2)
                } label: { Text("Push View2") }
                
                Button { router.pushTo(.view3)
                } label: { Text("Push View3") }
                .padding(.bottom, 16)
                
                Button { router.showModal(.view1)
                } label: { Text("Modal View1") }
                
                Button { router.showModal(.view2)
                } label: { Text("Modal View2") }
                
                Button { router.showModal(.view3)
                } label: { Text("Modal View3") }
                .padding(.bottom, 16)
                
                Button { router.goBack()
                } label: { Text("Back") }
                
                Button { router.popToRoot()
                } label: { Text("Pop to root") }
                    .padding(.bottom, 16)
                
                Button { router.closeModal()
                } label: { Text("Close") }
                
                Button { router.closeAllModals()
                } label: { Text("Close All") }
                .padding(.bottom, 16)
                
                Button { router.swapToTab(.tab1)
                } label: { Text("Swap to Tab 1 closing modals") }
                
                Button { router.swapToTab(.tab2)
                } label: { Text("Swap to Tab 2 closing modals") }
                
                Button { router.swapToTab(.tab3)
                } label: { Text("Swap to Tab 3 closing modals") }
                
                Button { router.swapToTab(.tab1, closingModals: false)
                } label: { Text("Swap to Tab 1") }
                
                Button { router.swapToTab(.tab2, closingModals: false)
                } label: { Text("Swap to Tab 2") }
                
                Button { router.swapToTab(.tab3, closingModals: false)
                } label: { Text("Swap to Tab 3") }
            }
            .frame(maxWidth: .infinity)
        }
        .modifier(NavTitleModifier("View 1"))
    }
}
