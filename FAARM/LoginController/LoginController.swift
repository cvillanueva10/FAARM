//
//  LoginController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 5/8/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let customNavigationBar = CustomNavigationView()
    
    let returnArrow: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't haven an account? ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.ucmGold]))
        button.setAttributedTitle(attributedTitle, for: .normal)
       button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    let logoContainerView: UIView = {
        let view = UIView()
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Homescreen_TOP"))
        logoImageView.contentMode = .scaleAspectFill
     //   logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
     //   logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 16).isActive = true
        view.backgroundColor = .ucmBlue
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        let attributedPlaceholder: NSAttributedString = NSMutableAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.isUserInteractionEnabled = true
        //textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        let attributedPlaceholder: NSAttributedString = NSMutableAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
      //  textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .ucmGold
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
   //     button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let inputsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @objc private func handleShowSignUp() {
        let registerController = RegisterController()
        registerController.loginController = self
        present(registerController, animated: true, completion: nil)
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupUI() {
        
        view.backgroundColor = .ucmBlue
        
        // Add Custom navigation bar and anchor it to this UIView
        let customNavigationBar = CustomNavigationView()
        view.addSubview(customNavigationBar)
        customNavigationBar.anchorNavBar(view: self.view)
        
        view.addSubview(dontHaveAccountButton)
    //    view.addSubview(logoContainerView)
        view.addSubview(returnArrow)
        dontHaveAccountButton.anchor(top: nil, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBotton: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 50)
        
   //     logoContainerView.anchor(top: view.topAnchor, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 200)
        
        returnArrow.anchor(top: customNavigationBar.bottomAnchor, paddingTop: 10, left: view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: nil, paddingRight: 0, width: 75, height: 75)
        
        inputsStackView.addArrangedSubview(emailTextField)
        inputsStackView.addArrangedSubview(passwordTextField)
        inputsStackView.addArrangedSubview(loginButton)
        
        view.addSubview(inputsStackView)
        inputsStackView.anchor(top: returnArrow.bottomAnchor, paddingTop: 40, left: view.safeAreaLayoutGuide.leftAnchor, paddingLeft: 40, bottom: nil, paddingBotton: 0, right: view.safeAreaLayoutGuide.rightAnchor, paddingRight: 40, width: 0, height: 180)
    }
}







