//
//  AuthViewController.swift
//  VKNewsFeed
//
//  Created by WSR on 17/07/2019.
//  Copyright © 2019 Rainblower. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authServise: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        authServise = AppDelegate.shared().authService
    }
    

    @IBAction func signInTouch() {
        authServise.wakeUpSession()
    }
    
}
