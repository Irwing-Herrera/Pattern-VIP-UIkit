//
//  TitleDetailInteractor.swift
//  vip
//
//  Created by C330593 on 26/07/22.
//

import Foundation

protocol TitleDetailInteractor: AnyObject {
    var titleId: String? { get }
    
    func viewDidLoad()
}

class TitleDetailInteractorImplementation: TitleDetailInteractor {
    
    var titleId: String?
    
    var presenter: TitleDetailPresenter?
    
    private let titlesService = TitlesServiceImplementation()
    
    func viewDidLoad() {
        do {
            if let title = try titlesService.getTitle(with: self.titleId!) {
                presenter?.interactor(didRetrieveTitle: title)
            }
        } catch {
            presenter?.interactor(didFailRetrieveTitle: error)
        }
    }
}
