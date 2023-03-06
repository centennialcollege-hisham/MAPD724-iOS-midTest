//
//  Island.swift
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

class Island : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "island", initialScale: 2)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -875.5)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.x = 875.5
        // get a pseudo random number between -313 to 313
        let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.y = CGFloat(randomX)
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.x -= verticalSpeed!
    }
}
