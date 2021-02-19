//
//  BaseUI.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import UIKit

public protocol BaseUI : MVPUI {
    
    func present(_ vc: UIViewController)
    
    func present(_ vc: UIViewController, completion: (() -> Void)?)
    
    func presentPopover(_ vc: UIViewController, sourceView: UIView)

    func navigate(segueIdentifier : String, dataDelegate : ((UIViewController) -> ())?)
    
    func navigateBack()
    
    func navigateBackToViewController(_ vcType: UIViewController.Type) -> Bool
    
    func showLoading(loadingText: String?)
    
    func showLoading()
    
    func hideLoading()
    
    func hideKeyboard()
    
    func showError(message: String, error: Error?)
    
    func showError(message: String, error: Error?, action: (() -> ())?)
    
    func showDialog(title: String, message: String,
                           buttonTitle: String?, buttonAction: (() -> ())?)
    
    func showDialog(title: String, message: String,
                    leftButtonTitle: String?, rightButtonTitle: String?,
                    leftAction: (() -> ())?, rightAction: (() -> ())?)
    
    func showDialog(title: String, attributedMessage: NSAttributedString,
                    leftButtonTitle: String?, rightButtonTitle: String?,
                    leftAction: (() -> ())?, rightAction: (() -> ())?)
}
