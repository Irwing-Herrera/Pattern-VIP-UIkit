//
//  TitlesConfigurator.swift
//  vip
//
//  Created by C330593 on 26/07/22.
//

import Foundation

class TitlesConfigurator {
    
    static func configureModule(viewController: TitlesViewController) -> Void {
        let view = TitlesView()
        let router = TitlesRouterImplementation()
        let interactor = TitlesInteractorImplementation()
        let presenter = TitlesPresenterImplementation()
        
        viewController.titlesView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
    
}
