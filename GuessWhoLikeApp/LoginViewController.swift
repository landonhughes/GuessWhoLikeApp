//
//  ViewController.swift
//  GuessWhoLikeApp
//
//  Created by Landon Hughes on 7/1/23.
//

import UIKit
import SCSDKLoginKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let loginButton = SCSDKLoginButton { success, error in
            guard success == true else { return }
        }
        loginButton.sizeToFit()
        loginButton.center = view.center
        view.addSubview(loginButton)
    }
    
}



