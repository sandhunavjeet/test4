//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    
    var player : SKSpriteNode?
    var wallblock : SKSpriteNode?
    var isblock : SKSpriteNode?
    var wall: SKSpriteNode?
    var stop:SKSpriteNode?
    var win: SKSpriteNode?
    var flag: SKSpriteNode?
    let right = SKAction.moveBy(x: 64, y: 0, duration: 0.6)
    let left = SKAction.moveBy(x: -64, y: 0, duration: 0.6)
    let up = SKAction.moveBy(x: 0, y: 64, duration: 0.6)
    let down = SKAction.moveBy(x: 0, y: -64, duration: 0.6)

    var wallblocky : CGFloat?
    var isblocky:CGFloat?
    var stopblocky:CGFloat?
    var flagy:CGFloat?
     var wallblockx : CGFloat?
     var isblockx:CGFloat?
     var stopblockx:CGFloat?
    var flagx: CGFloat?
    var winx:CGFloat?
    var winy : CGFloat?
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        player = childNode(withName: "player") as? SKSpriteNode
        wallblock = childNode(withName: "wallblock") as? SKSpriteNode
        wall = childNode(withName: "wall") as? SKSpriteNode
        stop = childNode(withName: "stopblock") as? SKSpriteNode
        isblock =  childNode(withName: "isblock") as? SKSpriteNode
        win = childNode(withName: "win") as? SKSpriteNode
        flag = childNode(withName: "flag") as? SKSpriteNode
       // print(wallblock?.physicsBody?.categoryBitMask)
        wallblocky = wallblock?.position.y
        isblocky = isblock?.position.y
        stopblocky = stop?.position.y
        wallblockx = wallblock?.position.x
        isblockx = isblock?.position.x
        stopblockx = stop?.position.x
        flagy = flag?.position.y
        flagx = flag?.position.x
        winx = win?.position.x
        winy = win?.position.y
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:  #selector(handleGesture(gesture:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)

        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:  #selector(handleGesture(gesture:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)

        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:  #selector(handleGesture(gesture:)))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)

        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:  #selector(handleGesture(gesture:)))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        logic()
    }
    func logic(){
        
        if wallblockx! < stopblockx!{
                          if ( isblocky == stopblocky && isblocky == wallblocky){
                                   
                               print("obey rule")
                              
                          }else{
                            print("rule deactivated")
                   wall?.physicsBody?.collisionBitMask = 0
                            
            }
                                
            if flagx! < winx!{ // check for distance between them to be zero or contact bit mask 
                if(flagy == isblocky || isblocky == winy){
                    print("obey win rule")
                    print("change contact mask for flag and register a win")
                    print(" congratulations game won")
                }else{
                    
                }
            }
                      }
      
        
        
        
        
      
        //if(wallblock?.position.x)
    }
   @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
         if gesture.direction == UISwipeGestureRecognizerDirection.right {
          print("swipe right")
                 player?.run(right)
            // swipeDirectionLabel.text = "Swiped Right"
         }
         else if gesture.direction == UISwipeGestureRecognizerDirection.left {
             print("Swipe Left")
               player?.run(left)
           //  swipeDirectionLabel.text = "Swiped Left"

         }
         else if gesture.direction == UISwipeGestureRecognizerDirection.up {
             print("Swipe Up")
                player?.run(up)
           //  swipeDirectionLabel.text = "Swiped Up"

         }
         else if gesture.direction == UISwipeGestureRecognizerDirection.down {
             print("Swipe Down")
             player?.run(down)
           //  swipeDirectionLabel.text = "Swiped Down"

         }
     }
    func didBegin(_ contact: SKPhysicsContact) {
        print("Something collided!")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        isblocky = isblock?.position.y
           stopblocky = stop?.position.y
        wallblocky = wallblock?.position.y
        
        logic()
        //call logic only when the position changes
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
