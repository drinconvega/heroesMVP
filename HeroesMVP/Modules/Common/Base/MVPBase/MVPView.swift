//
//  MVPView.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import UIKit

/// Base view for a presentation module that view is UIView.
open class MVPView: UIView, MVPUI {
    
    required public init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        if (self.subviews.count == 0) {
            self.loadNib()
            self.getPresenter()?.setView(view: self)
        }
        
    }
    
    required override public init(frame: CGRect) {
        
        super.init(frame: frame)
        if (self.subviews.count == 0) {
            self.loadNib()
            self.getPresenter()?.setView(view: self)
        }
    }
        

    /// Load a nib for the view.
    func loadNib(){
        if (self.subviews.count == 0) {
            let customNib = UINib.init(nibName: NSStringFromClass(type(of: self)).components(separatedBy: ".").last! as String, bundle: Bundle(for: type(of: self)))
            let customView: UIView = customNib.instantiate(withOwner: self, options: nil).first as! UIView
            customView.frame = self.bounds
            self.addSubview(customView)
            customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    
    /// Get the presenter for the view, this method must be overriden for each
    /// View.
    ///
    /// - Returns: The presenter.
    open func getPresenter() -> MVPPresenterProtocol? {
        fatalError("Must Override")
    }
}
