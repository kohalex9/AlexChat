//
//  SignUpViewController.swift
//  70_AlexChat
//
//  Created by Alex Koh on 10/09/2017.
//  Copyright © 2017 AlexKoh. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignUpViewController: UIViewController {

    @IBOutlet weak var enterEmailTextField: UITextField!
    
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var reconfirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton! {
        didSet{
            signUpBtn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        }
    }
    
    func signUp() {
        
        //the following steps add new user to database
        //1.
        guard let email = enterEmailTextField.text,
                let password = enterPasswordTextField.text,
            let confirmPassword = reconfirmPasswordTextField.text else {return}
        
        //2.
        if password != confirmPassword {
            createErrorVC("Password Error", "Password does not match")
        } else if email == "" || password == "" || confirmPassword == "" {
            createErrorVC("Missing input fill", "Please fill up your info appropriately in the respective spaces.")
        }
        
        //3. 
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                self.createErrorVC("Error", error.localizedDescription)
            }
            
            if let validUser = user {
                let ref = Database.database().reference()
                
                let post : [String:Any] = ["email": email]
                
                ref.child("Users").child(validUser.uid).setValue(post)
                
            //go back to login page so that user can login using the newly created credentials
            self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func createErrorVC(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
