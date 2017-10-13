//
//  ViewController.swift
//  TipCalculator
//
//  Created by paulo on 2017-10-13.
//  Copyright © 2017 paulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(notification:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(notification:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let bill = Double (billAmountTextField.text!)
        let tipPercentage = Double(sender.value)
        let totalAmount = bill! * (1 + (tipPercentage/100))
        
        // displaying the total amount as currency format
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        currencyFormatter.locale = NSLocale.current
        let totalAmountString = currencyFormatter.string(from: totalAmount as NSNumber)
        
        // displaying the tip percentage without decimal points
        let decimalFormatter = NumberFormatter()
        decimalFormatter.allowsFloats = false
        let tip = decimalFormatter.string(from: tipPercentage as NSNumber)
        
        tipPercentageLabel.text = tip! + "%"
        totalAmountLabel.text = totalAmountString
    }
}
