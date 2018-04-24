//
//  CalendarController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/7/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class CalendarController: UITableViewController {

    let statusBarBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .ucmBlue
        return view
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
        label.text = "Upcoming Deadlines"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.backgroundColor = .ucmBlue
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let cellId = "cellId"
    let calendarUrl = "https://www.googleapis.com/calendar/v3/calendars/ucsfcworker@gmail.com/events?key=AIzaSyAIhwddROqkHVggMRyX_XLG4H5TqlC65Zs"
    let dateFormatter = DateFormatter()
    
    var calendarEvents = [CalendarEvent]()
    var starterIndex: Int = 0
    var starterSet: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchCalendarEvents()
    }
    
    func setupUI() {
        
        tableView.backgroundColor = .ucmBlue
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .ucmGold

        let customNavigationBar = setupNavBar(imageForLogo: #imageLiteral(resourceName: "Calendar Tab-1"), viewForAnchor: self.tableView)
        
        // Acts as a background for status bar and so text doesnt peek through
        view.addSubview(statusBarBackground)
        statusBarBackground.anchor(top: view.topAnchor, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 20)
    
        view.addSubview(returnButton)
        returnButton.anchor(top: customNavigationBar.bottomAnchor, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: nil, paddingRight: 0, width: 75, height: 75)
        
        view.addSubview(headerLabel)
        headerLabel.anchor(top: customNavigationBar.bottomAnchor, paddingTop: 0, left: returnButton.rightAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: view.safeAreaLayoutGuide.rightAnchor, paddingRight: 0, width: 0, height: 75)
        
        tableView.register(CalendarCell.self, forCellReuseIdentifier: cellId)
        let customNavBarHeight = view.frame.height * 0.078
        let offsetHeight = customNavBarHeight + 75
        tableView.contentInset = UIEdgeInsetsMake(offsetHeight, 0, 0, 0)
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
