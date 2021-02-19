//
//  CharacterListPresenter.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import UIKit

class CharacterListPresenter<V : CharacterListUI> : BaseViewControllerPresenter<V>{
    
    let navigator : CharacterListNavigator = InjectManager.resolve(serviceType: CharacterListNavigator.self)!
    
    override func getNavigator() -> BaseNavigator? {
        return navigator
    }
    
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
