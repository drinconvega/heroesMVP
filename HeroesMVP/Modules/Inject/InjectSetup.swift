//
//  InjectSetup.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
public class InjectSetup {
    
    public class func setup() {
        
        // MARK: - Presentation
        _ = InjectManager.register(serviceType: CharacterPresenter.self) {
            _ in CharacterPresenter<CharacterViewController>()
        }
        
        
    }
}
