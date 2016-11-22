//
//  VideoExporter.swift
//  videoRenderer
//
//  Created by Philip Bernstein on 11/17/16.
//  Copyright © 2016 Philip Bernstein. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

class VideoExporter : NSObject {
    
    /*
     class variables, needed throughout lifecycle of class
     */
    var assetExportSession : AVAssetExportSession?
    var completionCallback: ((_ success: Bool, _ location: NSURL) -> ())?
    var mutableCompostion: AVMutableComposition?
    var exportDestination: NSURL?
    var lyricAnimator: ExportAnimator?
    
    /*
     overrides init, to call our own setup method
     */
    override init() {
        super.init()
        self.commonInit()
    }
    
    /*
     initialializes the class with all required variables (video model, and composition)
     */

    func commonInit() {
        
    }
    
    /*
     begin to export video using, AVAssetExportSession
     */
    func exportVideo() {
        
        if (videoModel == nil || mutableCompostion == nil) {
            return
        }
        
        if (assetExportSession == nil) {
            
            assetExportSession = AVAssetExportSession(asset: self.mutableCompostion!, presetName: AVAssetExportPreset1920x1080)
            assetExportSession?.outputFileType = AVFileTypeQuickTimeMovie;
            assetExportSession?.canPerformMultiplePassesOverSourceMediaData = true
            assetExportSession?.videoComposition = self.lyricAnimator?.videoOutput;
            assetExportSession?.outputURL = self.createTemporaryFileURL() as URL?
            
            assetExportSession?.exportAsynchronously {
                if (self.completionCallback != nil) {
                    self.completionCallback((assetExportSession?.error != nil), assetExportSession?.outputURL)
                }
            }
        }
    }
    
    func cleanupRender() {
        assetExportSession = nil
        completionCallback = nil
        videoModel = nil
        mutableCompostion = nil
        exportDestination = nil
    }
    
    func createTemporaryFileURL()->NSURL? {

        return NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(NSUUID().uuidString) as NSURL?
    }
    
    func cleanTempDirectory() {
        
    }
}
