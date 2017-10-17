//
//  MyScrollView.swift
//  MyScrollView
//
//  Created by paulo on 2017-10-17.
//  Copyright © 2017 paulo. All rights reserved.
//

import UIKit

class MyScrollView: UIView {
    static var scrollView = UIScrollView()
    let view = UIView()
    
    func createView() {
        MyScrollView.scrollView.isScrollEnabled = true
        MyScrollView.scrollView.contentSize = CGSize(width:1000, height: 1000)
        
        let gestureRec = UIPanGestureRecognizer(target: self, action: #selector(handleGesture))
        view.addGestureRecognizer(gestureRec)
    }
    
    @objc func handleGesture(gestureRec: UIPanGestureRecognizer) {
        let translation = gestureRec.translation(in: view)
        let bounds = view.bounds
        let newX = view.bounds.origin.x - translation.x
        let newY = view.bounds.origin.y - translation.y
        view.bounds = CGRect(x: newX, y: newY, width: bounds.size.width, height: bounds.size.height)
        gestureRec.setTranslation(CGPoint.zero, in: view)
    }
}

