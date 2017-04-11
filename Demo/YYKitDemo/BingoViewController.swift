//
//  BingoViewController.swift
//  YYKitDemo
//
//  Created by 王昱斌 on 17/4/6.
//  Copyright © 2017年 ibireme. All rights reserved.
//

import UIKit



class BingoViewController: UIViewController {

    let imageView = YYAnimatedImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 75))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.center = view.center
        view.addSubview(imageView)
        imageView.bingo_addPan()
        imageView.bingo_addTap()
        
        view.backgroundColor = UIColor.white
        
        
        
        
        
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.imageView.bingo_setImage(url:"https://s-media-cache-ak0.pinimg.com/1200x/2e/0c/c5/2e0cc5d86e7b7cd42af225c29f21c37f.jpg", placeholder: UIImage(named : "pia@2x" ), options: [.progressiveBlur,.setImageWithFadeAnimation], progress: { (receivedSize, expectedSize) in
            print("\(receivedSize) -------------- \(expectedSize)")
        }, transform: nil) { (image, url, type, stage, error) in
            print("bingo")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
