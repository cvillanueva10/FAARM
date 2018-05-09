//
//  RegisterController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 5/8/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class RegisterController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let returnArrow: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    let logoContainerView: UIView = {
        let view = UIView()
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Homescreen_TOP"))
        logoImageView.contentMode = .scaleAspectFill
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 100)
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
    //    textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        let attributedPlaceholder: NSAttributedString = NSMutableAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
       // textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
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
     //   textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    let inputsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .ucmGold
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
     //   button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign In", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor: UIColor.ucmGold]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var userTypePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        picker.tintColor = .white
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    lazy var userTypeTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        let attributedPlaceholder: NSAttributedString = NSMutableAttributedString(string: "I am a...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        textField.attributedPlaceholder = attributedPlaceholder
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.inputView = userTypePickerView
        // textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    var loginController: LoginController?
    
    private let userTypes = ["Current Student", "Prospective Student", "Parent", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @objc private func handleShowLogin() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleDismiss() {
        dismiss(animated: true) {
             self.loginController?.handleDismiss()
        }
       
    }
    
    
    func setupUI() {
        view.backgroundColor = .ucmBlue
        
        // Add Custom navigation bar and anchor it to this UIView
        let customNavigationBar = CustomNavigationView()
        view.addSubview(customNavigationBar)
        customNavigationBar.anchorNavBar(view: self.view)
        
        view.addSubview(alreadyHaveAccountButton)
        view.addSubview(returnArrow)
        alreadyHaveAccountButton.anchor(top: nil, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBotton: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 50)
        
        returnArrow.anchor(top: customNavigationBar.bottomAnchor, paddingTop: 10, left:  view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: nil, paddingRight: 0, width: 75, height: 75)
        
        
        inputsStackView.addArrangedSubview(emailTextField)
        inputsStackView.addArrangedSubview(usernameTextField)
        inputsStackView.addArrangedSubview(passwordTextField)
        inputsStackView.addArrangedSubview(userTypeTextField)
        inputsStackView.addArrangedSubview(signUpButton)
        
        view.addSubview(inputsStackView)
        inputsStackView.anchor(top: returnArrow.bottomAnchor, paddingTop: 40, left: view.safeAreaLayoutGuide.leftAnchor, paddingLeft: 40, bottom: nil, paddingBotton: 0, right: view.safeAreaLayoutGuide.rightAnchor, paddingRight: 40, width: 0, height: 300)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let label = "\(userTypes[row])"
        return label
    }
    
}








