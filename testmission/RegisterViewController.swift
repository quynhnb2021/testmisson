//
//  RegisterViewController.swift
//  testmission
//
//  Created by Bao on 17/01/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var idTextFiled: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var checkPwTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var birthdayTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tapJoinButton(_ sender: Any) {
    }
     @IBAction func tapBackButton(_ sender: Any) {
         dismiss(animated: true, completion: nil)
     }
     

}
