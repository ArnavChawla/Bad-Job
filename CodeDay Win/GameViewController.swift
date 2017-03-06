//
//  GameViewController.swift
//  CodeDay Win
//
//  Created by Arnav Chawla on 11/12/16.
//  Copyright © 2016 Arnav Chawla. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

class GameViewController: UIViewController{

    var Banner:GADBannerView!
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        Banner = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        Banner.adUnitID = "ca-app-pub-3743323698792107/3385050876"
        Banner.rootViewController = self
        var request = GADRequest()
        Banner.load(request)
          let scene = StartScene(size: CGSize(width: 1536, height: 2048))
         
                let view = self.view as! SKView
                scene.scaleMode = .aspectFill
        Banner.frame = CGRect(x:0, y: view.bounds.height - Banner.frame.size.height, width: Banner.frame.size.width, height: Banner.frame.size.height)
                self.view.addSubview(Banner!)
                // Present the scene
                view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
      
            }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
