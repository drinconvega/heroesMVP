//
//  BaseViewController.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import UIKit

public class BaseViewController : MVPViewController, UIPopoverPresentationControllerDelegate {
    
    private var segueIdentifier : String?
    private var dataDelegate : ((UIViewController) -> ())?
    private var navController : UINavigationController?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        self.hideBackButtonText()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.barTintColor = .primaryColor
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
        self.navController = navigationController
        self.navController?.setNavigationBarHidden(shouldHideNavigationBar(), animated: animated)
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func shouldHideNavigationBar() -> Bool {
        return false
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dataDelegate = self.dataDelegate,
            segueIdentifier == segue.identifier {
            dataDelegate(segue.destination)
        }
    }
    
    // Moved from BaseUI extension to allow overrides
    public func showError(message: String, error: Error?) {
        showError(message: message, error: error, action: nil)
    }
    
    public func showError(message: String, error: Error?, action: (() -> ())?) {
        var currentMessage = message
        if let error = error {
            switch error {
            case WebServiceError.notConnection:
                currentMessage = NSLocalizedString("no_connection", comment: "no_connection")
            case WebServiceError.invalidSession:
                currentMessage = NSLocalizedString("must_relogin_error", comment: "must_relogin_error")
            default:
                break
            }
        }
        self.showDialog(title: NSLocalizedString("generic_error", comment: "generic_error"),
                        message: currentMessage,
                        leftButtonTitle: NSLocalizedString("generic_accept", comment: "generic_accept"),
                        rightButtonTitle: nil,
                        leftAction: action,
                        rightAction: nil)
    }
    
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}

extension BaseViewController : BaseUI {
    
    public func present(_ vc: UIViewController) {
        self.present(vc, animated: false, completion: nil)
    }
    
    public func present(_ vc: UIViewController, completion: (() -> Void)?) {
        self.present(vc, animated: false, completion: completion)
    }
    
    public func presentPopover(_ vc: UIViewController, sourceView: UIView) {
        vc.modalPresentationStyle = .popover
        let popoverController = vc.popoverPresentationController
        popoverController!.sourceView = sourceView
        popoverController!.sourceRect = sourceView.bounds
        popoverController!.permittedArrowDirections = .any
        popoverController!.delegate = self
        present(vc)
    }
    
    public func navigate(segueIdentifier : String, dataDelegate : ((UIViewController) -> ())?) {
        self.segueIdentifier = segueIdentifier
        self.dataDelegate = dataDelegate
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
    
    public func navigateBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    public func navigateBackToViewController(_ vcType: UIViewController.Type) -> Bool {
        if let vc =  self.navigationController?.viewControllers.filter({$0.isKind(of: vcType)}).first {
            self.navigationController?.popToViewController(vc, animated: true)
            return true
        }else{
            return false
        }
    }
    
    public func showLoading() {
        self.showLoading(loadingText: nil)
    }
    
    public func showLoading(loadingText: String?) {
        self.hideKeyboard()
        let loadingView = LoadingView(frame: self.getParentView().frame, text: loadingText)
        self.getParentView().addSubview(loadingView)
    }
    
    private func getParentView() -> UIView {
        if let navController = self.navController {
            return navController.view
        }
        return self.view
    }
    
    public func hideLoading() {
        self.getParentView().subviews.filter {
            $0 is LoadingView
            }.forEach {
                $0.removeFromSuperview()
        }
    }
    
    public func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    public func showDialog(title: String, attributedMessage: NSAttributedString,
                           leftButtonTitle: String?, rightButtonTitle: String?,
                           leftAction: (() -> ())?, rightAction: (() -> ())?)
    {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        self.setupDialog(alert: alert, leftButtonTitle: leftButtonTitle, rightButtonTitle: rightButtonTitle, leftAction: leftAction, rightAction: rightAction)
    }
    
    public func showDialog(title: String, message: String,
                    leftButtonTitle: String?, rightButtonTitle: String?,
                    leftAction: (() -> ())?, rightAction: (() -> ())?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.setupDialog(alert: alert, leftButtonTitle: leftButtonTitle, rightButtonTitle: rightButtonTitle, leftAction: leftAction, rightAction: rightAction)
    }
    
    public func showDialog(title: String, message: String,
                    buttonTitle: String?, buttonAction: (() -> ())?)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.setupDialog(alert: alert, buttonTitle: buttonTitle, buttonAction: buttonAction)
    }
    
    private func setupDialog(alert: UIAlertController, leftButtonTitle: String?,
                             rightButtonTitle: String?, leftAction: (() -> ())?,
                             rightAction: (() -> ())?) {
        
        if let leftTitle = leftButtonTitle {
            alert.addAction(UIAlertAction(title: leftTitle,
                                          style: .default, handler: { (_) in
                                            if let action = leftAction {
                                                action()
                                            }
            }))
        }
        
        if let rightTitle = rightButtonTitle {
            alert.addAction(UIAlertAction(title: rightTitle,
                                          style: .default, handler: { (_) in
                                            if let action = rightAction {
                                                action()
                                            }
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupDialog(alert: UIAlertController, buttonTitle: String?,
                             buttonAction: (() -> ())?) {
        
        if let title = buttonTitle {
            alert.addAction(UIAlertAction(title: title,
                                          style: .default, handler: { (_) in
                                            if let action = buttonAction {
                                                action()
                                            }
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UIViewController {
    func hideBackButtonText() {
        let backItem = UIBarButtonItem()
        backItem.title = " "
        self.navigationItem.backBarButtonItem = backItem
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backItem
    }
}

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
}



