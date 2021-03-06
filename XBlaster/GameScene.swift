//
//  GameScene.swift
//  XBlaster
//
//  Created by Romaniuk Sergey on 21.11.14.
//  Copyright (c) 2014 Romaniuk Sergey. All rights reserved.
//

import SpriteKit



class GameScene: SKScene {
    
    let playerLayerNode = SKNode()
    let hudLayerNode = SKNode()
    let playableRect: CGRect
    let hudHeight: CGFloat = 90
    let scoreLabel = SKLabelNode(fontNamed: "Edit Undo Line BRK")
    var scoreFlashAction: SKAction!
    let healthBarString: NSString = "===================="
    let playerHealthLabel = SKLabelNode(fontNamed: "Arial")
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(size: CGSize) {
        // Calculate playable margin
        
        let maxAspectRatio: CGFloat = 16.0/9.0 //iPhone 5"
        let maxAspectRatioWidth = size.height / maxAspectRatio
        let playableMargin = (size.width-maxAspectRatioWidth) / 2.0
        playableRect = CGRect(x: playableMargin,
            y: 0,
            width: size.width - playableMargin / 2,
            height: size.height - hudHeight)
        super.init(size: size)
        setupSceneLayers()
        debugDrawPlayableArea()
        
        setUpUI()
    }
    
    
    func setupSceneLayers() {
        playerLayerNode.zPosition = 50
        hudLayerNode.zPosition = 100
        addChild(playerLayerNode)
        addChild(hudLayerNode)
    }
    
    func debugDrawPlayableArea() {
        let shape = SKShapeNode()
        let path = CGPathCreateMutable()
        CGPathAddRect(path, nil, playableRect)
        shape.path = path
        shape.strokeColor = SKColor.redColor()
        shape.lineWidth = 4.0
        addChild(shape)
    }
    
    func debugDrawPlayableArea2() {
        let shape = SKShapeNode()
        let path = CGPathCreateMutable()
        CGPathAddRect(path, nil, scoreLabel.frame)
        shape.path = path
        shape.strokeColor = SKColor.redColor()
        shape.lineWidth = 4.0
        hudLayerNode.addChild(shape)
    }
    
    func setUpUI() {
        let backgroundSize = CGSize(width: size.width,
            height:hudHeight)
        let backgroundColor = SKColor.blackColor()
        let hudBarBackground = SKSpriteNode(color: backgroundColor,
            size: backgroundSize)
        hudBarBackground.position = CGPoint(x:0,
            y: size.height - hudHeight)
        hudBarBackground.anchorPoint = CGPointZero
        hudLayerNode.addChild(hudBarBackground)
        
        scoreLabel.fontSize = 50
        scoreLabel.text = "Score: 0"
        scoreLabel.name = "scoreLabel"
        scoreLabel.verticalAlignmentMode = .Center
        scoreLabel.position = CGPoint(x: size.width / 2,
            y: size.height - scoreLabel.frame.size.height + 3) // c тройкой не понятно.....
        
        hudLayerNode.addChild(scoreLabel)
        //debugDrawPlayableArea2()
        
        scoreFlashAction = SKAction.sequence([SKAction.scaleTo(1.5, duration: 0.1),
            SKAction.scaleTo(1.0, duration: 0.1)])
        scoreLabel.runAction(SKAction.repeatAction(scoreFlashAction, count: 20))
        
        // 1
        let playerHealthBackgroundLabel =  SKLabelNode(fontNamed: "Arial")
        playerHealthBackgroundLabel.name = "playerHealthBackground"
        playerHealthBackgroundLabel.fontColor = SKColor.darkGrayColor()
        playerHealthBackgroundLabel.fontSize = 50
        playerHealthBackgroundLabel.text = healthBarString
        // 2
        playerHealthBackgroundLabel.horizontalAlignmentMode = .Left
        playerHealthBackgroundLabel.verticalAlignmentMode = .Top
        playerHealthBackgroundLabel.position = CGPoint(x: CGRectGetMinX(playableRect),
            y: size.height - CGFloat(hudHeight) + playerHealthBackgroundLabel.frame.size.height)
        hudLayerNode.addChild(playerHealthBackgroundLabel)
        // 3
        playerHealthLabel.name = "playerHealthLabel"
        playerHealthLabel.fontColor = SKColor.greenColor()
        playerHealthLabel.fontSize = 50
        playerHealthLabel.text = healthBarString.substringToIndex(20*75/100)
        
        //        println(playerHealthLabel.text)
        //        println(healthBarString)
        
        
        playerHealthLabel.horizontalAlignmentMode = .Left
        playerHealthLabel.verticalAlignmentMode = .Top
        playerHealthLabel.position = CGPoint(x: CGRectGetMinX(playableRect),
                                             y: size.height - CGFloat(hudHeight) + playerHealthLabel.frame.size.height)
        
        hudLayerNode.addChild(playerHealthLabel)
        
        
    }
    
}