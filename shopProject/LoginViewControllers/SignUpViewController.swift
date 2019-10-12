//
//  SignUpViewController.swift
//  shopProject
//
//  Created by Arnau Rivas Rivas on 18/09/2019.
//  Copyright © 2019 Arnau Rivas Rivas. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    @IBOutlet weak var lblFirstName: UITextField!
    @IBOutlet weak var lblLastName: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validateElements()
 
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    }
    
    
    func validateElements(){
        lblError.isHidden = true
        Utilities.styleTextField(lblFirstName)
        Utilities.styleTextField(lblLastName)
        Utilities.styleTextField(lblEmail)
        Utilities.styleTextField(lblPassword)
        Utilities.styleFilledButton(btnSignUp)
    }
    
    func checkStringLabels() -> String?{
        //Take label and delete all the spaces
        //If the lbl when we remove all the space is nil, we return a error message
        if lblFirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lblLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lblEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lblPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all the fields before you click on the Sign Up button"
        }
        
        if Utilities.isPasswordValid(lblPassword.text!) == false{
            return "Plase make sure your password is at least 8 characters, containts a special character and a number"
        }
        
        
        return nil
    }
    
    @IBAction func clickSignUpButton(_ sender: Any) {
        //Validate Fields
        let error: String? = checkStringLabels()
        
        //If the error is not nil, the fields are incorrect put the message into the error label
        //Else create the user into the BD
        if error != nil{
            showError(error!)
        }else{
            //Clean the spaces to the rest of the labels
            let firstName: String? = lblFirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName: String? = lblLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email: String?  = lblEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let password:String? = lblPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Guard Example
             //guard let email = lblEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return <#default value#> }
            
            //Create User into FireBase
            Auth.auth().createUser(withEmail: email!, password: password!) { (result, err) in
                //Check for errors
                if err != nil{
                    self.showError("Error creating user")
                }else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["first_name":firstName!, "last_name": lastName!, "uid": result!.user.uid], completion: { (error) in
                        if error != nil{
                            self.showError("Error saving the user into the database")
                        }else{
                            //Transitioons to the Home Storyboard
                            //self.present( UIStoryboard(name: "shopHomeStructure", bundle: nil).instantiateViewController(withIdentifier: "shopHomeIdentify") as UIViewController, animated: true, completion: nil)
                            
                            let storyboard: UIStoryboard = UIStoryboard(name: "shopHomeStructure", bundle: nil)
                            
                            let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "shopHomeStructure")
                            self.navigationController?.pushViewController(viewController, animated: true)
                        }
                    })
                    self.showError("User created successfully")
                }
            }
        }
    }
    
    func showError(_ message: String){
        lblError.text = message
        lblError.isHidden = false
    }
}
