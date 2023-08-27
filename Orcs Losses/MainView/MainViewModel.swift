//
//  MainViewModel.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    var losses: [LossesModel] = []
    var index: Int = 0
    let router: Router
    private let repo: Repository
    private let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .light)
    
    @Published var currentLosses: LossesModel?
    
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    init(repo: Repository, router: Router) {
        self.repo = repo
        self.router = router
        loadLosses()
    }
    
    enum Move {
        case forward
        case backward
    }
    
    func loadLosses() {
        Task {
            do {
                losses = try await repo.loadLosses()
                index = losses.count - 1
                DispatchQueue.main.async {
                    self.currentLosses = self.losses[self.index]
                }
            } catch {
                self.errorMessage = error.localizedDescription
                withAnimation(Animation.spring(response: 0.8, dampingFraction: 0.3, blendDuration: 0.6)) {
                    self.showError = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        self.showError = false
                    }
                }
            }
        }
    }
    
    func moveTo(_ move: Move) {
        haptic()
        switch move {
        case .forward:
            if index < losses.count - 1 {
                index += 1
                withAnimation(Animation.spring(response: 0.8, dampingFraction: 0.3, blendDuration: 0.6)) {
                    self.currentLosses = self.losses[self.index]
                }
            }
        case .backward:
            if index != 0 {
                index -= 1
                withAnimation(Animation.spring(response: 0.8, dampingFraction: 0.3, blendDuration: 0.6)) {
                    self.currentLosses = self.losses[self.index]
                }
            }
        }
    }
    
    func haptic() {
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
    func isButtonActive(_ move: Move) -> Bool {
        switch move {
        case .forward:
            return index != losses.count - 1
        case .backward:
            return index != 0
        }
    }
}
