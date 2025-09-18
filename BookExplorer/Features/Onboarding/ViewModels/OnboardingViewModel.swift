//
//  OnboardingViewModel.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import Foundation
import SwiftUI
import Combine


enum UpdateIndexEnum: String {
    case Add, Decrease
    var value: String { self.rawValue }
}

protocol OnboardingViewModelProtocol: ObservableObject {
    func handleSeenOnboarding() -> Void
}

class OnboardingViewModel: OnboardingViewModelProtocol {    
    @Injected(StorageServiceProtocol.self) private var storageService
    private weak var coordinator: AppCoordinator?
    
    
    init(coordinator: AppCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func handleSeenOnboarding() {
        storageService.set(true, forKey: .hasSeenOnboarding)
        coordinator?.refreshRootBasedOnStorage()
    }
}
