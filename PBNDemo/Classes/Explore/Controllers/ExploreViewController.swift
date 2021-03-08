//
//  ExploreViewController.swift
//  PBNDemo
//
//  Created by 常威 on 2021/3/8.
//  Copyright © 2021 常威. All rights reserved.
//

import UIKit
import SnapKit

class ExploreViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    fileprivate lazy var calendarView : UIView
        = {
        let view = UIView.init(frame: CGRect.init(x: 50, y: 100, width: 350, height: 350))
        view.backgroundColor = UIColor.white
        return view
    }()
    
    fileprivate lazy var calendar : FSCalendar! = { [unowned self] in
        let calendar = FSCalendar()
        calendar.dataSource = self
        calendar.delegate = self
        calendar.placeholderType = .fillHeadTail
        calendar.scope = .week
        calendar.appearance.weekdayTextColor = UIColor.init(red: 74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 0.4)
        
        return calendar
    }()
    
    fileprivate lazy var arrowGuide : UIButton! = {
        let btn = UIButton.init()
        btn.setBackgroundImage(UIImage.init(named: "calendar_place_down"), for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        self.layoutSubviews()
        self.arrowGuide.addTarget(self, action: #selector(self.switchType), for: .touchUpInside)
    }
    
    func layoutSubviews() {
        self.view.addSubview(calendarView)
        self.view.addSubview(self.calendar)
        self.view.addSubview(self.arrowGuide)
        
        self.calendar.snp.makeConstraints {
            $0.edges.equalTo(self.calendarView)
        }
        
        self.arrowGuide.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.height.equalTo(10)
            $0.centerX.equalTo(self.calendar)
            $0.bottom.equalTo(self.calendar.snp.bottom).offset(-5)
        }
    }
    
    @objc func switchType() {
        if self.calendar.scope == .month {
            self.calendar.setScope(.week, animated: true)
            self.arrowGuide.setBackgroundImage(UIImage.init(named: "calendar_place_down"), for: .normal)
        } else {
            self.calendar.setScope(.month, animated: true)
            self.arrowGuide.setBackgroundImage(UIImage.init(named: "calendar_place_up"), for: .normal)
        }
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendar.snp.remakeConstraints {
            $0.left.right.top.equalTo(self.calendarView)
            $0.height.equalTo(bounds.height)
            $0.width.equalTo(bounds.width)
        }
        self.view.layoutIfNeeded()
    }
    
    func minimumDateForCalendar(_ calendar: FSCalendar) -> NSDate {
        
    }
    
}
