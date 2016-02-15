//
//  XYZFaceFactory.swift
//  XYZPlugin
//
//  Created by Kiet Nguyen on 12/25/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import AppKit

class XYZFaceFactory: NSObject {
    
    static let happyFaceNames = ["happy0", "happy1", "happy2", "happy3", "happy4"]
    static let sadFaceNames = ["sad0", "sad1", "sad2", "sad3", "sad4"]
    static let buildFaceNames = ["build0", "build1", "build2", "build3"]
    
    class func createFace(faceType:String) -> String {
        switch(faceType) {
        case "happy":
            let index = Int(arc4random_uniform(UInt32(happyFaceNames.count)))
            return happyFaceNames[index]
            
        case "sad":
            let index = Int(arc4random_uniform(UInt32(sadFaceNames.count)))
            return sadFaceNames[index]
        case "build":
            let index = Int(arc4random_uniform(UInt32(buildFaceNames.count)))
            return buildFaceNames[index]
        default:
            return ""
        }
    }
}
