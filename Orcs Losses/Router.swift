//
//  Router.swift
//  Orcs Losses
//
//  Created by Le Chris on 27.08.2023.
//

import Foundation
import UIKit
import SwiftUI

class Router {
    private var navigationController: UINavigationController?
    private var repo = Repository()
    
    func configureNavigationController() {
        if navigationController == nil {
            let vm = MainViewModel(repo: repo,
                                   router: self)
            let vc = UIHostingController(rootView: MainView(viewModel: vm))
            navigationController = UINavigationController(rootViewController: vc)
            navigationController?.title = ""
            
            UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .last { $0.isKeyWindow }?.rootViewController = navigationController
        }
    }
    
    func navigateToLossesDetailsView(type: LossesType) {
        let vm = LossesDetailsViewModel(repo: repo,
                                        router: self,
                                        type: type)
        let vc = UIHostingController(rootView: LossesDetailsView(viewModel: vm))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
