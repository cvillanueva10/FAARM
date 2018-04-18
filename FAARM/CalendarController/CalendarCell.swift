//
//  CalendarCell.swift
//  FAARM
//
//  Created by Christopher Villanueva on 4/12/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

class CalendarCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Testing this cell with some description"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let dayNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .ucmGold
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let dayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Thursday"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .ucmGold
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let goldDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .ucmGold
        return view
    }()
    
    
    var calendarEvent: CalendarEvent? {
        didSet {
            titleLabel.text = calendarEvent?.name
            dayNameLabel.text = calendarEvent?.dayName
            dayNumberLabel.text = calendarEvent?.dayNumber
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .ucmBlue
        
        addSubview(dayNumberLabel)
        let numberHeight = frame.height * 0.7
        let numberDayWidth = frame.width * 0.33
        dayNumberLabel.anchor(top: topAnchor, paddingTop: 10, left: leftAnchor, paddingLeft: 0, bottom: nil, paddingBotton: 0, right: nil, paddingRight: 0, width: numberDayWidth, height: numberHeight)
        
        addSubview(dayNameLabel)
        dayNameLabel.anchor(top: dayNumberLabel.bottomAnchor, paddingTop: 0, left: leftAnchor, paddingLeft: 0, bottom: bottomAnchor, paddingBotton: 10, right: dayNumberLabel.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        addSubview(goldDividerView)
        goldDividerView.anchor(top: topAnchor, paddingTop: 0, left: dayNameLabel.rightAnchor, paddingLeft: 0, bottom: bottomAnchor, paddingBotton: 0, right: nil, paddingRight: 0, width: 2, height: 0)
        
        addSubview(titleLabel)
        let offsetPadding = frame.width * 0.33
        titleLabel.anchor(top: topAnchor, paddingTop: 0, left: leftAnchor, paddingLeft: offsetPadding, bottom: bottomAnchor, paddingBotton: 0, right: rightAnchor, paddingRight: 10, width: 0, height: 0)
        
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
