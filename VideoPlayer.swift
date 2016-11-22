//
//  VideoPlayer.swift
//  videoRenderer
//
//  Created by Philip Bernstein on 11/20/16.
//  Copyright © 2016 Philip Bernstein. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit
import UIKit

class VideoPlayer : UIView {
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    var playerLayer:AVPlayerLayer?
    var composition:AVMutableComposition?
    var touchRecognizer:UITapGestureRecognizer?
    
    convenience init(composition: AVMutableComposition) {
        self.init()
        self.constructPlayer(compositon: composition)
        self.constructPlayerLayer(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width))
        self.touchRecognizer = UITapGestureRecognizer(target: self, action: #selector(handlePlayerTap))
    }
    
    func handlePlayerTap() {
        if (self.player?.rate == 0) {
            self.play()
        }
        else {
            self.pause()
        }
    }
    
    func constructPlayerLayer(frame: CGRect!) {
        playerLayer = AVPlayerLayer()
        playerLayer?.player = player
        playerLayer?.frame = frame
        self.layer.insertSublayer(playerLayer!, at: UInt32(INT_MAX))
    }
    
    func constructPlayer(compositon: AVMutableComposition) {
        player = AVPlayer(playerItem: AVPlayerItem(asset: compositon))
    }
    
    func play() {
        self.player?.play()
    }
    
    func pause() {
        self.player?.pause()
    }
    
    func stop() {
        
    }
    
}
