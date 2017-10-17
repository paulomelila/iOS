//
//  DetailViewController.swift
//  ImageGalleries
//
//  Created by paulo on 2017-10-17.
//  Copyright © 2017 paulo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var image : UIImage?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imageView.image = image
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

