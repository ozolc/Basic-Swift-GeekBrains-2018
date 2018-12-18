//
//  Snake.swift
//  L8_Bondarenko_Alexander
//
//  Created by Alexander Bondarenko on 13/12/2018.
//  Copyright © 2018 Alexander Bondarenko. All rights reserved.
//

import UIKit
import SpriteKit

class Snake: SKShapeNode {
    
    var body = [SnakeBodyPart]()
    let moveSpeed = 125.0
    var angel: CGFloat = 0.0
    
    convenience init(atPoint point: CGPoint) {
        self.init()
        
        let head = SnakeHead(atPoint: point)
        body.append(head)
        print("{x:\(body[0].position.x); y:\(body[0].position.y)}")

        addChild(head)
    }
    
    func addBodyPart() {
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        print("{x:\(body[0].position.x); y:\(body[0].position.y)}")
        body.append(newBodyPart)
        addChild(newBodyPart)
        
    }
    
    func move() {
        guard !body.isEmpty else {
            return
        }
        
        let head = body[0]
        moveHead(head)
        
        for index in (0..<body.count) where index > 0 {
           let previosBodyPart = body[index - 1]
        let currentBodyPart = body[index]
            moveBodyPart(previosBodyPart, c:currentBodyPart)
        }
    }
    
    func moveHead(_ head: SnakeBodyPart) {
        let dx = CGFloat(moveSpeed) * sin(angel)
        let dy = CGFloat(moveSpeed) * cos(angel)
        
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        head.run(moveAction)
    }
    
    func moveBodyPart(_ p: SnakeBodyPart, c: SnakeBodyPart) {
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1)
        c.run(moveAction)
    }
    
    func moveClockwise(){
        angel += CGFloat(Double.pi/2)
    }
    
    func moveCounterClockwise(){
        angel -= CGFloat(Double.pi/2)
    }
    
    
    
}
