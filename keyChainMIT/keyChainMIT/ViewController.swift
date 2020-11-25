//
//  ViewController.swift
//  keyChainMIT
//
//  Created by Hamza Mustafa on 23/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let (email,pass) = KeychainWrapper.standard.cachedUsername()
        //check if we have email pass already save in keychain
        if email != nil && pass != nil {
            print(email,pass)
            //remove email pass from keychain
            KeychainWrapper.standard.purgeUsernameFromCache()
        }
    }

    @IBAction func loginAction(_ sender: UIButton) {
        // save new email pass in keychain
        if let user = usernameTxt.text , let pass = passwordTxt.text {
            KeychainWrapper.standard.cacheUsername(email: user, password: pass)
        }
    }
}

