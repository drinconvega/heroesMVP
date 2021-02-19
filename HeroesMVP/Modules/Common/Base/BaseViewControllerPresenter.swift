//
//  BaseViewControllerPresenter.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import UIKit

public class BaseViewControllerPresenter<V : BaseUI> : MVPViewControllerPresenter<V> {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        getNavigator()?.sourceUI = self.view
    }
    
    func getNavigator()
        -> BaseNavigator? {
            fatalError("Must Override")
    }
    
}
