//
//  TitleDetailPresenter.swift
//  vip
//
//  Created by C330593 on 26/07/22.
//

import Foundation

protocol TitleDetailPresenter: AnyObject {
    func interactor(didRetrieveTitle title: Title)
    func interactor(didFailRetrieveTitle error: Error)
}

class TitleDetailPresenterImplementation: TitleDetailPresenter {
    
    var viewController: TitleDetailPresenterOutput?
    
    func interactor(didRetrieveTitle title: Title) {
        let titleString = title.text
        viewController?.presenter(didRetrieveItem: titleString ?? "")
    }
    
    func interactor(didFailRetrieveTitle error: Error) {
        viewController?.presenter(didFailRetrieveItem: error.localizedDescription)
    }
}
