//
//  TitlesRouter.swift
//  vip
//
//  Created by C330593 on 26/07/22.
//

import Foundation
import UIKit

protocol TitlesRouter: AnyObject {
    var navigationController: UINavigationController? { get }
    
    func routeToDetail(with id: String)
}


class TitlesRouterImplementation: TitlesRouter {
    weak var navigationController: UINavigationController?
    
    func routeToDetail(with id: String) {
        let viewController = TitleDetailViewController()
        
        TitleDetailConfigurator.configureModule(
            titleId: id,
            viewController: viewController
        )
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
