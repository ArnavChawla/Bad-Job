import SpriteKit

class asdf: SKScene {
    var tables: [SKSpriteNode]
    
    override func didMove(to view: SKView) {
        for i in 0..<5 {
            var node = SKSpriteNode(imageNamed: "Backgroun")
            node.position = CGPoint(x: 0, y:0)
            tables.append(node)
        }
    }
}
