//
//  LoadingView.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import UIKit
import SpriteKit

public class LoadingView: BaseView {
    
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var lbLoading: UILabel!
    
    init(frame : CGRect, text : String?) {
        super.init(frame: frame)
        self.initView(text: text)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initView()
    }
    
    required public init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    private func initView(text: String? = nil) {
        self.lbLoading.text = text ?? NSLocalizedString("loading_text", comment: "loading_text")
        self.lbLoading.textColor = UIColor.white
        self.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        let scene = LoadingScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    override public func getPresenter() -> MVPPresenterProtocol? {
        return nil
    }

}
