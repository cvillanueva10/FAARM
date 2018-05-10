//
//  CalendarController.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/7/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class CalendarController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
