//
//  RegisterViewController.swift
//  testmission
//
//  Created by Bao on 17/01/2022.
//

import UIKit
import Firebase

class AlertController {
    static func showAlert(inViewController: UIViewController, title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        inViewController.present(alert, animated: true, completion: nil)
        
    }
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

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
        guard
        let username = idTextFiled.text,
            username != "",
        let email = emailTF.text,
            email != "",
        let password = pwTextField.text,
            password != "",
        let checkpassword = checkPwTF.text,
        checkpassword != "",
        let birthday = birthdayTF.text,
        checkpassword != ""
        
        else
        {
            AlertController.showAlert(inViewController: self, title: "Alert", message: "Please fill out all fields.")
            return
        }
        
        if(password.count < 8) {
            AlertController.showAlert(inViewController: self, title: "Alert", message: "Password need more 8 characters")
            return
        }
        
        if(password != checkpassword ) {
            AlertController.showAlert(inViewController: self, title: "Alert", message: "Password is not matching")
            return
        }
        
        if(!email.isValidEmail) {
            AlertController.showAlert(inViewController: self, title: "Alert", message: "Email is invalid")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
//                AlertController.showAlert(inViewController: self, title: "Alert", message: "Email/Username in use, try again")
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
//                self.showError("Error create user")
            } else {
                let db = Firestore.firestore()
                var ref: DocumentReference? = nil
                ref = db.collection("users").addDocument(data: [
                    "id": result!.user.uid,
                    "username": username,
                    "email": email,
                    "password": password,
                    "birthday": birthday
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                        AlertController.showAlert(inViewController: self, title: "Alert", message: "Register Successfull!!!")
                    }
                }

            }
        }
//        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
    }
     @IBAction func tapBackButton(_ sender: Any) {
         dismiss(animated: true, completion: nil)
     }
     

}
