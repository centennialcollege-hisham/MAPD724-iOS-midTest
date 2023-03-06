//
//  Cloud.swift
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

class Cloud : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds() {
        if(position.x <= -685)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize the vertical speed: 5 to 10
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        // randomize the horizontal speed: -2 to 2
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        // get a pseudo random number for the Y position: -262 to 262
        let randomY:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.y = CGFloat(randomY)
        
        // get a pseudo random number for the X position: 602 to 632
        let randomX:Int = (randomSource?.nextInt(upperBound: 30))! + 685
        position.x = CGFloat(randomX)
        
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.y -= horizontalSpeed!
        position.x -= verticalSpeed!
    }
    
}
