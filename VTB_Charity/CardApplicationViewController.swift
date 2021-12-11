//
//  CardApplicationViewController.swift
//  VTB_Charity
//
//  Created by Ivan on 11.12.2021.
//

import UIKit

protocol CardApplicationViewControllerDelegate: class {
    func cardApplicationViewControllerDidShow(vc: CardApplicationViewController)
}


class CardApplicationViewController: UIViewController {
    
    @IBOutlet weak var cardNameLabel: UILabel!
    
    @IBOutlet weak private var nameTextField: UITextField!
    
    @IBOutlet weak private var passwordTextField: UITextField!
    
    @IBOutlet weak private var pinTextField: UITextField!
    
    @IBOutlet weak private var repeatPinTextField: UITextField!
    
   
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
