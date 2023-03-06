import GameplayKit
import SpriteKit

class Player : GameObject
{
    // Initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Lifecycle Functions
    override func Start()
    {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        //Constraint the player on bottom boundary
        if(position.y <= -280)
        {
            position.y = -280
        }
        
        //Constraint the player on top boundary
        if(position.y >= 280)
        {
            position.y = 280
        }
       
        //Constraint the player on Right boundary
        if(position.x <= -660)
        {
            position.x = -660
        }
        
        //Constraint the player on left boundary
        if(position.x >= -660)
        {
            position.x = -660
        }
    }
    
    override func Reset()
    {
        // The plane is rotated to face the right side of the screen.
        zRotation =  3 * .pi / 2
        position.x = -660
        position.y = -280
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
}
