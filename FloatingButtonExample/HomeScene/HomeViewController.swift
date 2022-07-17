//
//  HomeViewController.swift
//  FloatingButtonExample
//
//  Created by Jaewon on 2022/07/17.
//

import UIKit

final class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapAddButton(_ sender: UIButton) {
        let storyboardID = String(describing: FloatingButtonListViewController.self)
        guard let floatingButtonListVC = storyboard?.instantiateViewController(withIdentifier: storyboardID) as? FloatingButtonListViewController else { return }
        
        floatingButtonListVC.modalTransitionStyle = .crossDissolve
        floatingButtonListVC.modalPresentationStyle = .overCurrentContext
        
        present(floatingButtonListVC, animated: false)
    }
}
