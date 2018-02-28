//
//  ForgotPasswordViewController.swift
//  VideoQuickStart
//
//  Created by Sana Gill on 6/28/17.
//  Copyright © 2017 Twilio, Inc. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //create a blue border around the login button
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor(red:14.0/255, green:122.0/255, blue:254.0/255, alpha:1.0).cgColor
        
        emailTextField.delegate=self
        usernameTextField.delegate=self
        
        //dismiss keyboard if user taps off of the text field
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        // Do any additional setup after loading the view.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // when return is pressed the user is moved to the next text field
        if (textField == emailTextField)
        {
            self.usernameTextField.becomeFirstResponder()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
