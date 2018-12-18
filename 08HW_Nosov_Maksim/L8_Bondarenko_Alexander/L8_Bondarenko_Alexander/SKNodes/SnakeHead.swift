//
//  SnakeHead.swift
//  L8_Bondarenko_Alexander
//
//  Created by Alexander Bondarenko on 13/12/2018.
//  Copyright © 2018 Alexander Bondarenko. All rights reserved.
//

import UIKit

class SnakeHead: SnakeBodyPart {

    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        self.physicsBody?.categoryBitMask = CollisionCategories.SnakeHead
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple | CollisionCategories.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
