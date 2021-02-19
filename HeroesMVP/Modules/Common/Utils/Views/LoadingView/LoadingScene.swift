//
//  LoadingScene.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import UIKit
import SpriteKit

class LoadingScene: SKScene {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        let textureAtlas = SKTextureAtlas(named: "Sprites")
        var frames : [SKTexture] = []
        let numImages = textureAtlas.textureNames.count
        for i in 0...numImages-1 {
            let textureName = "loading_\(i)"
            frames.append(textureAtlas.textureNamed(textureName))
        }
        let spriteNode = SKSpriteNode(texture: frames.first!)
        spriteNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(spriteNode)
        spriteNode.run(SKAction.repeatForever(
            SKAction.animate(with: frames,
                             timePerFrame: 0.5,
                             resize: false,
                             restore: true)))
    }

}
