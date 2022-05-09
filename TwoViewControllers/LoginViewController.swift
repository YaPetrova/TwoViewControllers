//
//  ViewController.swift
//  TwoViewControllers
//
//  Created by Петрова Яна Георгиевна on 01.05.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController, userNameTF.text == "Hacker" && passwordTF.text == "qwe123" else {
            showAlert(with: "Access denied", and: "Hacking into the system is prevented")
            return
        }
        
        welcomeVC.welcome = userNameTF.text
    }
        
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func userNameReminder(_ sender: Any) {
        showAlert(with: "Super secret information", and: "User Name: Hacker")
    }
    
    @IBAction func passwordReminder(_ sender: Any) {
        showAlert(with: "Super secret information", and: "Password: qwe123")
    }
}

// MARK: - Alert Controls

extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

