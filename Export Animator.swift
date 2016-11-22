//
//  ExportAnimator.swift
//  videoRenderer
//
//  Created by Philip Bernstein on 11/18/16.
//  Copyright © 2016 Philip Bernstein. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit
import UIKit
import CoreMedia

/*
    This class is designed to animate text (or other transiations) over the rendered video. This class has a CALayer which it renders onto, which is then rendered into the video
 */
class ExportAnimator:NSObject {
    
    // for render lyrics
    var animationTool:AVVideoCompositionCoreAnimationTool?
    var animationLayer:CALayer?
    var songModel:SongModel?
    var videoOutput:AVMutableVideoComposition?
    
    // for rendering image into video
    var imageToRender:UIImage?
    var timeToRenderImage:CMTime?
    var timetoEndRenderImage:CMTime?
    
    override init() {
        super.init();
        self.commonInit()
    }
    
    func commonInit() {
        self.animationLayer = CALayer()
        self.animationTool? = AVVideoCompositionCoreAnimationTool(additionalLayer: self.animationLayer!, asTrackID: kCMPersistentTrackID_Invalid)
        videoOutput?.renderSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width);
    }
    
    func addImage(image: UIImage?, startTime: CMTime?, endTime: CMTime?) {
        imageToRender = image
        timeToRenderImage = startTime
        timetoEndRenderImage = endTime
    }
}
