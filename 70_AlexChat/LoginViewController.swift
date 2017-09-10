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
    @IBOutlet weak var signInBtn: UIButton! {
        didSet {
            signInBtn.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        }
    }
    @IBOutlet weak var signUpBtn: UIButton! {
        didSet {
            signUpBtn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        }
    }
    
    func signIn() {
        //Sign in the user before the user can go to chatlistvc
        //1.
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {return}
        
        //2.
        if emailTextField.text == "" {
            createErrorVC("Empty email fill", "Please input valid email")
        } else if passwordTextField.text == "" {
            createErrorVC("Empty password fill", "Please input valid password")
        }
        
        //3. 
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                self.createErrorVC("Error", error.localizedDescription)
            }
            
            //if user is valid, go to ChatListVC
            if let user = user {
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "chatNavigationController") as? UINavigationController else {return}
                
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    func signUp() {
        guard let targetVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController else {return}
        
        navigationController?.pushViewController(targetVC, animated: true)
    }
    
    func createErrorVC(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if the user already signed in
        if Auth.auth().currentUser != nil {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "chatNavigationController") as? UINavigationController else {return}
            
            self.present(vc, animated: true, completion: nil)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Hide the navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}









