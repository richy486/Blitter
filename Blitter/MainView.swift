//
//  ScreenView.swift
//  Blitter
//
//  Created by Richard Adem on 19/1/19.
//  Copyright © 2019 Richard Adem. All rights reserved.
//

import UIKit

class MainView: UIView {
  
  var displaylink: CADisplayLink!
  var bitmapContext: CGContext?
  var cgImage: CGImage?
  
  // MARK: - Subviews var
  
  // MARK: - View lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    print("starting")
    
    displaylink = CADisplayLink(target: self,
                                selector: #selector(step))
    displaylink.add(to: .current,
                    forMode: .default)
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  @objc func step(displaylink: CADisplayLink) {
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let contextWidth = Int(bounds.width * UIScreen.main.scale)
    let contextHeight = Int(bounds.height * UIScreen.main.scale)
    let bytesPerPixel = 4
    let bitsPerComponent = 8
    let bytesPerRow = bytesPerPixel * contextWidth
    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.noneSkipLast.rawValue)
    
    if bitmapContext == nil {
      bitmapContext = CGContext(data: nil,
                               width: contextWidth,
                               height: contextHeight,
                               bitsPerComponent: bitsPerComponent,
                               bytesPerRow: bytesPerRow,
                               space: colorSpace,
                               bitmapInfo: bitmapInfo.rawValue)
    }
    
    
    
    guard let contextDataRaw: UnsafeMutableRawPointer = bitmapContext?.data else {
      print("Could not get UnsafeMutableRawPointer from CGContext")
      return
    }
    
    let contextData: UnsafeMutablePointer<UInt32> = contextDataRaw.bindMemory(to: UInt32.self,
                                                                             capacity: contextWidth * contextHeight)
    
    for row in 0..<contextHeight {
      for col in 0..<contextWidth {
        let offset = (col * contextHeight) + row

          let red = Double(arc4random() % 255)/255.0
          let green = Double(arc4random() % 255)/255.0
          let blue = Double(arc4random() % 255)/255.0
          
          contextData[offset] = UInt32(blue * 255.0) << 16 +
                                UInt32(green * 255.0) << 8 +
                                UInt32(red * 255.0)
      }
    }
    
    guard let bitmapContext = bitmapContext else {
      return
    }
    cgImage = bitmapContext.makeImage()
    setNeedsDisplay()
  }
  
  // MARK: - Actions

  override func draw(_ rect: CGRect) {
    
    guard let displayContext = UIGraphicsGetCurrentContext() else {
      return
    }
    guard let cgImage = cgImage else {
      return
    }
    
    displayContext.draw(cgImage, in: bounds)
  }
  

}
