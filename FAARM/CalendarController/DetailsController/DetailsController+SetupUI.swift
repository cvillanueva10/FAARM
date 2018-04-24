//
//  DetailsController+SetupUI.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/23/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

extension DetailsController {
    
    func setupUI(){
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.75)
        view.addSubview(detailsView)
        
        detailsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        detailsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        detailsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        
        
        detailsView.addSubview(titleLabel)
        detailsView.addSubview(dateLabel)
        detailsView.addSubview(descriptionLabel)
        detailsView.addSubview(descriptionTextView)
        detailsView.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(addButton)
        buttonsStackView.addArrangedSubview(cancelButton)
    
        titleLabel.anchor(top: detailsView.topAnchor, paddingTop: 0, left: detailsView.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: detailsView.rightAnchor, paddingRight: 0, width: 0, height: 35)
        dateLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 10, left: detailsView.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: detailsView.rightAnchor, paddingRight: 0, width: 0, height: 35)
        descriptionLabel.anchor(top: dateLabel.bottomAnchor, paddingTop: 16, left: detailsView.leftAnchor, paddingLeft: 5, bottom: nil, paddingBotton: 0, right: detailsView.rightAnchor, paddingRight: 0, width: 0, height: 30)
        descriptionTextView.anchor(top: descriptionLabel.bottomAnchor, paddingTop: 8, left: detailsView.leftAnchor, paddingLeft: 16, bottom: buttonsStackView.topAnchor, paddingBotton: 5, right: detailsView.rightAnchor, paddingRight: 8, width: 0, height: 0)
        
        let buttonHeight = view.frame.height * 0.6 * 0.1
        buttonsStackView.anchor(top: nil, paddingTop: 0, left: detailsView.leftAnchor, paddingLeft: 10, bottom: detailsView.bottomAnchor, paddingBotton: 10, right: detailsView.rightAnchor, paddingRight: 10, width: 0, height: buttonHeight)
    }
}
