//
//  GameObject.swift
//  The Mail Pilot demo
//
//  Created by Hisham Sanimeh on 05/05/2023.
//  StudentID: 301289364
//  App Description:  the Mail Pilot demo project we have been working on together in class. You will adjust the game
//  so that you can play in landscape orientation
//  Version: 1.0
//

import GameplayKit
import SpriteKit

class GameObject : SKSpriteNode, GameProtocol
{
    
    //public  members
    var horizontalSpeed: CGFloat?
    var verticalSpeed: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    var scale: CGFloat?
    var isColliding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    //Constructor / Initializer
    init(imageString: String, initialScale: CGFloat)
    {
        //initialize the game object with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        //configuration
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isColliding = false
        name = imageString
        randomSource = GKARC4RandomSource()
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //LifeCycle Functions
    func Start()
    {
        
    }
    
    func Update()
    {
        
    }
    
    func CheckBounds()
    {
        
    }
    
    func Reset()
    {
        
    }
}
