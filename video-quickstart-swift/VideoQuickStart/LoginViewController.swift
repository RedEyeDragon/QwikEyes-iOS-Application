//
//  LoginViewController.swift
//  VideoQuickStart
//
//  Created by Sana Gill on 6/27/17.
//  Copyright © 2017 Twilio, Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var usernameTextField: UITextField! = nil
    @IBOutlet weak var passwordTextField: UITextField! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameTextField.delegate=self
        passwordTextField.delegate=self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))

}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if (textField == usernameTextField)
        {
            self.passwordTextField.becomeFirstResponder()
        }
        else
        {
            self.view.endEditing(true)
        }
        return true;
    }
    

    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginButton(_ sender: Any)
    {
        let username = usernameTextField.text;
        let password = passwordTextField.text;
        
        let usernameStored = UserDefaults.standard.string(forKey: "username")
        
        let passwordStored = UserDefaults.standard.string(forKey: "password")
        
        if (usernameStored == username)
        {
            if (passwordStored == password)
            {
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
                self.performSegue(withIdentifier: "homeView", sender: self)
            }
        }
        
        /*
        else
        {
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
            self.dismiss(animated: true, completion: nil);
        }
        */
        
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
