//
//  Ocean.swift
//  The Mail Pilot demo
//
//  Created by Hisham Sanimeh on 05/05/2023.
//  StudentID: 301289364
//  App Description:  the Mail Pilot demo project we have been working on together in class. You will adjust the game
//  so that you can play in landscape orientation
//  Version: 1.0
//
import SpriteKit
class Ocean : GameObject
{
    init()
    {
        // imageString: "ocean" same name in assests
        // 2.0 based  try the image in game scene
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start()
    {
        //start image form 0
        zPosition = Layer.ocean.rawValue
        // number fram
        verticalSpeed = 5.0
        horizontalSpeed = 5.0
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -2252.5){
            Reset()
        }
    }
    
    
    override func Reset()
    {
        zRotation =  .pi / 2
        position.x = 2252.5
    }
    
    func Move()
    {
        position.x -= verticalSpeed!
    }
}
