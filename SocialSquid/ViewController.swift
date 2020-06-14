//
//  ViewController.swift
//  SocialSquid
//
//  Created by Alley Pereira on 5/27/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

@IBOutlet weak var signInButton: GIDSignInButton!
    
   override func viewDidLoad() {
      super.viewDidLoad()

      GIDSignIn.sharedInstance()?.presentingViewController = self

      // Automatically sign in the user.
      GIDSignIn.sharedInstance()?.restorePreviousSignIn()

      // ...
    }
}
