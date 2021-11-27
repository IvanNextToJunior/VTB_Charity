//
//  CardSelectionViewController.swift
//  VTB_Charity
//
//  Created by Ivan on 26.11.2021.
//

import UIKit

class CardSelectionViewController: UIViewController {

    @IBOutlet weak private var selectCardCollectionView: UICollectionView!
    
    private let identifier = "cardCollectionViewReuseIdentifier"
    private let nib = UINib(nibName: "CardCollectionViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func setup() {
        selectCardCollectionView.register(<#T##nib: UINib?##UINib?#>, forCellWithReuseIdentifier: <#T##String#>)
    }
  

}
