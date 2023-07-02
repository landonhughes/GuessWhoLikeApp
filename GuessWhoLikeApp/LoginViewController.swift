//
//  ViewController.swift
//  GuessWhoLikeApp
//
//  Created by Landon Hughes on 7/1/23.
//

import UIKit
import SCSDKLoginKit

class LoginViewController: UIViewController {
    var displayName: String!
    // Requesting the bitmoji is the only problem!!!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let loginButton = SCSDKLoginButton { success, error in
            guard success == true else { return }
            print(error.localizedDescription)
        }
        
 
        
        
        loginButton.sizeToFit()
        loginButton.center = view.center
        view.addSubview(loginButton)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let query = SCSDKUserDataQueryBuilder()
                        .withDisplayName()
                        .withBitmojiTwoDAvatarUrl()
                        .build()
        
        // Call fetch API
        SCSDKLoginClient.fetchUserData(with: query) { [weak self] userData, error in
            guard let data = userData else { return }
            self?.displayName = data.displayName ?? "Someone"
            print("Display name:", data.displayName ?? "Someone")
            print("Avatar url:", data.bitmojiTwoDAvatarUrl ?? "Default url")
        } failure: { error, _ in
            guard let error = error else { return }
            print("Error: \(error.localizedDescription)")
        }
    }
    
}



