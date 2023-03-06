//
//  GameProtocol.swift
//  The Mail Pilot demo
//
//  Created by Hisham Sanimeh on 05/05/2023.
//  StudentID: 301289364
//  App Description:  the Mail Pilot demo project we have been working on together in class. You will adjust the game
//  so that you can play in landscape orientation
//  Version: 1.0
//
protocol GameProtocol
{
    //Initialization
    func Start()
    
    //update every frame
    func Update()
    
    //check if the position is outside the bounds of the screen
    func CheckBounds()
    
    //a method to reset the position
    func Reset()
}
