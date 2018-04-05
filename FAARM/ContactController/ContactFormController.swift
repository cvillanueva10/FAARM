//
//  ContactFormController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/4/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class ContactFormController: UIViewController {
    
    let returnArrow: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Contact Us or Submit Feedback"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Contact Us or Submit Feedback"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.tintColor = .black
        textField.textColor = .black
        let attributedPlaceholder: NSAttributedString = NSMutableAttributedString(string: "First Name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.isUserInteractionEnabled = true
       // textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .ucmBlue
        let customNavBar = setupNavBar(imageForLogo: #imageLiteral(resourceName: "ContactUsTitle-1"), viewForAnchor: view)
        
        view.addSubview(returnArrow)
        returnArrow.anchor(top: customNavBar.bottomAnchor, paddingTop: 10, left: view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: nil, paddingRight: 0, width: 75, height: 75)
        returnArrow.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        
        view.addSubview(headerLabel)
        headerLabel.anchor(top: customNavBar.bottomAnchor, paddingTop: 10, left: returnArrow.rightAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: view.rightAnchor, paddingRight: 75, width: 0, height: 75)
        
        view.addSubview(firstNameTextField)
        firstNameTextField.anchor(top: headerLabel.bottomAnchor, paddingTop: 15, left: view.leftAnchor, paddingLeft: 40, bottom: nil, paddingBotton: 0, right: view.rightAnchor, paddingRight: 40, width: 0, height: 40)
    }
    
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
   
}
