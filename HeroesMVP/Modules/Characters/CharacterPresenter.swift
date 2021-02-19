//
//  CharacterPresenter.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import UIKit

class CharacterPresenter<V : CharacterUI> : BaseViewControllerPresenter<V>{
    
    let navigator : CharacterNavigator = InjectManager.resolve(serviceType: CharacterNavigator.self)!
    
    override func getNavigator() -> BaseNavigator? {
        return navigator
    }
    
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

