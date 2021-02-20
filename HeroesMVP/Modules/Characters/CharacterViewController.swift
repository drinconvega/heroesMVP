//
//  CharactersViewController.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation

public class CharacterViewController: BaseViewController {
    
    private let presenter: CharacterPresenter = InjectManager.resolve(serviceType: CharacterPresenter<CharacterViewController>.self)!
    
    public var character : Character?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override public func getPresenter() -> MVPViewControllerPresenterProtocol? {
        return presenter
    }
}

extension CharacterViewController: CharacterUI {

}
