//
//  ViewController.swift
//  MyScrollView
//
//  Created by paulo on 2017-10-17.
//  Copyright © 2017 paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let mainView = MyScrollView.scrollView
    let myScrollView = MyScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView.createView()
        mainView.frame = CGRect(x:0,y:0,width:self.view.bounds.width,height:self.view.bounds.height)
        view.addSubview(mainView)
        
        // Red Box
        let redView = UIView(frame: CGRect(x:20, y: 20,width: 100, height: 100))
        redView.backgroundColor = UIColor.red
        mainView.addSubview(redView)
        
        // Green Box
        let greenView = UIView(frame: CGRect(x:150, y: 150,width: 150, height: 200))
        greenView.backgroundColor = UIColor.green
        mainView.addSubview(greenView)
        
        // Blue Box
        let blueView = UIView(frame: CGRect(x: 40, y: 400, width: 200, height: 150))
        blueView.backgroundColor = UIColor.blue
        mainView.addSubview(blueView)
        
        // Yellow Box
        let  yelloView = UIView(frame: CGRect(x:100, y: 600, width: 180, height: 150))
        yelloView.backgroundColor = UIColor.yellow
        mainView.addSubview(yelloView)
    }
}

