//
//  ContentView.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import SwiftUI

struct InitialTabView: View {
    
    @State private var currentTab: Tab
    @State private var context: Context
    
    init(_ context: Context) {
        self.context = context
        self.currentTab = .tab2
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            StandardRouter(.view1, currentTabBinding: $currentTab)
                .view(withTab: .tab1, context: context)
            
            StandardRouter(.view2, currentTabBinding: $currentTab)
                .view(withTab: .tab2, context: context)
            
            StandardRouter(.view3, currentTabBinding: $currentTab)
                .view(withTab: .tab3, context: context)
        }
    }
}

struct NavigatableTabModifier: ViewModifier {
    
    private let currentTabBinding: Binding<Tab>
    private let tab: Tab?
    private let context: Context
    
    @ObservedObject private var router: StandardRouter
    
    init(_ tab: Tab?, currentTabBinding: Binding<Tab>, context: Context, router: StandardRouter) {
        self.currentTabBinding = currentTabBinding
        self.tab = tab
        self.context = context
        self.router = router
    }
    
    func body(content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Route.self) { navRoute in
                    navRoute.view(context: context, router: router)
                        .if(router.alert != nil && router.path.last == navRoute) { view in
                            view.modifier(AlertModifier($router.alert))
                        }
                }
                .sheet(isPresented: Binding(
                    get: { router.modalRoute != nil && router.modalPresentationSize != .fullscreen },
                    set: { if $0 == false { router.modalRoute = nil } }
                )) {
                    StandardRouter(
                        router.modalRoute!,
                        currentTabBinding: currentTabBinding,
                        presentingModal: $router.modalRoute,
                        presentingRouter: router
                    )
                    .view(context: context)
                    .presentationDetents(router.presentationDetents)
                }
                .fullScreenCover(isPresented: Binding(
                    get: { router.modalRoute != nil && router.modalPresentationSize == .fullscreen },
                    set: { if $0 == false { router.modalRoute = nil } }
                )) {
                    StandardRouter(
                        router.modalRoute!,
                        currentTabBinding: currentTabBinding,
                        presentingModal: $router.modalRoute,
                        presentingRouter: router
                    )
                    .view(context: context)
                }
                .if(router.alert != nil && router.path.isEmpty) { view in
                    view.modifier(AlertModifier($router.alert))
                }
        }
        .if(has: tab) { view, tab in
            view
                .tabItem {
                    tab.image
                    Text(tab.name)
                }
                .tag(tab)
        }
    }
}


#Preview {
    InitialTabView(StandardContext())
}
