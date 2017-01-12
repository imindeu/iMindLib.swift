//
//  NSDate+Extensions.swift
//  Quideo
//
//  Created by Rezessy Miklós on 2016. 06. 24..
//  Copyright © 2016. iMind. All rights reserved.
//

import Foundation

extension Date {
    struct Date {
        static let formatterShortDate = DateFormatter(dateFormat: "MMM dd yyyy")
    }
    var shortDate: String {
        return Date.formatterShortDate.string(from: self)
    }
    
    func timeAgoSinceDate(numericDates:Bool) -> String {
        let calendar = Calendar.current
        let now = Foundation.Date()
        let earliest = (now as NSDate).earlierDate(self)
        let latest = (earliest == now) ? self : now
        let components:DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.minute , NSCalendar.Unit.hour , NSCalendar.Unit.day , NSCalendar.Unit.weekOfYear , NSCalendar.Unit.month , NSCalendar.Unit.year , NSCalendar.Unit.second], from: earliest, to: latest, options: NSCalendar.Options())
        guard let cYear = components.year, let cMonth = components.month, let cWeekOfYear = components.weekOfYear, let cDay = components.day, let cHour = components.hour, let cMinute = components.minute, let cSecond = components.second else {
            return "Just now"
        }
        if (cYear >= 2) {
            return "\(cYear) years ago"
        } else if (cYear >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (cMonth >= 2) {
            return "\(cMonth) months ago"
        } else if (cMonth >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (cWeekOfYear >= 2) {
            return "\(cWeekOfYear) weeks ago"
        } else if (cWeekOfYear >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (cDay >= 2) {
            return "\(cDay) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (cHour >= 2) {
            return "\(cHour) hours ago"
        } else if (cHour >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (cMinute >= 2) {
            return "\(cMinute) minutes ago"
        } else if (cMinute >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (cSecond >= 3) {
            return "\(cSecond) seconds ago"
        } else {
            return "Just now"
        }
        
    }
}

extension DateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}
