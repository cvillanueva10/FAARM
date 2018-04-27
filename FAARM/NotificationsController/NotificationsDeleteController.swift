//
//  NotificationsDeleteController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/25/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class NotificationsDeleteController: UIViewController {
    
    let detailsView: UIView = {
        let view = UIView()
        view.backgroundColor = .ucmBlue
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .ucmGold
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        button.backgroundColor = .ucmGold
        button.titleLabel?.textColor = .white
        button.setTitle("Cancel", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(handleDeleteFromNotifications), for: .touchUpInside)
        button.backgroundColor = .ucmGold
        button.titleLabel?.textColor = .white
        button.setTitle("Delete", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let buttonsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 15
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .ucmBlue
        textView.textColor = .white
        textView.textAlignment = .left
        textView.isUserInteractionEnabled = false
        textView.font = UIFont.systemFont(ofSize: 20)
        return textView
    }()
    
    var savedEvent: SavedEvent? {
        didSet {
            //titleLabel.text = calendarEvent?.name
            if let dayName = savedEvent?.dayName, let monthAbbrev = savedEvent?.monthAbbrev, let dayNumber = savedEvent?.dayNumber{
                let attributedText = NSMutableAttributedString(string: "Date : ", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 22), NSAttributedStringKey.foregroundColor: UIColor.white])
                attributedText.append(NSAttributedString(string: "\(dayName), \(monthAbbrev) \(dayNumber)", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 22), NSAttributedStringKey.foregroundColor: UIColor.white]))
                dateLabel.attributedText = attributedText
             //   self.monthAbbrev = monthAbbrev
             //   self.dayNumber = dayNumber
            }
            descriptionTextView.text = savedEvent?.title
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.75)
        view.addSubview(detailsView)
        
        detailsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        detailsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        detailsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45).isActive = true
        
        detailsView.addSubview(dateLabel)
        detailsView.addSubview(descriptionTextView)
        detailsView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(deleteButton)
        buttonsStackView.addArrangedSubview(cancelButton)
        
        dateLabel.anchor(top: detailsView.topAnchor, paddingTop: 0, left: detailsView.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: detailsView.rightAnchor, paddingRight: 0, width: 0, height: 50)
        descriptionTextView.anchor(top: dateLabel.bottomAnchor, paddingTop: 8, left: detailsView.leftAnchor, paddingLeft: 16, bottom: buttonsStackView.topAnchor, paddingBotton: 5, right: detailsView.rightAnchor, paddingRight: 8, width: 0, height: 0)
        
        let buttonHeight = view.frame.height * 0.6 * 0.1
        buttonsStackView.anchor(top: nil, paddingTop: 0, left: detailsView.leftAnchor, paddingLeft: 10, bottom: detailsView.bottomAnchor, paddingBotton: 10, right: detailsView.rightAnchor, paddingRight: 10, width: 0, height: buttonHeight)
        
    }
    
    @objc func handleDeleteFromNotifications() {
        
        
        
    }
    
    @objc func handleDismiss() {
        
        dismiss(animated: true, completion: nil)
    }
}


