//
//  ViewController.swift
//  Keyword Algorithm
//
//  Created by Aaryan Pashine on 8/2/15.
//  Copyright © 2015 Craize Corp. All rights reserved.
//

import UIKit
import Foundation
import Timepiece


class ViewController: UIViewController {
@IBOutlet weak var textfield: UITextField!
    
    @IBAction func create(sender: AnyObject) {
        
        struct Timefortask {
            var hours: Int! = 0
            var minutes: Int!
            var date: Int!
            var month: Int! = 0
            var year: Int!
        }
        
        let now = NSDate()
        var Task = Timefortask(hours: now.hour, minutes: now.month, date: now.day, month: now.month, year: now.year)
        var input :String! = textfield.text  //user input
        var action : String
        var Timetype : String
        
        let stringarray = input.componentsSeparatedByString(" ") //convert the string to array so it can be searched
        
        // ####  FIND TASK TIME #####
        
        //*Possible Input:
        
        // 1) *action* next *day*
        // 2) *action* next *day* at *time*
        // 3) *action* next *day* at *place*
        // 4) *action* next month
        // 5) *action* next year
        
        if stringarray.contains("next") {
            //This found out the user typed "remind me to *some action* AT *time* ON *Some date*
            
            Timetype = "specifictimeanddate"
            
            
            let indexfornext = stringarray.indexOf("next")!
            let day = stringarray[indexfornext + 1].lowercaseString   //This can be the time value, like 7 in 7 pm
            
            switch day{
            case "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday":
                print("value is day of week")
                switch day{
                case "sunday":
                    var dayoftheweek = now.change(weekday: 1)
                    if now.day >= dayoftheweek.day{
                        dayoftheweek = dayoftheweek + 7.days
                        Task.date = dayoftheweek.day
                    }else{
                    Task.date = dayoftheweek.day
                    }
                case "monday":
                    var dayoftheweek = now.change(weekday: 2)
                    if now.day >= dayoftheweek.day{
                        dayoftheweek = dayoftheweek + 7.days
                        Task.date = dayoftheweek.day
                    }else{
                        Task.date = dayoftheweek.day
                    }
                case "tuesday":
                    var dayoftheweek = now.change(weekday: 3)
                    if now.day >= dayoftheweek.day{
                        dayoftheweek = dayoftheweek + 7.days
                        Task.date = dayoftheweek.day
                    }else{
                        Task.date = dayoftheweek.day
                    }
                case "wednesday":
                    var dayoftheweek = now.change(weekday: 4)
                    if now.day >= dayoftheweek.day{
                        dayoftheweek = dayoftheweek + 7.days
                        Task.date = dayoftheweek.day
                    }else{
                        Task.date = dayoftheweek.day
                    }
                case "thursday":
                    var dayoftheweek = now.change(weekday: 5)
                    if now.day >= dayoftheweek.day{
                        dayoftheweek = dayoftheweek + 7.days
                        Task.date = dayoftheweek.day
                    }else{
                        Task.date = dayoftheweek.day
                    }
                case "friday":
                    var dayoftheweek = now.change(weekday: 6)
                    if now.day >= dayoftheweek.day{
                        dayoftheweek = dayoftheweek + 7.days
                        Task.date = dayoftheweek.day
                    }else{
                        Task.date = dayoftheweek.day
                    }
                case "saturday":
                    var dayoftheweek = now.change(weekday: 7)
                    if now.day >= dayoftheweek.day{
                        dayoftheweek = dayoftheweek + 7.days
                        Task.date = dayoftheweek.day
                    }else{
                        Task.date = dayoftheweek.day
                    }
                default:
                    print("error")
                }
            case "month":
                print("value is month")
                Task.month = now.month + 1
            case "year":
                print("value is year")
                Task.year = now.year + 1
            default:
                print("value is unknown")
            }
            
            if stringarray.contains("at"){

            let indexforon = stringarray.indexOf("at")!
            let placeortime = Int(stringarray[indexforon + 1])  //This will be the time eg: at 7 pm(can also be place eg: at cafe)
            
            
            
            switch placeortime{
            case nil:
                print("value is place")
            default:
                print("value is time")
                Task.hours = placeortime
            }
            
        }
    }
            
            
            
            //*Possible Input:
            
            // 1) *action* at *place*
            // 2) *action* at *time*
            // 3) *action* at *place* on *date*
            // 4) *action* at *time* on *date*
            
            
        else if stringarray.contains("at"){
            //This found out the user typed "remind me to *some action* AT time"
            
            if stringarray.contains("on") {
                //This found out the user typed "remind me to *some action* AT *time* ON *Some date*
                
                Timetype = "specifictimeanddate"
                
                let indexforat = stringarray.indexOf("at")!
                
                
                let timevalue = stringarray[indexforat + 1]   //This can be the time value, like 7 in 7 pm (this could also have been a place eg: at cafe)
                let AmOrPm = stringarray[indexforat + 2]      //This will find out am or pm
                
                let indexforon = stringarray.indexOf("on")!
                
                let datevalue = stringarray[indexforon + 1]  //This will be the date (this can also be a day, eg. Monday) like 8 in 8th august
                let monthorday = stringarray[indexforon + 2].lowercaseString  //this will be month
                
                switch monthorday{
                    
                case "january","february","march","april","may","june","july","august","septempber","october","november","december":
                    print("value is month")
                case "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday":
                    print("value is day of week")
                default:
                    print("value is unknown")
                    
                }
                
                
            }
        }
            
            
            //Possible input
            // 1) *action* in *value* hours/days/weeks/months
            
        else if stringarray.contains("in"){
            
            Timetype = "intime"
            
            let index = stringarray.indexOf("in")!
            
            let timeunit = Int(stringarray[index + 1]) //this will be the value like 3 in 3 hours or 7 is 7 weeks
            let timevalue = stringarray[index + 2] //this will be the unit like hours in 3 hours or weeks in 7 weeks
            
            switch timevalue{
            
            case "hours", "hour":
                var hours = now + timeunit!.hours
                Task.hours = hours.hour
                Task.date = hours.day
                Task.month = hours.month
                Task.year = hours.year
            case "days", "day":
                var days = now + timeunit!.days
                Task.date = days.day
                Task.month = days.month
                Task.year = days.year
            case "week", "weeks":
                var weeks = now + timeunit!.weeks
                Task.date = weeks.day
                Task.month = weeks.month
                Task.year = weeks.year
            case "months", "month":
                var month = now + timeunit!.months
                Task.date = month.day
                Task.month = month.month
                Task.year = month.year
            default:
                print("error")
                
            }
        }
            
            
            //Possible input
            // 1) *action* on *date*
            
        else if stringarray.contains("on") {
            
            Timetype = "specifictimeanddate"
            
            let indexforat = stringarray.indexOf("on")!
            
            let day = stringarray[indexforat + 1]
            let month = stringarray[indexforat + 2]
            
        }
            
            //If no
        else{
            print("Time wasn't specified")
        }
        print("\(Task.hours):\(Task.minutes) on \(Task.date) in month no. \(Task.month) in year \(Task.year)")


    }
    

}

