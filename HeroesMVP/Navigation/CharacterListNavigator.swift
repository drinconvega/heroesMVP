//
//  CharacterListNavigator.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import UIKit

public class CharacterListNavigator: BaseNavigator {
    
    func goToCharacter(character: Character) {
        navigate(segueIdentifier: "characterSegue") {
            guard let characterVC = $0 as? CharacterViewController else {
                return
            }
            characterVC.character = character
        }
    }
    
}
