//
//  ContactController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 3/29/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class ContactController: UIViewController {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Get your questions answered"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dimView: UIView = {
        let dim = UIView()
        dim.backgroundColor = UIColor.init(white: 0, alpha: 0.75)
        return dim
    }()
    
    let contactButtonsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let contactLabelsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0, alpha: 0.75)
        setupUI()
    }
    
    /*
     * This function handles calling the SFC number
     */
    @objc func handleCall() {
        let number = 2092287178
        if let url = URL(string: "tel://\(number)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func handleChat() {
        
    }
    
    /*
     * This function handles opening your mail app
     * in order to email the SFC
     */
    @objc func handleEmail() {
        let email = "foo@bar.com"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
}

