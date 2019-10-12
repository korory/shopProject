//
//  LoginScreenViewController.swift
//  shopProject
//
//  Created by Arnau Rivas Rivas on 18/09/2019.
//  Copyright © 2019 Arnau Rivas Rivas. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginScreenViewController: UIViewController{
    
    @IBOutlet weak var lblLogin: UITextField?
    @IBOutlet weak var lblPassword: UITextField?
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var lblErrorText: UILabel!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    override func viewDidLoad() {
        guard let name = lblLogin!.text else {
            lblErrorText.text = "The Username is empty"
            return
        }
        lblLogin?.placeholder = "Username"
        lblPassword?.placeholder = "Password"
        lblPassword?.isSecureTextEntry = true
    }
    
    func logInCredentials(username:String?, password:String?){
        if username == "1234" && password == "qwerty"{
            present( UIStoryboard(name: "shopHomeStructure", bundle: nil).instantiateViewController(withIdentifier: "shopHomeIdentify") as UIViewController, animated: true, completion: nil)
        }else{
            lblErrorText.text = "The Username or password are incorrect"
        }
    }
    
    @IBAction func clickLoginBtn(_ sender: Any) {
        //Auth.auth().createUser(withEmail: lblLogin?.text, password: lblPassword?.text) { authResult, error in
            
        //logInCredentials(username: lblLogin?.text, password: lblPassword?.text)
    }
}
