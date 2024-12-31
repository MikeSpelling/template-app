//
//  View3.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import SwiftUI

struct View3: View {

    private let context: Context
    private let router: any Router
    
    @State var text = ""

    init(context: Context, router: any Router) {
        self.context = context
        self.router = router
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                Text("View 3")
                
                Button { router.pushTo(.view1)
                } label: { Text("Push View1") }
                
                Button { router.pushTo(.view2)
                } label: { Text("Push View2") }
                
                Button { router.pushTo(.view3)
                } label: { Text("Push View3") }
                .padding(.bottom, 16)
                
                Button { router.showModal(.view1)
                } label: { Text("Large Sheet View1") }
                
                Button { router.showModal(.view2)
                } label: { Text("Large Sheet View2") }
                
                Button { router.showModal(.view3)
                } label: { Text("Large Sheet View3") }
                .padding(.bottom, 16)
                
                Button { router.showModal(.view1, modalPresentationSize: .sheet([.large, .medium]))
                } label: { Text("Small and Large Sheet View1") }
                
                Button { router.showModal(.view2, modalPresentationSize: .sheet([.large, .medium]))
                } label: { Text("Small and Large Sheet View2") }
                
                Button { router.showModal(.view3, modalPresentationSize: .sheet([.large, .medium]))
                } label: { Text("Small and Large Sheet View3") }
                .padding(.bottom, 16)
                
                Button { router.showModal(.view1, modalPresentationSize: .fullscreen)
                } label: { Text("Modal View1") }
                
                Button { router.showModal(.view2, modalPresentationSize: .fullscreen)
                } label: { Text("Modal View2") }
                
                Button { router.showModal(.view3, modalPresentationSize: .fullscreen)
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
                    .padding(.bottom, 16)
                
                TextField("Enter Text", text: $text)
            }
            .frame(maxWidth: .infinity)
        }
        .modifier(NavTitleModifier("View 3"))
    }
}
