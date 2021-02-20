//
//  CharacterListPresenter.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import UIKit

private let defaultLimit = 100

class CharacterListPresenter<V : CharacterListUI> : BaseViewControllerPresenter<V>{
    
    let navigator : CharacterListNavigator = InjectManager.resolve(serviceType: CharacterListNavigator.self)!
    private let charactersWS = CharactersWebService()
    
    private var page = Page(limit: defaultLimit, offset: 0)
    private var characters: [Character]?
    
    override func getNavigator() -> BaseNavigator? {
        return navigator
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Networking
    private func getCharacters() {
        self.view?.showLoading(loadingText: "searching_text".localized)
        self.charactersWS.getCharacters(page: self.page) { (characters) in
            self.view?.hideLoading()
            self.characters = characters
            self.view?.reloadData()
            
        } onError: { (error) in
            self.view?.hideLoading()
            self.view?.showError(message: "generic_error_description".localized, error: error)
        }

    }
    
    // MARK: View
    public func setImgData(image: UIImage, toCharacter index: Int) {
        self.characters?[index].imgData = image.pngData()
    }
    
    public func updateCharacters(updatePage: Bool = false) {
        if updatePage {
            self.page.offset+=defaultLimit
        }
        self.getCharacters()
    }
    
    public func numberOfRows() -> Int {
        return characters?.count ?? 0
    }
    
    public func characterAt(index: Int) -> Character? {
        return characters?[index]
    }
    
    // MARK: Navigation
    public func goToCharacterDetail(index: Int) {
        if let character = characterAt(index: index){
            self.navigator.goToCharacter(character: character)
        }
    }
    
}
