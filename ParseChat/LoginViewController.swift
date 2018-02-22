//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Anish Adhikari on 2/21/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameField.becomeFirstResponder()
        passwordField.becomeFirstResponder()
    
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerUser(_ sender: Any) {
        activityIndicator.startAnimating()
        let user = PFUser()
        
        let username = userNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (username?.isEmpty)! {
            presentAlert(msg: "Username Required", description: "Please enter your username and password")
        } else if (password?.isEmpty)! {
            presentAlert(msg: "Password Required", description: "Please enter your username and password")
        }
        
        user.username = username
        user.password = password
        
        user.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("User Sucessfully Registered")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print(error?.localizedDescription)
            }
            self.activityIndicator.stopAnimating()
        }
    }
    
    @IBAction func loginUser(_ sender: Any) {
        activityIndicator.startAnimating()
        let username = userNameField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if (username?.isEmpty)! {
            presentAlert(msg: "Username Required", description: "Please enter your username and password")
        } else if (password?.isEmpty)! {
            presentAlert(msg: "Password Required", description: "Please enter your username and password")
        }
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user: PFUser?, error: Error?) in
            if user != nil {
                print(" User successfully logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                self.presentAlert(msg: "Can't Login", description: (error?.localizedDescription)!)
            }
            self.activityIndicator.stopAnimating()
        }
        
    }
    
    func presentAlert(msg: String, description: String) {
        let alertController = UIAlertController(title: msg, message: description, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
