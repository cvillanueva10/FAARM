//
//  CalendarController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/7/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class CalendarController: UITableViewController {
    
    var starterIndex: Int = 0
    var starterSet: Bool = false
    
    var aprilEvents = [CalendarEvent]()
    var MayEvents = [CalendarEvent]()
    
    var allEvents = [[CalendarEvent]]()
    
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
    
    private let cellId = "cellId"
    let calendarUrl = "https://www.googleapis.com/calendar/v3/calendars/cvillan0123@gmail.com/events?key=AIzaSyAIhwddROqkHVggMRyX_XLG4H5TqlC65Zs"
    let dateFormatter = DateFormatter()
    var calendarEvents = [CalendarEvent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchCalendarEvents()
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CalendarCell
        cell.calendarEvent = calendarEvents[indexPath.item]
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       // return allEvents.count
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return allEvents[section].count
        return calendarEvents.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = IndentedLabel()
        switch section {
        case 0:
            label.text = "January"
        case 1:
            label.text = "February"
        case 2:
            label.text = "March"
        case 3:
            label.text = "April"
        case 4:
            label.text = "May"
        default:
            label.text = ""
        }
        label.backgroundColor = .ucmGold
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func setupUI() {
        
        tableView.backgroundColor = .ucmBlue
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .white
        
        let customNavigationBar = setupNavBar(imageForLogo: #imageLiteral(resourceName: "Calendar Tab-1"), viewForAnchor: self.tableView)
    
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
