//
//  NSObject_Extension.swift
//
//  Created by Kiet Nguyen on 12/24/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import Foundation
import AppKit

extension NSObject {
    
    class func pluginDidLoad(bundle: NSBundle) {
        let appName = NSBundle.mainBundle().infoDictionary?["CFBundleName"] as? NSString
        if appName == "Xcode" {
            if sharedPlugin == nil {
                sharedPlugin = XYZPlugin(bundle: bundle)
            }
        }
    }
    
    func xyz_initWithIcon(icon: AnyObject?, message: String, parentWindow: AnyObject, duration: Double) -> AnyObject? {
        
        if icon != nil && XYZTogglingHandler.isEnabled() {
            var imageIcon:NSImage?
            if message.containsString("Succeeded") {
                imageIcon = NSBundle(identifier: "com.kietnguyen.XYZPlugin")!.imageForResource(XYZFaceFactory.createFace("happy"))
                self.xyz_initWithIcon(imageIcon!, message:"Yay, Build Succeeded 👍", parentWindow: parentWindow, duration: duration)
            }else if message.containsString("Failed") {
                imageIcon = NSBundle(identifier: "com.kietnguyen.XYZPlugin")!.imageForResource(XYZFaceFactory.createFace("sad"))
                self.xyz_initWithIcon(imageIcon!, message:"Sorry, Some errors in build ✋", parentWindow: parentWindow, duration: duration)
            }else if message.containsString("Started") {
                imageIcon = NSBundle(identifier: "com.kietnguyen.XYZPlugin")!.imageForResource(XYZFaceFactory.createFace("build"))
                self.xyz_initWithIcon(imageIcon!, message:"Making your thoughts come alive", parentWindow: parentWindow, duration: duration)
            } else {
                self.xyz_initWithIcon(icon, message: message, parentWindow: parentWindow, duration: duration)
            }
            
            if self.isKindOfClass(NSPanel) && imageIcon != nil {
                let panel = self as! NSPanel
                if panel.contentView!.isKindOfClass(NSVisualEffectView) {
                    let visualEffectView = panel.contentView as! NSVisualEffectView
                    visualEffectView.material = NSVisualEffectMaterial.Titlebar
                    imageIcon?.template = false
                }
            }
            
            return self
        }
        
        return self.xyz_initWithIcon(icon, message: message, parentWindow: parentWindow, duration: duration)
    }
}
