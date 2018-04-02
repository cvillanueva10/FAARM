//
//  CustomNavigationView.swift
//  FAARM
//
//  Created by Christopher Villanueva on 3/20/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class CustomNavigationView: UIView {
    
    let faarmLogoImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "navBarImage") )
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(faarmLogoImageView)
        faarmLogoImageView.anchor(top: topAnchor, paddingTop: 0, left: leftAnchor, paddingLeft: 0, bottom: bottomAnchor, paddingBotton: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
    }
    
    func anchorNavBar(view: UIView){
        let navBarHeight = view.frame.width * 0.22
        self.anchor(top: view.topAnchor, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: view.rightAnchor, paddingRight: -1, width: 0, height: navBarHeight)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
