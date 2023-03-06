import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    var ocean: Ocean?
    var secondOcean: Ocean?
    var player: Player?
    var island: Island?
    var clouds : [Cloud] = []
    
    override func sceneDidLoad() {
        
        initGameObject()
        initGameSound()
        
    }
    
    func initGameObject(){
        name = "GAME"
        
        // add the first ocean to the Scene
        ocean = Ocean()
        ocean?.Reset()
        addChild(ocean!)
        
        // add the second ocean to the Scene
        secondOcean = Ocean()
        //rotate the assets by 90 degrees
        secondOcean?.zRotation =  .pi / 2
        secondOcean?.position.x = -627.5
        addChild(secondOcean!)
        
        
        //add the player to the scene
        player = Player()
        player?.Reset()
        addChild(player!)
        
        //add the island to the scene
        island = Island()
        addChild(island!)
        
        
        // add 2 clouds to the Scene
        for _ in 0...1
        {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
    }
    
    
    func initGameSound(){
        // Init Engine Sound and  Background noise / music
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        addChild(engineSound)
        engineSound.autoplayLooped = true
        engineSound.run(SKAction.changeVolume(to: 0.5, duration: 0))
        
        
        // preload / prewarm impulse sounds
        do
        {
            let sounds: [String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url:URL = URL(fileURLWithPath: path)
                let avPlayer: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                
                avPlayer.prepareToPlay()
            }
        }
        catch
        {
            
        }
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: pos.y))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: pos.y))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: pos.y))
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        ocean?.Update()
        secondOcean?.Update()
        player?.Update()
        island?.Update()
        
        // update each cloud in the clouds array
        for cloud in clouds
        {
            cloud.Update()
        // Check if they have a collision between the player and the cloud
            CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: cloud)
        }
        
        // Check if they have a collision between the player and the island
        CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: island!)
    }
}
