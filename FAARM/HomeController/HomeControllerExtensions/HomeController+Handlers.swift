//
//  HomeController+Handlers.swift
//  FAARM
//
//  Created by Christopher Villanueva on 3/29/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

extension HomeController {
    
    // This displays the proper page depending on which icon
    // was clicked
    func handlePresentController(index: Int){
        switch index {
        case 2:
            handleRegistrar()
        case 5:
            handleContact()
        default:
            return
        }
    }
    
    func handleRegistrar() {
        let layout = UICollectionViewFlowLayout()
        let registrarController = RegistrarController(collectionViewLayout: layout)
        present(registrarController, animated: true, completion: nil)
        
    }
    
    func handleContact() {
        let contactController = ContactController()
        contactController.modalPresentationStyle = .overFullScreen
        contactController.modalTransitionStyle = .crossDissolve
        present(contactController, animated: true, completion: nil)
    }
}
