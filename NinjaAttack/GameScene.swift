 import SpriteKit
 class GameScene: SKScene {
   
  func getRandomPoint(withinRect rect:CGRect)->CGPoint{
    let x = CGFloat(arc4random()).truncatingRemainder(dividingBy: rect.size.width)
    let y = CGFloat(arc4random()).truncatingRemainder(dividingBy: rect.size.height)
    return CGPoint(x: x, y: y)
   }
   
    
   override func didMove(to view: SKView) {
   let red = SKSpriteNode(imageNamed: "red")
    let blue = SKSpriteNode(imageNamed: "blue")
    
    backgroundColor = SKColor.white
    
   red.position = CGPoint(x: size.width * 0.2, y:0)
  blue.position = CGPoint(x: size.width * 0.2, y:0)
    
   addChild(red)
    
   let moveBottom = SKAction.moveBy(x: 0, y:size.height, duration:2.0)
  // let sequence1 = SKAction.sequence([moveBottom]);
    
   let moveup = moveBottom.reversed();
   let sequence2 = SKAction.sequence([moveBottom,moveup]);
    
   red.run(sequence2)
    
   let endlessAction = SKAction.repeatForever(sequence2)
  red.run(endlessAction)
    
   blue.position = self.getRandomPoint(withinRect: frame)
     addChild(blue)
    var actions:[SKAction] = []
    let destination = getRandomPoint(withinRect: frame)
    let move = SKAction.move(to:destination, duration: 1.0)
     let sequence3 = SKAction.sequence([moveBottom,moveup]);
     
    for _ in 1...500 {
      
     let destination = getRandomPoint(withinRect: frame)
     let move = SKAction.move(to:destination, duration: 1.0)
     actions.append(move)
      
    }
    let sequence = SKAction.sequence(actions)
   blue.run(sequence)
   }
   
 }
