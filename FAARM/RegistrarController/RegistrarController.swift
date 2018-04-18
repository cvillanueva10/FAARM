//
//  RegistrarController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 3/30/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class RegistrarController: UICollectionViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let collectionView = collectionView else { return }
        collectionView.backgroundColor = .ucmBlue
        
        let customNavigationBar = CustomNavigationView()
        customNavigationBar.logoImageView.image = #imageLiteral(resourceName: "Registrar Title-1")
        collectionView.addSubview(customNavigationBar)
        customNavigationBar.anchorMiniNavBar(view: self.view)
        
    }
}

