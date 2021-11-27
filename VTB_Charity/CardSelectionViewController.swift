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
    private let nib = UINib(nibName: "SelectCardCollectionViewCell", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
setup()
    }
    
    private func setup() {
        selectCardCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
        selectCardCollectionView.dataSource = self
    }
  
}
extension CardSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: identifier) as! SelectCardCollectionViewCell
        return cell
    }
    
    
}
