//
//  ViewController.swift
//  shopProject
//
//  Created by Arnau Rivas Rivas on 18/09/2019.
//  Copyright © 2019 Arnau Rivas Rivas. All rights reserved.
//

import UIKit
//Movie Background
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    
    //Video
    var videoPlayer: AVPlayer?
    
    //Layer donde se aplica el viseo
    var videoPlayerLayer:AVPlayerLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //At the moment the app is ready to appear set up the video in the background
        setUpVideo()
    }
    
    func initializeElements(){
        Utilities.styleFilledButton(signUpBtn)
        Utilities.styleHollowButton(logInBtn)
    }
    
    func setUpVideo(){
        
        //Get the pàth to the resources in the bundle to create a URL from it
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
        
        if bundlePath == nil{
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        //Create video player item
        let item = AVPlayerItem(url: url)
        
        //Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        //Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        //Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        //Display and play it
        videoPlayer?.playImmediately(atRate: 0.5)
    }


}

