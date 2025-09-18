//
//  Coordinator.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI
import Combine

enum Pages: Identifiable, Hashable {
    case Onboarding
    case OnboardingSwipeableFirst
    case Home
    case Settings
    case Detail(id: String)
    case Subject(subject: String)
    
    var id: String {
        switch self {
        case .Onboarding: return "Onboarding"
        case .OnboardingSwipeableFirst: return "OnboardingSwipeableFirst"
        case .Home: return "Home"
        case .Settings: return "Settings"
        case .Detail(let id): return "Detail_\(id)"
        case .Subject(let subject): return "Subject\(subject)"
        }
    }
}

enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case OnboardingPrivacySheet
    case NetworkConnectivitySheet
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case demo
}

class AppCoordinator: ObservableObject {
    @Injected(StorageServiceProtocol.self) private var storageService
    @Injected(NetworkConnectivityServiceProtocol.self) private var connectivityService
    
    @Published var root: Pages = .Onboarding
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        let value = storageService.get(forKey: .hasSeenOnboarding, as: Bool.self) ?? false
        if value { root = .Home }
        else { root = .Onboarding }
        
        setupConnectivityMonitoring()
    }
    
    private func setupConnectivityMonitoring() {
        connectivityService.connectivityStatus
            .dropFirst() // Skip initial value
            .sink { [weak self] isConnected in
                if !isConnected {
                    self?.presentSheet(.NetworkConnectivitySheet)
                }
            }
            .store(in: &cancellables)
    }
    
    func push(page: Pages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissCover() {
        self.fullScreenCover = nil
    }
    
    func replace(page: Pages) {
        self.root = page
        self.path = NavigationPath()
    }
    
    func refreshRootBasedOnStorage() {
        let value = storageService.get(forKey: .hasSeenOnboarding, as: Bool.self) ?? false
        if value { 
            root = .Home 
        } else { 
            root = .Onboarding 
        }
        path = NavigationPath()
    }
    
    @ViewBuilder
    func build(page: Pages) -> some View {
        switch page {
            
        // Onboard
        case .Onboarding: Onboarding()
        case .OnboardingSwipeableFirst: OnboardingSwipeableFirst()
            
        case .Home: BottomNavigation()
        case .Settings: SettingsView()
        case .Detail(let id):
            DetailView(bookId: id)
        case .Subject(let subject):
            SubjectView(subject: subject)
        }
    }
        
    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .OnboardingPrivacySheet: OnboardingPrivacySheet()
        case .NetworkConnectivitySheet: NetworkConnectivitySheet()
        }
    }
        
    @ViewBuilder
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .demo: EmptyView()
        }
    }
}
