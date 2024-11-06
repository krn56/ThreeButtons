//
//  ViewController.swift
//  ThreeButtonsProject
//
//  Created by Роман Крендясов on 06.11.2024.
//

import UIKit

class ThreeButtonsVC: UIViewController {
    
    // MARK: - Properties
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureFirstButton()
        configureSecondButton()
        configureThirdButton()
    }
    
    // MARK: - Configuration Methods
    private func configureFirstButton() {
        view.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.configuration = .filled()
        firstButton.configuration?.title = "First Button"
        firstButton.configuration?.image = UIImage(systemName: "arrow.right.circle.fill")
        firstButton.configuration?.imagePlacement = .trailing
        firstButton.configuration?.imagePadding = 8
        firstButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        firstButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        firstButton.addTarget(self, action: #selector (buttonReleased), for: [.touchUpInside, .touchUpOutside])
        
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureSecondButton() {
        view.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.configuration = .filled()
        secondButton.configuration?.title = "Second Medium Button"
        secondButton.configuration?.image = UIImage(systemName: "arrow.right.circle.fill")
        secondButton.configuration?.imagePlacement = .trailing
        secondButton.configuration?.imagePadding = 8
        secondButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        
        secondButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        secondButton.addTarget(self, action: #selector (buttonReleased), for: [.touchUpInside, .touchUpOutside])
        
        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 8),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureThirdButton() {
        view.addSubview(thirdButton)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.configuration = .filled()
        thirdButton.configuration?.title = "Third"
        thirdButton.configuration?.image = UIImage(systemName: "arrow.right.circle.fill")
        thirdButton.configuration?.imagePlacement = .trailing
        thirdButton.configuration?.imagePadding = 8
        thirdButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        thirdButton.addTarget(self, action: #selector(thirdButtonPressed), for: .touchDown)
        thirdButton.addTarget(self, action: #selector(thirdButtonReleased), for: [.touchUpInside, .touchUpOutside])
        
        NSLayoutConstraint.activate([
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 8),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Touch Processing Methods
    @objc func thirdButtonPressed(sender: UIButton) {
        animateButton(button: sender, to: 0.9)
    }
    
    @objc func thirdButtonReleased(sender: UIButton) {
        animateButton(button: sender, to: 1.0)
        
        let modalVC = ModalVC()
        modalVC.modalPresentationStyle = .pageSheet
        present(modalVC, animated: true)
        
        firstButton.backgroundColor = .systemGray2
        firstButton.layer.cornerRadius = 5
        secondButton.backgroundColor = .systemGray2
        secondButton.layer.cornerRadius = 5
        thirdButton.backgroundColor = .systemGray2
        thirdButton.layer.cornerRadius = 5
        
    }
    
    @objc func buttonPressed(sender: UIButton) {
        animateButton(button: sender, to: 0.9)
    }
    
    @objc func buttonReleased(sender: UIButton) {
        animateButton(button: sender, to: 1.0)
    }
    
    private func animateButton(button: UIButton, to scale: CGFloat) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseInOut, .allowUserInteraction], animations: {
            button.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: nil)
    }
}

// MARK: - ModalVC
class ModalVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

#Preview {
    ThreeButtonsVC()
}


