//
//  SettingsViewModel.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation
import Combine

protocol SettingsViewModelProtocol: ObservableObject {
    func removeOnboardSheetStorage() -> Void
}

class SettingsViewModel: SettingsViewModelProtocol {
    @Injected(StorageServiceProtocol.self) private var storageService
    private weak var coordinator: AppCoordinator?
    
    init(coordinator: AppCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func removeOnboardSheetStorage() {
        storageService.remove(forKey: .hasSeenOnboarding)
        coordinator?.refreshRootBasedOnStorage()
    }
}
