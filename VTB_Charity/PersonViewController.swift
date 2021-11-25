//
//  PersonViewController.swift
//  VTB_Charity
//
//  Created by Ivan on 20.11.2021.
//

import UIKit

class PersonViewController: UIViewController {
    
    private var menuViewController: MenuViewController!
    private var menuTrailingConstraint: NSLayoutConstraint!
    private var menuWidth: CGFloat = 260
    private var isExpanded = false
    private var shouldShowMenuOnTop = true
    
    private let paddingForRotation: CGFloat = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func presentMenu() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        menuViewController = storyboard.instantiateViewController(withIdentifier: "menuID") as? MenuViewController
        menuViewController.delegate = self
        view.insertSubview(menuViewController!.view, at: shouldShowMenuOnTop ? 2 : 0)
        addChild(menuViewController!)
        menuViewController.didMove(toParent: self)
        setup()
    }
    
    private func setup () {
        
        menuViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        if shouldShowMenuOnTop {
            
            menuTrailingConstraint = menuViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -menuWidth - paddingForRotation)
            menuTrailingConstraint.isActive = true
        }
        
        NSLayoutConstraint.activate([
            menuViewController.view.widthAnchor.constraint(equalToConstant: menuWidth),
            menuViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
            
            
        ])
       
        showViewController(viewController: PersonViewController.self, storyboardId: "personID")
    }
}

extension PersonViewController: MenuViewControllerDelegate {
    
    func selectedCell(_ row: Int) {
        switch row {
        case 0:
            break
        default:
            break
        }
        
    }
    
    func showViewController<T: UIViewController>(viewController: T.Type, storyboardId: String) {
        
        for subview in view.subviews {
            
            if subview.tag == 99 {
                subview.removeFromSuperview()
            }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        
        vc.view.tag = 99
        view.insertSubview(vc.view, at: shouldShowMenuOnTop ? 0 : 1)
        addChild(vc)
        
        if !shouldShowMenuOnTop {
            vc.view.frame.origin.x = menuWidth
        }
        
        vc.didMove(toParent: self)
        
    }
    
    func menuState(expanded: Bool) {
        
        if expanded {
            animateMenu(targetPosition: shouldShowMenuOnTop ? 0 : menuWidth) { _ in
                self.isExpanded = true
            }
            
        }
        
        else {
            animateMenu(targetPosition: shouldShowMenuOnTop ? (-menuWidth - paddingForRotation) : 0) {_ in
                self.isExpanded = false
            }
        }
        
    }
    func animateMenu (targetPosition: CGFloat, completion: @escaping (Bool) -> ()) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .layoutSubviews, animations: {
            
            if self.shouldShowMenuOnTop {
                self.menuTrailingConstraint.constant = targetPosition
                self.view.layoutIfNeeded()
            }
            
            else {
                self.view.subviews[1].frame.origin.x = targetPosition
            }
            
        }, completion: completion)
        
    }
    
}
