//
//  CharactersViewController.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import UIKit
import AlamofireImage

public class CharacterViewController: BaseViewController {
    
    private let presenter: CharacterPresenter = InjectManager.resolve(serviceType: CharacterPresenter<CharacterViewController>.self)!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    public var character : Character?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = character?.name
        self.descriptionTextView.text = character?.description
        
        if let imgData = character?.imgData {
            self.imageView.image = UIImage(data: imgData)
        }else{
            self.imageView.af_setImage(withURL: URL(string: character?.thumbnailUrl ?? "")!, placeholderImage: UIImage(named: "character_default"))
        }
    }
    
    override public func getPresenter() -> MVPViewControllerPresenterProtocol? {
        return presenter
    }
}

extension CharacterViewController: CharacterUI {

}
