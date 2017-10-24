//
//  ViewController.swift
//  UICollectionView
//
//  Created by paulo on 2017-10-24.
//  Copyright © 2017 paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let dogs = ["Labrador Retriever", "German Shepherd", "Bulldog", "Golden Retriever", "Poodle", "Beagle", "Rottweiler", "Yorkshire Terrier", "Siberian Husky", "Pug"]
    let images = ["1","2","3","4","5","6","7","8","9","10"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secondVC = UIViewController()
        let imageV = UIImageView(frame: secondVC.view.frame)
        imageV.image = UIImage(named: images[indexPath.row])
        secondVC.view.addSubview(imageV)
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        
        cell.myImageView.image = UIImage(named: images[indexPath.row])
        cell.myLabel.text = dogs[indexPath.row]
        cell.backgroundColor = UIColor.gray
        
        return cell
    }
}
