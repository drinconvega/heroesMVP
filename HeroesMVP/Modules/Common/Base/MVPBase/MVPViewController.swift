//
//  MVPViewController.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import UIKit

/// Base view controller for a presentation modeule that view is
/// UIViewController.
open class MVPViewController: UIViewController, MVPUI {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.getPresenter()?.setView(view: self)
        self.getPresenter()?.viewDidLoad()
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getPresenter()?.viewWillAppear()
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getPresenter()?.viewDidAppear()
    }

    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.getPresenter()?.viewWillDisappear()
    }
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.getPresenter()?.viewDidDisappear()
    }
    
    
    /// Get the presenter for the view, this method must be overriden for each
    /// View.
    ///
    /// - Returns: The presenter.
    open func getPresenter()
                            -> MVPViewControllerPresenterProtocol? {
        fatalError("Must Override")
    }
}
