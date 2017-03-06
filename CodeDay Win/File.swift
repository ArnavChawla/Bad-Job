import SpriteKit
import GameplayKit
import UIKit
class File: SKScene{
    
    
    
    var lable = SKLabelNode(fontNamed: "Roboto-Light.ttf")
    override func didMove(to view: SKView) {
        let game = SKSpriteNode(imageNamed: "HowToPlay")
        
        game.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(game)
        lable.text = " BACK "
        lable.fontSize = 200
        lable.position = CGPoint(x: self.size.width/2, y: self.size.height/2 - 400 )
        lable.fontColor = SKColor.black
         lable.zPosition = 200
        self.addChild(lable)
        }
    func  changeScene()
    {
        let sceneToMove = Garbage(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let my = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMove,transition: my)
    }
    func  changeScen()
    {
        let sceneToMove = StartScene(size: self.size)
        sceneToMove.scaleMode = self.scaleMode
        let my = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMove,transition: my)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches
        {
            let point = touch.location(in: self)
            if lable.contains(point){
                changeScen()
            }
        }
    }
    
}
