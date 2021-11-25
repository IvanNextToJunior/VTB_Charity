//
//  ViewController.swift
//  VTB_Charity
//
//  Created by Ivan on 20.11.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var middleNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUPButton(_ sender: UIButton) {
   validate()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup () {
        nameTextField.delegate = self
        middleNameTextField.delegate = self
        lastNameTextField.delegate = self
    }
    private func validate () {
        
        do {
            let name: String = try nameTextField.validateText(validators: [TextLengthValidator(minTextLength: 2, message: "В имени должно быть не менее 2 символов"), RegularExpressionValidator(pattern: "^[a-zA-Zа-яА-Я]+$", message: "Имя содержит недопустимые симоволы")])
            
            let lastName = try lastNameTextField.validateText(validators: [TextLengthValidator(minTextLength: 3, message: "В фамилии должно быть не менее 3 символов"), RegularExpressionValidator(pattern: "^[a-zA-Zа-яА-Я]+$", message: "Фамилия содержит недопустимые симоволы")])

            
            let middleName = try middleNameTextField.validateText(validators: [TextLengthValidator(minTextLength: 5, message: "В отчестве должно быть не менее 5 символов"), RegularExpressionValidator(pattern: "^[a-zA-Zа-яА-Я]+$", message: "Отчество содержит недопустимые симоволы")])
            
            let password = try passwordTextField.validateText(validators: [TextLengthValidator(minTextLength: 4, message: "Пароль должен содержать не менее 4 символов и не больше 10 символов"), RegularExpressionValidator(pattern: "^[A-Z0-9a-z._%+-]+[A-Za-z0-9.-]+\\.[A-Za-z]{4,10}$", message: "Пароль содержит недопустимые симоволы")])
            
           
            save(name: name, lastName: lastName, middleName: middleName, password: password)
           
            performSegue(withIdentifier: "registration", sender: self)
        }
        
        catch {
            let e = error
         
            debugPrint(e)
            let alert = UIAlertController(title: "Ошибка валидации", message: (error as! ValidationError).message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Продолжить", style: .default, handler:nil))
            present(alert, animated: true, completion: nil)
        }
}

    private func save (name: String, lastName: String, middleName: String, password: String) {
      
        let userData = UserData()
      
        userData.getUser(name: name, lastName: lastName, middleName: middleName)
       
        Preferences.password = password
    }

}
extension AuthorizationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        
        case nameTextField:
            middleNameTextField.becomeFirstResponder()
            
        case middleNameTextField:
            lastNameTextField.becomeFirstResponder()
            
        case lastNameTextField:
            passwordTextField.becomeFirstResponder()
            
        case passwordTextField:
            textField.resignFirstResponder()
            
        default:
            break
            
        }
        
        return true
        
    }
}
