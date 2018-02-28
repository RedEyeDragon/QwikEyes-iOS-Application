//
//  RegisterPageViewController.swift
//  VideoQuickStart
//
//  Created by Sana Gill on 6/26/17.
//  Copyright © 2017 Twilio, Inc. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reenterPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var boxIsChecked = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a blue border around the login button
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor(red:14.0/255, green:122.0/255, blue:254.0/255, alpha:1.0).cgColor

        firstNameTextField.delegate=self
        lastNameTextField.delegate=self
        emailTextField.delegate=self
        reenterPasswordTextField.delegate=self
        usernameTextField.delegate=self
        passwordTextField.delegate=self
        
        //dismiss keyboard if user taps off of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // when return is pressed the user is moved to the next text field
        if (textField == lastNameTextField)
        {
            self.firstNameTextField.becomeFirstResponder()
        }
        
        else if (textField == firstNameTextField)
        {
            self.emailTextField.becomeFirstResponder()
        }
            
        else if (textField == emailTextField)
        {
            self.usernameTextField.becomeFirstResponder()
        }
            
        else if (textField == usernameTextField)
        {
            self.passwordTextField.becomeFirstResponder()
        }
            
        else if (textField == passwordTextField)
        {
            self.reenterPasswordTextField.becomeFirstResponder()
        }
            
        else
        {
            self.view.endEditing(true)
        }
        return true;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkBox(_ sender: AnyObject)
    {
        if (boxIsChecked)
        {
            boxIsChecked = false
            //if box unchecked change to checked
            self.checkboxButton.setImage(UIImage(named: "uncheckBox")!, for: .normal)
        }
        
        else
        {
            boxIsChecked = true;
            self.checkboxButton.setImage(UIImage(named: "checkBox")!, for: .normal)
        }
    }


    @IBAction func registerButton(sender: AnyObject)
    {
        let firstName = firstNameTextField.text;
        let lastName = lastNameTextField.text;
        let email = emailTextField.text;
        let username = usernameTextField.text;
        let password = passwordTextField.text;
        let reenterPassword = reenterPasswordTextField.text;
        let myColor : UIColor = UIColor.red
        let borderColor : UIColor = UIColor(red:204.0/255.0, green:204.0/255.0, blue:204.0/255.0, alpha:1.0)
        
        //Set the boxes to be normal color (no error) each time the user reenters info
        firstNameTextField.layer.borderColor = borderColor.cgColor
        firstNameTextField.layer.borderWidth = 0.5
        firstNameTextField.layer.cornerRadius = 5;
        emailTextField.layer.borderColor = borderColor.cgColor
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 5;
        usernameTextField.layer.borderColor = borderColor.cgColor
        usernameTextField.layer.borderWidth = 0.5
        usernameTextField.layer.cornerRadius = 5;
        passwordTextField.layer.borderColor = borderColor.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 5;
        reenterPasswordTextField.layer.borderColor = borderColor.cgColor
        reenterPasswordTextField.layer.borderWidth = 0.5
        reenterPasswordTextField.layer.cornerRadius = 5;

        
        //check for blank entries
        
        if (firstName?.isEmpty)!
        {
            //Display red and show alert message
            alertMessage(userMessage: "Please provide your first name to set up your account.");
            
            firstNameTextField.layer.borderColor = myColor.cgColor
            firstNameTextField.layer.borderWidth = 1
            firstNameTextField.layer.cornerRadius = 5;
            return;
        }
        
        if(email?.isEmpty)!
        {
            //Display red and show alert message
            alertMessage(userMessage: "An email is required to set up your account.");
            
            emailTextField.layer.borderColor = myColor.cgColor
            emailTextField.layer.borderWidth = 1
            emailTextField.layer.cornerRadius = 5;
            return;
        }
        
        if(username?.isEmpty)!
        {
            //Display red and show alert message
            alertMessage(userMessage: "A username is required to set up your account.");
            
            usernameTextField.layer.borderColor = myColor.cgColor
            usernameTextField.layer.borderWidth = 1
            usernameTextField.layer.cornerRadius = 5;
            return;
        }
        
        if(password?.isEmpty)!
        {
            //Display red and show alert message
            alertMessage(userMessage: "A password is required to set up your account.");
            
            passwordTextField.layer.borderColor = myColor.cgColor
            passwordTextField.layer.borderWidth = 1
            passwordTextField.layer.cornerRadius = 5;
            return;
        }
        
        if(reenterPassword?.isEmpty)!
        {
            //Display red and show alert message
            alertMessage(userMessage: "The reenter password field is required.");
            
            reenterPasswordTextField.layer.borderColor = myColor.cgColor
            reenterPasswordTextField.layer.borderWidth = 1
            reenterPasswordTextField.layer.cornerRadius = 5;
            return;
        }
        
        //check that the user entered the same passwords
        if(password != reenterPassword)
        {
            alertMessage(userMessage: "Passwords do not match");
            
            //Display red and show alert message
            passwordTextField.layer.borderColor = myColor.cgColor
            passwordTextField.layer.borderWidth = 1
            passwordTextField.layer.cornerRadius = 5;
            
            reenterPasswordTextField.layer.borderColor = myColor.cgColor
            reenterPasswordTextField.layer.borderWidth = 1
            reenterPasswordTextField.layer.cornerRadius = 5;

            return;
        }
        
        /*
        if (!boxIsChecked)
        {
            alertMessage(userMessage: "You must be 18 or older to create a QwikEyes account")
            
            return;
        }
        
        */
        
        //Store data
        UserDefaults.standard.set(username, forKey:"username");
        UserDefaults.standard.set(email, forKey:"email");
        UserDefaults.standard.set(firstName, forKey:"firstName");
        UserDefaults.standard.set(password, forKey:"password");
        
        if (!(lastName?.isEmpty)!)
        {
            UserDefaults.standard.set(lastName, forKey:"lastName");
        }
        else
        {
            UserDefaults.standard.set(lastName, forKey:"");
        }
        
        // show confirmation message
        var alert = UIAlertController(title:"Registration is successful!", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default)
        {
            action in self.dismiss(animated: true, completion: nil);
        }
        
        alert.addAction(okAction);
        self.present(alert, animated:true, completion: nil);

    }
    
    func alertMessage(userMessage: String)
    {
        var alert = UIAlertController(title:userMessage, message: "", preferredStyle: UIAlertControllerStyle.alert);
        let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.default, handler:nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
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
