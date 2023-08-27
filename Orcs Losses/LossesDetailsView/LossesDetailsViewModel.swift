//
//  LossesDetailsViewModel.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import SwiftUI

class LossesDetailsViewModel: ObservableObject {
    
    @Published var equipments: [LossesDetailModel] = []
    @Published var lossesAmount: Int = 0
    
    @Published var errorMessage: String = ""
    @Published var showError: Bool = false
    
    let repo: Repository
    let router: Router
    let type: LossesType
    
    init(repo: Repository, router: Router, type: LossesType) {
        self.repo = repo
        self.router = router
        self.type = type
        loadEquipments()
    }
    
    func loadEquipments() {
        Task {
            do {
                let result = try await repo.loadDetails(type: type)
                DispatchQueue.main.async {
                    self.equipments = result
                    self.lossesAmount = self.equipments.reduce(0) { $0 + $1.amount }
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
    
}
