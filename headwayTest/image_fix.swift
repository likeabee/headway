//
//  image_fix.swift
//  headwayTest
//
//  Created by 华元信息部_相科峰 on 2017/9/30.
//  Copyright © 2017年 相科峰. All rights reserved.
//

import Foundation
import UIKit
func fixOriention(_ aImage: UIImage) -> UIImage{
    var transform : CGAffineTransform = CGAffineTransform.identity
    switch aImage.imageOrientation {
    case .down , .downMirrored:
        transform = transform.translatedBy(x: aImage.size.width, y: aImage.size.height)
        transform = transform.rotated(by: CGFloat(Double.pi))
    case .left , .leftMirrored:
        transform = transform.translatedBy(x: aImage.size.width, y: 0)
        transform = transform.rotated(by: CGFloat(Double.pi * 2))
    case .right , .rightMirrored:
        transform = transform.translatedBy(x: 0, y: aImage.size.height)
        transform = transform.rotated(by: CGFloat(Double.pi * 2))
    default:
        break
    }
    switch aImage.imageOrientation {
    case .upMirrored , .downMirrored:
        transform = transform.translatedBy(x: aImage.size.width, y: 0)
        transform = transform.scaledBy(x: -1, y: 1)
    case .leftMirrored , .rightMirrored:
        transform = transform.translatedBy(x: aImage.size.height, y: 0)
        transform = transform.scaledBy(x: -1, y: 1)
    default:
        break
    }
    let ctx:CGContext = CGContext(data: nil, width: Int(aImage.size.width), height: Int(aImage.size.height), bitsPerComponent: aImage.cgImage!.bitsPerComponent, bytesPerRow: 0, space: aImage.cgImage!.colorSpace!, bitmapInfo: aImage.cgImage!.bitmapInfo.rawValue)!
    ctx.concatenate(transform)
    switch aImage.imageOrientation {
    case .left , .leftMirrored , .right , .rightMirrored:
        ctx.draw(aImage.cgImage!, in: CGRect(x: 0, y: 0, width: aImage.size.height, height: aImage.size.width))
    default:
        ctx.draw(aImage.cgImage!, in: CGRect(x: 0, y: 0, width: aImage.size.width, height: aImage.size.height))
    }
    let cgimg : CGImage = ctx.makeImage()!
    let img : UIImage = UIImage(cgImage: cgimg)
    return img
}
