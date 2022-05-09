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
    
    private let name = "Hacker"
    private let password = "qwe123"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.welcome = name
    }
        
    @IBAction func logInPressed() {
        if userNameTF.text != name || passwordTF.text != password {
            showAlert(with: "Access denied", and: "Hacking into the system is prevented")
        }
    }
    
    @IBAction func userNameReminder(_ sender: Any) {
        showAlert(with: "Super secret information", and: "User Name: \(name)")
    }
    
    @IBAction func passwordReminder(_ sender: Any) {
        showAlert(with: "Super secret information", and: "Password: \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
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

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            logInPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
}

