//
//  UserViewController.swift
//  RWClean
//
//  Created by 岡田暁 on 2017-11-21.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    internal let authClient = AuthClient.shared
    // MARK: - Outlets
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var userTextFields: [UITextField]!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView(authClient.user)
        // Do any additional setup after loading the view.
    }

    private func configureView(_ user: User?) {
        guard let user = user else {
            signInButton.isHidden = false
            signOutButton.isHidden = true
            userTextFields.forEach {
                $0.isHidden = true
                $0.text = nil
                
            }
            return
            
        }
        signInButton.isHidden = true
        signOutButton.isHidden = false
        userTextFields.forEach { $0.isHidden = false
            
        }
        emailTextField.text = user.email
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        phoneNumberTextField.text = user.phoneNumber
        
    }
    // MARK: - Actions
    @IBAction func signInButtonPressed(_ sender: Any) {
        authClient.requestAuthToken(self, success: {[weak self] (_, user) in
        guard let strongSelf = self else { return }
        strongSelf.configureView(user)
    }, userCancelled: { [weak self] in
        guard let strongSelf = self else { return }
        strongSelf.configureView(nil)
    
    })
    
    }
    @IBAction func signOutButtonPressed(_ sender: Any) {
        authClient.signOut()
        configureView(nil)
    }

    

}
