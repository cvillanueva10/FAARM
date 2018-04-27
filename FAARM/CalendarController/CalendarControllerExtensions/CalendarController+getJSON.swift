//
//  CalendarController+getJSON.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/16/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

extension CalendarController {
    
    func fetchCalendarEvents() {
        guard let url = URL(string: calendarUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                if let itemsArray = json?.object(forKey: "items") as? NSArray {
                    for item in itemsArray {
                        if let itemDict = item as? NSDictionary {
                            var calendarEvent = CalendarEvent()
                            
                            let name = itemDict.value(forKey: "summary") as? String
                            let description = itemDict.value(forKey: "description") as? String
                            calendarEvent.name = name
                            calendarEvent.description = description
                            
                            if let startDict = itemDict.value(forKey: "start") as? NSDictionary{
                                let dateArray = self.formatDateObj(startDict: startDict, dateFormatter: self.dateFormatter)
                                
                                calendarEvent.monthAbbrev = dateArray[0]
                                calendarEvent.monthNum = dateArray[1]
                                calendarEvent.dayNumber = dateArray[2]
                                calendarEvent.dayName = dateArray[3]
                                calendarEvent.year = dateArray[4]
                                
                                guard let monthIndexString = calendarEvent.monthNum else { continue }
                                
                                guard let monthIndex = Int(monthIndexString) else { continue }
                                
                                if (!self.starterSet){
                                    self.starterIndex = monthIndex
                                    self.starterSet = true
                                }
                                var index = monthIndex - self.starterIndex
                                if (index < 0){
                                    index += 12
                                }
                                //print(index)
                               // self.allEvents[index].append(calendarEvent)
                                self.calendarEvents.append(calendarEvent)
                                
                                self.sortCalendarEvents()
                                
                                
                                
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            }.resume()
    }
    
    func sortCalendarEvents() {

        self.calendarEvents.sort(by: { (ce1, ce2) -> Bool in
            guard let firstDayString = ce1.dayNumber else { return false }
            guard let secondDayString = ce2.dayNumber else { return false }
            guard let firstMonthString = ce1.monthNum else { return false }
            guard let secondMonthString = ce2.monthNum else { return false }
            guard let firstYearString = ce1.year else { return false }
            guard let secondYearString = ce2.year else { return false }
            guard let firstDay = Int(firstDayString) else { return false }
            guard let secondDay = Int(secondDayString) else { return false }
            guard let firstMonth = Int(firstMonthString) else { return false }
            guard let secondMonth = Int(secondMonthString) else { return false }
            guard let firstYear = Int(firstYearString) else { return false }
            guard let secondYear = Int(secondYearString) else { return false }
            let firstNum = firstYear * 365 + firstMonth * 30 + firstDay
            let secondNum = secondYear * 365 + secondMonth * 30 + secondDay
            
            return firstNum < secondNum
        })
        
    }
    
    
    
    
    
}
