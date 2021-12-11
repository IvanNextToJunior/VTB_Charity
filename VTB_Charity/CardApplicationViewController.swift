//
//  CardApplicationViewController.swift
//  VTB_Charity
//
//  Created by Ivan on 11.12.2021.
//

import UIKit

class CardApplicationViewController: UIViewController {
    
    @IBOutlet weak var cardNameLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var pinTextField: UITextField!
    
    @IBOutlet weak var repeatPinTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    private func setup () {
        pinTextField.delegate = self
        repeatPinTextField.delegate = self
    }
    
    private func setPin() {
        
    }

    

}

extension CardApplicationViewController: UITextFieldDelegate {
    
}
