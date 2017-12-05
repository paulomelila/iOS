//
//  ViewController.swift
//  QuotePro
//
//  Created by Paulo on 2017-12-05.
//  Copyright © 2017 Paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newQuote()
        newImage()
        self.imageView.isUserInteractionEnabled = true
        self.quoteLabel.isUserInteractionEnabled = true
        self.authorLabel.isUserInteractionEnabled = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newImage() {
        let url = URL(string: "https://unsplash.it/300/200/?random")
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
    
    func newQuote() {
        
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        var newQuote: String?
        var newAuthor: String?
        
        let session = URLSession.shared
        
        session.dataTask(with: url) {data, response, err in
            
            var rawJson: AnyObject?
            
            do {
                rawJson = try JSONSerialization.jsonObject(with: data!, options: []) as AnyObject
            } catch let err {
                print(err.localizedDescription)
            }
            
            newQuote = rawJson?.value(forKeyPath: "quoteText") as? String
            newAuthor = rawJson?.value(forKeyPath: "quoteAuthor") as? String
            
            if (newQuote != nil) || (newAuthor != nil) {
                DispatchQueue.main.async {
                    
                    self.quoteLabel.text = newQuote
                    self.authorLabel.text = ("- \(newAuthor!)")
                }
            } else {
                self.newQuote()
            }
            
        }.resume()
    }
    
    @IBAction func quoteTapped(_ sender: UITapGestureRecognizer) {
        newQuote()
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        newImage()
    }
    
    
    
}

