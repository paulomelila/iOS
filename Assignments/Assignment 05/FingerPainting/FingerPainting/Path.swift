//
//  Path.swift
//  FingerPainting
//
//  Created by paulo on 2017-10-23.
//  Copyright © 2017 paulo. All rights reserved.
//

import Foundation
import UIKit

class Path {
    var points: [CGPoint] = []
    let  color: UIColor
    
    init(color: UIColor) {
        self.color = color
    }
    
    func add(point: CGPoint){
        points.append(point)
    }
}
