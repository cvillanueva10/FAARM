//
//  NotificationsController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/24/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit
import CoreData

class NotificationsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.backgroundColor = .ucmBlue
        return tv
    }()
    
    lazy var returnButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back_arrow").withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        button.tintColor = .white
        button.backgroundColor = .ucmBlue
        return button
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved Events"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.backgroundColor = .ucmBlue
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var savedEvents = [SavedEvent]()
    
    override func viewDidLoad() {
        view.backgroundColor = .ucmBlue
        
        setupUI()
        fetchSavedEvents()
    }
    
    // This function fetches the events that have been added to the users
    // notifications and displays them on the tableView
    func fetchSavedEvents() {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SavedEvent>(entityName: "SavedEvent")
        
        do {
            let savedEvents = try context.fetch(fetchRequest)
            self.savedEvents = savedEvents
            self.tableView.reloadData()
        } catch let fetchError {
            print("Failed to fetch events: \(fetchError)")
        }
    }
    
    func setupUI() {
        
        let customNavigationBar = setupNavBar(imageForLogo: #imageLiteral(resourceName: "Notifications-1"), viewForAnchor: view)
        
        view.addSubview(returnButton)
        returnButton.anchor(top: customNavigationBar.bottomAnchor, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: nil, paddingRight: 0, width: 75, height: 75)
        
        view.addSubview(headerLabel)
        headerLabel.anchor(top: customNavigationBar.bottomAnchor, paddingTop: 0, left: returnButton.rightAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: view.safeAreaLayoutGuide.rightAnchor, paddingRight: 0, width: 0, height: 75)
        
        
        view.addSubview(tableView)
        tableView.anchor(top: headerLabel.bottomAnchor, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: view.bottomAnchor, paddingBotton: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        tableView.register(CalendarCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func handleDeleteSavedEvent(indexPath: IndexPath){
        
        let savedEvent = self.savedEvents[indexPath.row]
        self.savedEvents.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        context.delete(savedEvent)
        do {
            try  context.save()
        } catch let saveError {
            print("Failed to save deleting context: \(saveError)")
        }
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notificationsDeleteController = NotificationsDeleteController()
        notificationsDeleteController.modalPresentationStyle = .overFullScreen
        notificationsDeleteController.modalTransitionStyle = .crossDissolve
        notificationsDeleteController.savedEvent = savedEvents[indexPath.item]
        notificationsDeleteController.notificationsController = self
        notificationsDeleteController.indexPath = indexPath
        present(notificationsDeleteController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CalendarCell
        cell.savedEvent = savedEvents[indexPath.item]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedEvents.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = IndentedLabel()
        //label.text = "Upcoming Deadlines"
        label.backgroundColor = .ucmGold
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "No events saved"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return savedEvents.count == 0 ? 150 : 0
    }
    
}
