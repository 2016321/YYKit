//
//  YYKitManager.swift
//  YYKitDemo
//
//  Created by 王昱斌 on 17/4/6.
//  Copyright © 2017年 ibireme. All rights reserved.
//

import Foundation


class YYKitManager {
    
    /// 创建YYKit管理单例
    static let shareManager = YYKitManager()
    
    
    
}

//YYWebImage
extension YYAnimatedImageView{
    func manager_setImage(
        url : String! ,
        placeholder : UIImage? ,
        options : YYWebImageOptions! ,
        progress : YYWebImageProgressBlock? ,
        transform: YYWebImageTransformBlock? ,
        completion : YYWebImageCompletionBlock?) -> Void {
        self.setImageWith(URL(string : url), placeholder: placeholder, options: options, progress: progress , transform: transform, completion: completion)
    }
    
    func addTap() -> Void {
//        guard let imageView = imageView else {
//            return
//        }
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer {
            [unowned self]
            (sender) in
            if self.isAnimating{
                self.stopAnimating()
            }else{
                self.startAnimating()
            }
            let op : UIViewAnimationOptions = [.curveEaseInOut,.allowAnimatedContent,.beginFromCurrentState]
            UIView.animate(withDuration: 0.1, delay: 0, options: op, animations: {
                self.layer.transformScale = 0.97
            }, completion: { (finish) in
                UIView.animate(withDuration: 0.1, delay: 0, options: op, animations: {
                    self.layer.transformScale = 1.008
                }, completion: { (finish) in
                    UIView.animate(withDuration: 0.1, delay: 0, options: op, animations: {
                        self.layer.transformScale = 1
                    }, completion: nil)
                })
            })
            
        }
        addGestureRecognizer(tap)
    }
    
    
    func addPan() -> Void {
        self.isUserInteractionEnabled = true
        var previousIsPlaying : Bool = false
        
        let pan : UIPanGestureRecognizer = UIPanGestureRecognizer {
            [unowned self]
            (sender) in
            let image : YYAnimatedImage = self.image as! YYAnimatedImage
            if !image.conforms(to: YYAnimatedImage.self){
                return
            }
            let gestrue = sender as! UIPanGestureRecognizer
            let p = gestrue.location(in: gestrue.view)
            let progress = p.x / (gestrue.view?.width)!
            
            if gestrue.state == .began{
                previousIsPlaying = self.isAnimating
                self.stopAnimating()
                self.currentAnimatedImageIndex = image.animatedImageFrameCount() * UInt(progress)
            }else if gestrue.state == .ended || gestrue.state == .cancelled{
                if previousIsPlaying{
                    self.startAnimating()
                }
            }else{
                self.currentAnimatedImageIndex = image.animatedImageFrameCount() * UInt(progress)
            }
        }
        addGestureRecognizer(pan)
    }
}
