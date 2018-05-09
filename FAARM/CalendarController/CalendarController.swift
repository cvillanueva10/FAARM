//
//  CalendarController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/7/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class CalendarController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let statusBarBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .ucmBlue
        return view
    }()
    
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
        
        view.backgroundColor = .ucmBlue
        
        let customNavigationBar = setupNavBar(imageForLogo: #imageLiteral(resourceName: "Calendar Tab-1"), viewForAnchor: view)
        
        // Acts as a background for status bar and so text doesnt peek through
        view.addSubview(returnButton)
        returnButton.anchor(top: customNavigationBar.bottomAnchor, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: nil, paddingRight: 0, width: 75, height: 75)
        
        view.addSubview(headerLabel)
        headerLabel.anchor(top: customNavigationBar.bottomAnchor, paddingTop: 0, left: returnButton.rightAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: view.safeAreaLayoutGuide.rightAnchor, paddingRight: 0, width: 0, height: 75)
        
        view.addSubview(tableView)
        tableView.anchor(top: headerLabel.bottomAnchor, paddingTop: 0, left: view.leftAnchor, paddingLeft: 0, bottom: view.bottomAnchor, paddingBotton: 0, right: view.rightAnchor, paddingRight: 0, width: 0, height: 0)
        tableView.register(CalendarCell.self, forCellReuseIdentifier: cellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
    }
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
