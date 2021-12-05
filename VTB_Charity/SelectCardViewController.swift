//
//  CardSelectionViewController.swift
//  VTB_Charity
//
//  Created by Ivan on 26.11.2021.
//

import UIKit

class SelectCardViewController: UIViewController {

    @IBOutlet weak private var selectCardCollectionView: UICollectionView!
    
    private let identifier = "cardCollectionViewReuseIdentifier"
    private let nib = UINib(nibName: "SelectCardCollectionViewCell", bundle: nil)
    private let cardNames = ["ФЛ", "Зарплатная", "Пенсионная", "Виртуальная"]
    private let imageNames = ["darkBlue_card", "nature_card"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
setup()
        let alignedFlowLayout = selectCardCollectionView?.collectionViewLayout as? AlignedCollectionViewFlowLayout
        alignedFlowLayout?.horizontalAlignment = .left
        alignedFlowLayout?.verticalAlignment = .top

    }
    
    private func setup() {
        selectCardCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
        selectCardCollectionView.dataSource = self
    }
  
}
extension SelectCardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SelectCardCollectionViewCell
        
        let imageName: String
        /* MARK: Temporary solution */
        if indexPath.row <= 1 {
            imageName = imageNames[indexPath.row]
        }
       
        else if indexPath.row % 2 == 0 {
            imageName = imageNames[0]
        }
        
        else {
            imageName = imageNames[1]
        }
        /* MARK */
       
        cell.cardImageView.image = UIImage(named: imageName)
        cell.cardNameLabel.text = cardNames[indexPath.row]
        return cell
    }
    
    
}
