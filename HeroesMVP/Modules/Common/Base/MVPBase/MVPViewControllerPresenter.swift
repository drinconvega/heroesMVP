//
//  MVPViewControllerPresenter.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation

public protocol  MVPViewControllerPresenterProtocol : MVPPresenterProtocol {
    
    /// Called when the view did load.
    func viewDidLoad()
    
    /// Called when the view will appear.
    func viewWillAppear()
    
    /// Called when the view did appear.
    func viewDidAppear()
    
    /// Called when the view will disappear.
    func viewWillDisappear()
    
    /// Called when the view did disappear.
    func viewDidDisappear()
}


open class MVPViewControllerPresenter<V : MVPUI> : MVPPresenter<V>, MVPViewControllerPresenterProtocol {
    
    // MARK: - View Life cycle
    
    /// Called when the view did load.
    open func viewDidLoad(){
        
    }
    
    /// Called when the view will appear.
    open func viewWillAppear(){
        
    }
    
    /// Called when the view did appear.
    open func viewDidAppear(){
        
    }
    
    /// Called when the view will disappear.
    open func viewWillDisappear(){
        
    }
    
    /// Called when the view did disappear.
    open func viewDidDisappear(){
        
    }
    
}
