//
//  LoginViewController.swift
//  testmission
//
//  Created by Bao on 17/01/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       
        let register = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        register.modalPresentationStyle = .fullScreen
                self.present(register, animated: true, completion: nil)
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
