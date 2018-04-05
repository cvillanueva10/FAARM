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
        contactController.homeController = self
        present(contactController, animated: true, completion: nil)
    }
    
    // This functions pulls up the Contact form
    // where the user fills out a form regarding their question
    // and the SFC will receive this information
    func handleContactForm() {
        let contactFormController = ContactFormController()
        present(contactFormController, animated: true, completion: nil)
        
    }
}
