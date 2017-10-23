//
//  CanvasView.swift
//  FingerPainting
//
//  Created by paulo on 2017-10-23.
//  Copyright © 2017 paulo. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    var paths: [Path] = []
    var currentPath: Path?
    
    var currentColor: UIColor = UIColor.black{
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentPath = Path(color: currentColor)
        paths.append(currentPath!)
        addToPath(touches: touches as NSSet)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        addToPath(touches: touches as NSSet)
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        addToPath(touches: touches as NSSet)
    }
    
    private func addToPath(touches: NSSet) {
        let t = touches.anyObject() as! UITouch
        let point = t.location(in: self)
        self.currentPath!.add(point: point)
    }
    
    func clear() {
        self.paths = []
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context!.beginPath()
        
        for path in paths {
            let points = path.points
            for i in 0..<points.count-1 {
                let p1 = points[i]
                let p2 = points[i+1]
                context?.move(to:CGPoint(x: p1.x, y: p1.y))
                context?.addLine(to: CGPoint(x: p2.x, y: p2.y))
            }
    
            context!.setLineWidth(2)
            context!.setStrokeColor(path.color.cgColor)
            context!.strokePath()
        }
    }
}

