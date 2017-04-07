//
//  BingoFPSLabel.swift
//  YYKitDemo
//
//  Created by 王昱斌 on 17/4/7.
//  Copyright © 2017年 ibireme. All rights reserved.
//

import UIKit

let kSize = CGSize(width: 55, height: 20)

class BingoFPSLabel: UILabel {

    let _link = CADisplayLink(target: YYWeakProxy.init(target: self), selector: #selector(tick(link:)))
    var _count = 0
    var _lastTime = 0
    var _font = UIFont()
    var _subFont = UIFont()
    
    
    
    override init(frame: CGRect) {
        if frame.size.width == 0 && frame.size.height == 0 {
            super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: kSize.width, height: kSize.height))
        }else{
            super.init(frame: frame)
        }
        layer.cornerRadius = 5
        clipsToBounds = true
        textAlignment = .center
        isUserInteractionEnabled = false
        backgroundColor = UIColor(white: 0.0, alpha: 0.7)
        _font = UIFont(name: "Menlo", size: 14)!
        if UIFont(name: "Menlo", size: 14) != nil {
            _subFont = UIFont(name: "Menlo", size: 4)!
        }else{
            _font = UIFont(name: "Courier", size: 14)!
            _subFont = UIFont(name: "Courier", size: 14)!
        }
        _link.add(to: RunLoop.main, forMode: .commonModes)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        _link.invalidate()
    }
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return kSize
    }
    
    
    func tick(link : CADisplayLink) -> Void {
        if _lastTime == 0 {
            _lastTime = Int(link.timestamp)
            return
        }
        _count += 1
        let delta = TimeInterval(link.timestamp) - TimeInterval(_lastTime)
        if delta < 1 {
            return
        }
        _lastTime = Int(link.timestamp)
        let fps : CGFloat = CGFloat(_count) / CGFloat(delta)
        _count = 0
        
        let progress = fps / 60.0
        let color = UIColor(hue: 0.27 * (progress - 0.2), saturation: 1, lightness: 0.9, alpha: 1)
        let text = NSMutableAttributedString(string: "\(Int(round(fps))) FPS")
        text.setColor(color, range: NSMakeRange(0, text.length - 3))
        text.setColor(UIColor.white, range: NSMakeRange(text.length - 3, 3))
        text.font = _font
        text.setFont(_subFont, range: NSMakeRange(text.length - 4, 1))
        
        self.attributedText = text
    }
}


extension BingoFPSLabel{
    
    
    
    
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    if (frame.size.width == 0 && frame.size.height == 0) {
//        frame.size = kSize;
//    }
//    self = [super initWithFrame:frame];
//    
//    self.layer.cornerRadius = 5;
//    self.clipsToBounds = YES;
//    self.textAlignment = NSTextAlignmentCenter;
//    self.userInteractionEnabled = NO;
//    self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.700];
//    
//    _font = [UIFont fontWithName:@"Menlo" size:14];
//    if (_font) {
//        _subFont = [UIFont fontWithName:@"Menlo" size:4];
//    } else {
//        _font = [UIFont fontWithName:@"Courier" size:14];
//        _subFont = [UIFont fontWithName:@"Courier" size:4];
//    }
//    
//    _link = [CADisplayLink displayLinkWithTarget:[YYWeakProxy proxyWithTarget:self] selector:@selector(tick:)];
//    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
//    return self;
//}
