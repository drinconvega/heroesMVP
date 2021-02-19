//
//  MVPPresenter.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation

public protocol  MVPPresenterProtocol {
    func setView(view theView:MVPUI)
}

/// The base presenter that have all the presentation logic for a view of class
/// V.
open class MVPPresenter<V : MVPUI>:MVPPresenterProtocol{
    
    
    /// The view.
    public weak var view: V?
    
    public required init() {
        
    }

    /// Set the view.
    ///
    /// - Parameter theView: The view.
    open func setView(view theView:MVPUI) {
        self.view=(theView as! V)
        self.viewDidSet()
    }
    
    /// Called when the view have been setted.
    open func viewDidSet(){
        
    }
    
}
