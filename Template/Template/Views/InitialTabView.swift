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
            StandardRouter(.tab1, route: .view1, currentTabBinding: $currentTab)
                .homeViewInTab(context)
            
            StandardRouter(.tab2, route: .view2, currentTabBinding: $currentTab)
                .homeViewInTab(context)
            
            StandardRouter(.tab3, route: .view3, currentTabBinding: $currentTab)
                .homeViewInTab(context)
        }
    }
}

struct NavigatableTabModifier: ViewModifier {
    
    private let currentTabBinding: Binding<Tab>
    private let tab: Tab
    private let context: Context
    
    @ObservedObject private var router: StandardRouter
    
    init(_ tab: Tab, currentTabBinding: Binding<Tab>, context: Context, router: StandardRouter) {
        self.currentTabBinding = currentTabBinding
        self.tab = tab
        self.context = context
        self.router = router
    }
    
    func body(content: Content) -> some View {
        NavigationStack(path: $router.path) {
            content
                .background(Color.purple)
                .navigationDestination(for: Route.self) { navRoute in
                    navRoute.view(context: context, router: router)
                        .background(Color.purple)
                }
                .sheet(isPresented: Binding(
                    get: { router.modalRoute != nil && router.modalPresentationSize != .fullscreen},
                    set: { if $0 == false { router.modalRoute = nil } }
                )) {
                    StandardRouter(
                        tab,
                        route: router.modalRoute!,
                        currentTabBinding: currentTabBinding,
                        presentingModal: $router.modalRoute,
                        presentingRouter: router
                    )
                    .homeViewInTab(context)
                    .presentationDetents(router.presentationDetents)
                }
                .fullScreenCover(isPresented: Binding(
                    get: { router.modalRoute != nil && router.modalPresentationSize == .fullscreen},
                    set: { if $0 == false { router.modalRoute = nil } }
                )) {
                    StandardRouter(
                        tab,
                        route: router.modalRoute!,
                        currentTabBinding: currentTabBinding,
                        presentingModal: $router.modalRoute,
                        presentingRouter: router
                    )
                    .homeViewInTab(context)
                }
        }
        .tabItem {
            tab.image
            Text(tab.name)
        }
        .tag(tab)
    }
}

#Preview {
    InitialTabView(StandardContext())
}
