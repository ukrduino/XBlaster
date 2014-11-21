//
//  GameViewController.swift
//  XBlaster
//
//  Created by Romaniuk Sergey on 21.11.14.
//  Copyright (c) 2014 Romaniuk Sergey. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: CGSize(width: 768, height: 1024))
        let skView = self.view as SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsFields = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
    
    
    
    
    
    
    
// THE END
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}