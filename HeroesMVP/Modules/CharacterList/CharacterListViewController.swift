//
//  CharacterListViewController.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation

public class CharacterListViewController: BaseViewController {
    
    private let presenter: CharacterListPresenter = InjectManager.resolve(serviceType: CharacterListPresenter<CharacterListViewController>.self)!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func getPresenter() -> MVPViewControllerPresenterProtocol? {
        return presenter
    }
}

extension CharacterListViewController: CharacterListUI {

}
