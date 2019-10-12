//
//  LoginViewController.swift
//  shopProject
//
//  Created by Arnau Rivas Rivas on 18/09/2019.
//  Copyright © 2019 Arnau Rivas Rivas. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var lblFirstName: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeElements()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        lblPassword.isSecureTextEntry = true
        
        #if DEBUG
            lblFirstName.text = "test@test.com"
            lblPassword.text = "Testing21!"
        #endif
    }
    
    func initializeElements(){
        lblError.isHidden = true
        Utilities.styleTextField(lblFirstName)
        Utilities.styleTextField(lblPassword)
        Utilities.styleFilledButton(btnLogIn)
    }
    
    @IBAction func clickLogInBtn(_ sender: Any) {
        
        //Validate all the Fields
        let email: String? = lblFirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password: String? = lblPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Sig in the user
        Auth.auth().signIn(withEmail: email!, password: password!) { (result, err) in
            if err != nil{
                self.lblError.text = err?.localizedDescription
                self.lblError.isHidden = false;
            }else{
                //Transitioons to the Home Storyboard
//                self.present( UIStoryboard(name: "shopHomeStructure", bundle: nil).instantiateViewController(withIdentifier: "shopHomeIdentify") as UIViewController, animated: true, completion: nil)
                let storyboard: UIStoryboard = UIStoryboard(name: "shopHomeStructure", bundle: nil)
                                   
               let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "shopHomeStructure")
               self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
