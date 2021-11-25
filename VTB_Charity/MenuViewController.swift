//
//  MenuViewController.swift
//  VTB_Charity
//
//  Created by Ivan on 20.11.2021.
//

import UIKit

protocol MenuViewControllerDelegate: class {
    func selectedCell(_ row: Int)
}

class MenuViewController: UIViewController {
    
    @IBOutlet weak private var headerImageView: UIImageView!
    
    @IBOutlet weak private var tableView: UITableView!
    
    @IBOutlet weak private var footerLabel: UILabel!
    
    private let identifier = "menuTableViewCellReuseIdentifier"
    private let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
    
    weak var delegate: MenuViewControllerDelegate?
    
    var defaultHiglightedCell = 0
    
    var menu = [
        
        Menu(icon: UIImage(systemName: "")!, title: "Оформить карту"),
        Menu(icon: UIImage(systemName: "person.fill")!, title: "Личный кабинет"),
        Menu(icon: UIImage(systemName: "")!, title: "Благотворительные фонды"),
        Menu(icon: UIImage(systemName: "")!, title: "Пополнить баланс"),
        Menu(icon: UIImage(systemName: "")!, title: "Перевести на карту"),
        Menu(icon: UIImage(systemName: "")!, title: "Открыть электронный счет")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setHighlightedCell()
    }
    
    private func setupTableView () {
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    private func setHighlightedCell () {
        let defaultRow = IndexPath(row: defaultHiglightedCell, section: 0)
        
        tableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        
    }
    
    private func setUpLabel () {
        footerLabel.textColor = UIColor.white
        footerLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        footerLabel.text = "Главное меню"
    }
    
    private func updateData () {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MenuViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MenuTableViewCell
       
        cell.iconImageView.tintColor = .white
        cell.titleLabel.textColor = .white
        
        cell.iconImageView.image = menu[indexPath.row].icon
        cell.titleLabel.text = menu[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedCell(indexPath.row)
    }
}

