//
//  LoginViewController.swift
//  testmission
//
//  Created by Bao on 17/01/2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        guard
        let username = idTextField.text,
            username != "",
        let password = passwordTextField.text,
            password != ""
        else
        {
            AlertController.showAlert(inViewController: self, title: "Alert", message: "Please fill out all fields.")
            return
        }


        Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
            // ...
            if(user != nil)
            {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

                let register = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                register.modalPresentationStyle = .fullScreen
                        self.present(register, animated: true, completion: nil)
            }
            if(error != nil)
            {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
            }
        }

        
       
    }
    
    @IBAction func tapJoinButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       
        let register = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        register.modalPresentationStyle = .fullScreen
                self.present(register, animated: true, completion: nil)
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
