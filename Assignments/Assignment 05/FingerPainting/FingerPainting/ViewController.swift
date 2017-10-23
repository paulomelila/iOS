//
//  ViewController.swift
//  FingerPainting
//
//  Created by paulo on 2017-10-23.
//  Copyright © 2017 paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var canvasView : CanvasView!
    var selectedColor : UIButton?
    var clearButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // blue pen
        let blueImage = UIImage(named: "blue") as UIImage?
        let blueBtn = UIButton(frame: CGRect(x:80,y:(self.view.frame.size.height - 50), width:40, height:40))
        blueBtn.setImage(blueImage, for: .normal)
        blueBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        blueBtn.tag = 2
        self.view.addSubview(blueBtn)
        blueBtn.backgroundColor = UIColor.blue
        
        // green pen
        let greenImage = UIImage(named: "green") as UIImage?
        let greenBtn = UIButton(frame: CGRect(x:130,y:(self.view.frame.size.height - 50), width:40, height:40))
        greenBtn.setImage(greenImage, for: .normal)
        greenBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        greenBtn.tag = 3
        greenBtn.backgroundColor = UIColor.green
        self.view.addSubview(greenBtn)
        
        // red pen
        let redImage = UIImage(named: "red") as UIImage?
        let redBtn = UIButton(frame: CGRect(x:30,y:(self.view.frame.size.height - 50), width:40, height:40))
        redBtn.setImage(redImage, for: .normal)
        redBtn.addTarget(self, action: #selector(self.onClick(_:)), for:.touchUpInside)
        redBtn.tag = 1
        redBtn.backgroundColor = UIColor.red
        self.view.addSubview(redBtn)
        
        // eraser
        let eraseImage = UIImage(named: "eraser") as UIImage?
        let eraseBtn = UIButton(frame: CGRect(x:180,y:(self.view.frame.size.height - 50), width:40, height:40))
        eraseBtn.setImage(eraseImage, for: .normal)
        eraseBtn.addTarget(self, action:#selector(self.eraseButtonTapped), for:.touchUpInside)
        eraseBtn.tag = 4
        self.view.addSubview(eraseBtn)
    }
    
    @objc func eraseButtonTapped(button: UIButton) {
        self.canvasView.clear()
    }
    
    @objc func onClick(_ sender: AnyObject){
        let button = sender as! UIButton
        button.layer.shadowColor = UIColor(white: 0.4, alpha: 1).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 1
        
        self.canvasView.currentColor = button.backgroundColor!
       
    }
}
