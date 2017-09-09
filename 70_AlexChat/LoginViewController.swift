//
//  LoginViewController.swift
//  70_AlexChat
//
//  Created by Alex Koh on 09/09/2017.
//  Copyright © 2017 AlexKoh. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var stealthSignInBtn: UIButton! {
        didSet {
            stealthSignInBtn.addTarget(self, action: #selector(didStealthLoginSuccessfully), for: .touchUpInside)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func didStealthLoginSuccessfully() {
        if emailTextField.text != "" {
            Auth.auth().signInAnonymously(completion: { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
            })
        }
    }
}









