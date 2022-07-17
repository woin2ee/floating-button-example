//
//  FloatingButtonListViewController.swift
//  FloatingButtonExample
//
//  Created by Jaewon on 2022/07/17.
//

import UIKit

final class FloatingButtonListViewController: UIViewController {
    
    let buttonSpacing: CGFloat = 70.0
    
    @IBOutlet var buttonConstraints: [NSLayoutConstraint]! {
        didSet { buttonConstraints.sort { Int($0.identifier!)! < Int($1.identifier!)! } }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraintsZero()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        floatSubButtons()
    }
    
    @IBAction func didTapAddButton(_ sender: UIButton) {
        foldSubButtons()
    }
    
    private func setConstraintsZero() {
        buttonConstraints.forEach { constraint in
            constraint.constant = 0.0
        }
    }
    
    private func floatSubButtons() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.8,
            options: .curveEaseOut,
            animations: {
                self.buttonConstraints.forEach { constraint in
                    constraint.constant = self.buttonSpacing * CGFloat(Int(constraint.identifier!)!)
                }
                self.view.layoutIfNeeded()
            },
            completion: nil
        )
    }
    
    private func foldSubButtons() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.8,
            options: .curveEaseOut,
            animations: {
                self.buttonConstraints.forEach { constraint in
                    constraint.constant = 0.0
                }
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                self.dismiss(animated: false)
            }
        )
    }
}
