//
//  TitleDetailViewController.swift
//  vip
//
//  Created by C330593 on 26/07/22.
//

import UIKit

protocol TitleDetailPresenterOutput: class {
    func presenter(didRetrieveItem item: String)
    func presenter(didFailRetrieveItem message: String)
}

class TitleDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var titleDetailView: TitleDetailView?
    var interactor: TitleDetailInteractor?
    weak var presenter: TitleDetailPresenter?
    
    
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        self.view = titleDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

// MARK: - Presenter Output

extension TitleDetailViewController: TitleDetailPresenterOutput {
    func presenter(didRetrieveItem item: String) {
        titleDetailView?.updateLabel(with: item)
    }
    
    func presenter(didFailRetrieveItem message: String) {
        showError(with: message)
    }
}
