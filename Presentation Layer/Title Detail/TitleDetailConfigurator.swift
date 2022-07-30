//
//  TitleDetailConfigurator.swift
//  vip
//
//  Created by C330593 on 26/07/22.
//

import Foundation

class TitleDetailConfigurator {
    
    static func configureModule(
        titleId: String,
        viewController: TitleDetailViewController
    ) {
        let view = TitleDetailView()
        let interactor = TitleDetailInteractorImplementation()
        let presenter = TitleDetailPresenterImplementation()
        
        interactor.titleId = titleId
        
        viewController.titleDetailView = view
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
    }
}
