//
//  GameViewController.swift
//  L8_Bondarenko_Alexander
//
//  Created by Alexander Bondarenko on 13/12/2018.
//  Copyright © 2018 Alexander Bondarenko. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: self.view.bounds.size)
        
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        
    }






}
