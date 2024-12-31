//
//  Router.swift
//  Template
//
//  Created by Michael Atkins-Spelling on 31/12/2024.
//

import SwiftUI

protocol Router: ObservableObject {
    func pushTo(_ route: Route)
    func goBack()
    func popToRoot()
    func showModal(_ route: Route)
    func closeModal()
    func closeAllModals()
    func swapToTab(_ newTab: Tab, closingModals: Bool)
}
extension Router {
    func swapToTab(_ newTab: Tab) {
        swapToTab(newTab, closingModals: true)
    }
}

final class StandardRouter: Router {
    
    let tab: Tab
    let route: Route
    
    private var currentTabBinding: Binding<Tab>
    
    @Published var path = [Route]()
    
    @Published var modalRoute: Route?
    private var presentingModal: Binding<Route?>?
    private var presentingRouter: (any Router)?
    
    init(_ tab: Tab, route: Route, currentTabBinding: Binding<Tab>, presentingModal: Binding<Route?>? = nil, presentingRouter: (any Router)? = nil) {
        self.tab = tab
        self.route = route
        self.currentTabBinding = currentTabBinding
        self.presentingModal = presentingModal
        self.presentingRouter = presentingRouter
    }
    
    func homeViewInTab(_ context: Context) -> some View {
        route.view(context: context, router: self)
            .modifier(NavigatableTabModifier(tab, currentTabBinding: currentTabBinding, context: context, router: self))
    }
    
    func pushTo(_ route: Route) {
        path.append(route)
    }
    
    func goBack() {
        _ = path.popLast()
    }
    
    func popToRoot() {
        path = []
    }
    
    func showModal(_ route: Route) {
        modalRoute = route
    }
    
    func closeModal() {
        presentingModal?.wrappedValue = nil
    }
    
    func closeAllModals() {
        presentingRouter?.closeAllModals()
        closeModal()
    }
    
    func swapToTab(_ newTab: Tab, closingModals: Bool) {
        currentTabBinding.wrappedValue = newTab
        if closingModals { closeAllModals() }
    }
}