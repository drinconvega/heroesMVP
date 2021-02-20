//
//  CharacterListViewController.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import UIKit

public class CharacterListViewController: BaseViewController {
    
    @IBOutlet weak var tvCharacters: UITableView!
    
    private let presenter: CharacterListPresenter = InjectManager.resolve(serviceType: CharacterListPresenter<CharacterListViewController>.self)!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
    }
    
    override public func getPresenter() -> MVPViewControllerPresenterProtocol? {
        return presenter
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.updateCharacters()
    }
}

extension CharacterListViewController: UITableViewDataSource, UITableViewDelegate {
    
    private static let imageCellReuseIdentifier = "ImageTitleCell"

    private func configureTableView() {
        self.tvCharacters.dataSource = self
        self.tvCharacters.delegate = self
        self.tvCharacters.rowHeight = UITableView.automaticDimension
        self.tvCharacters.estimatedRowHeight = 500
        
        self.tvCharacters.register(UINib(nibName: CharacterListViewController.imageCellReuseIdentifier, bundle: nil), forCellReuseIdentifier: CharacterListViewController.imageCellReuseIdentifier)
        
        self.tvCharacters.reloadData()
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfRows()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListViewController.imageCellReuseIdentifier, for: indexPath) as? ImageTitleCell else {
            fatalError("ImageTitleCell is not found")
        }
        
        let character = self.presenter.characterAt(index: indexPath.row)
        
        cell.titleLabel.text = character?.name
        //cell.leftImageView = character.i
        
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.goToCharacterDetail(index: indexPath.row)
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == tableView.numberOfSections - 1 &&
            indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            self.presenter.updateCharacters(updatePage: true)
        }
    }
}

extension CharacterListViewController: CharacterListUI {
    
    func reloadData() {
        self.tvCharacters.reloadData()
    }
    

}
