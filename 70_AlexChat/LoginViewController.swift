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
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton! {
        didSet {
            signUpBtn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        }
    }
    
    func signUp() {
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {return}
        
        navigationController?.pushViewController(targetVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}









