//
//  CalendarController+TableView.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/18/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

extension CalendarController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let calendarAddController = CalendarAddController()
        calendarAddController.modalPresentationStyle = .overFullScreen
        calendarAddController.modalTransitionStyle = .crossDissolve
        calendarAddController.calendarController = self
        calendarAddController.calendarEvent = calendarEvents[indexPath.item]
        present(calendarAddController, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CalendarCell
        if (indexPath.item < calendarEvents.count) {
            cell.calendarEvent = calendarEvents[indexPath.item]
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return calendarEvents.count
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
        label.text = "Loading events..."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return calendarEvents.count == 0 ? 150 : 0
    }
    
   
    
}
