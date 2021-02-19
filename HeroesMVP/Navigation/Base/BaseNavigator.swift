//
//  BaseNavigator.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import UIKit

public class BaseNavigator {
    
    var sourceUI : BaseUI?
    
    func present(_ vc: UIViewController) {
        self.sourceUI?.present(vc)
    }
    
    func presentPopover(_ vc: UIViewController, sourceView: UIView) {
        self.sourceUI?.presentPopover(vc, sourceView: sourceView)
    }
    
    func navigate(segueIdentifier : String, dataDelegate : ((UIViewController) -> ())?) {
        self.sourceUI?.navigate(segueIdentifier: segueIdentifier, dataDelegate: dataDelegate)
    }
    
    func backToController(_ vcType : UIViewController.Type) -> Bool? {
        return self.sourceUI?.navigateBackToViewController(vcType)
    }
    
    func back() {
        self.sourceUI?.navigateBack()
    }
    
}
