//
//  NSDate+Extensions.swift
//
//  Created by Rezessy Miklós on 2016. 06. 24..
//  Copyright © 2016. iMind. All rights reserved.
//

import Foundation

extension Date {
    
    fileprivate func longTimeAgoSinceDate(_ numericDates: Bool, components: DateComponents) -> String? {
        guard
            let cYear = components.year,
            let cMonth = components.month
        else {
            return nil
        }
        
        if cYear >= 2 {
            return "\(cYear) years ago"
        } else if cYear >= 1 {
            if numericDates {
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if cMonth >= 2 {
            return "\(cMonth) months ago"
        } else if cMonth >= 1 {
            if numericDates {
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else {
            return nil
        }
    }
    
    fileprivate func midTimeAgoSinceDate(_ numericDates: Bool, components: DateComponents) -> String? {
        guard
            let cWeekOfYear = components.weekOfYear,
            let cDay = components.day
        else {
            return nil
        }
        
        if cWeekOfYear >= 2 {
            return "\(cWeekOfYear) weeks ago"
        } else if cWeekOfYear >= 1 {
            if numericDates {
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if cDay >= 2 {
            return "\(cDay) days ago"
        } else if cDay >= 1 {
            if numericDates {
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else {
            return nil
        }
    }
    
    fileprivate func shortTimeAgoSinceDate(_ numericDates: Bool, components: DateComponents) -> String? {
        guard
            let cHour = components.hour,
            let cMinute = components.minute,
            let cSecond = components.second
            else {
                return nil
        }
        if cHour >= 2 {
            return "\(cHour) hours ago"
        } else if cHour >= 1 {
            if numericDates {
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if cMinute >= 2 {
            return "\(cMinute) minutes ago"
        } else if cMinute >= 1 {
            if numericDates {
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if cSecond >= 3 {
            return "\(cSecond) seconds ago"
        } else {
            return nil
        }
    }
    
    /// Pretty prints time ago since the date until now like "An hour ago"
    ///  - parameter numericDates: tells wether it has to give strings like "1 day ago"
    ///    instead of "Yesterday".
    ///  - parameter inTerm: tells wich terms sould be displayed correctly instead of "Long ago"
    ///  - returns: the string representation
    func timeAgoSinceDate(numericDates: Bool, inTerm term: TimeTerm = .long) -> String {
        let calendar = Calendar.current
        let now = Foundation.Date()
        let earliest = (now as NSDate).earlierDate(self)
        let latest = (earliest == now) ? self : now
        let components: DateComponents =
            (calendar as NSCalendar).components(
                [
                    NSCalendar.Unit.minute,
                    NSCalendar.Unit.hour,
                    NSCalendar.Unit.day,
                    NSCalendar.Unit.weekOfYear,
                    NSCalendar.Unit.month,
                    NSCalendar.Unit.year,
                    NSCalendar.Unit.second
                ],
                from: earliest, to: latest, options: NSCalendar.Options())
        
        if let result = longTimeAgoSinceDate(numericDates, components: components) {
            switch term {
            case .long:
                return result
            default:
                return "Long ago"
            }
        } else if let result = midTimeAgoSinceDate(numericDates, components: components) {
            switch term {
            case .long, .mid:
                return result
            default:
                return "Long ago"
            }
        } else if let result = shortTimeAgoSinceDate(numericDates, components: components) {
            return result
        } else {
            return "Just now"
        }
    }
}

enum TimeTerm {
    case short
    case mid
    case long
}
