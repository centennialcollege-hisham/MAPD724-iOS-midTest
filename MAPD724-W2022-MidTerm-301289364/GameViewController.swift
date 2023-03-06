
import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let scene = GKScene(fileNamed: "GameScene") {
            
            if let sceneNode = scene.rootNode as! GameScene? {
                sceneNode.scaleMode = .aspectFill
                
                
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                }
            }
        }
        // Initialize the Lives and Score
        CollisionManager.gameViewController = self
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return  .landscape
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel()
    {
        if ScoreManager.Lives == 0{
            ScoreManager.Lives = 5
            ScoreManager.Score = 0
            self.showToast(message: "Game over...", seconds: 1.0)
            LivesLabel.text = "Lives: \(ScoreManager.Lives)"
            ScoreLabel.text = "Score: \(ScoreManager.Score)"
        }else{
            LivesLabel.text = "Lives: \(ScoreManager.Lives)"
            
        }
        
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func showToast(message : String, seconds: Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.5
        alert.view.layer.cornerRadius = 15
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
}

