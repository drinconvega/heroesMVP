//
//  InjectSetup.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
public class InjectSetup {
    
    public class func setup() {
        
        // MARK: - Presentation
        _ = InjectManager.register(serviceType: TemplatePresenter.self) {
            _ in TemplatePresenter<TemplateViewController>()
        }
        
        //Root View controller
//        _ = InjectManager.register(serviceType: MVPViewController.self, name: "RootViewController") {
//            _ in HomeViewController(nibName: "HomeViewController", bundle: nil)
//        }
        
    }
}
