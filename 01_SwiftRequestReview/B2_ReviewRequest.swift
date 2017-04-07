//
//  B2_ReviewRequest.swift
//
//  Created by Behrad Bagheri on 4/7/17.
//  Copyright © 2017 BehradBagheri. All rights reserved.

import Foundation
import StoreKit


let runIncrementerSetting = "numberOfRuns"  // UserDefauls dictionary key where we store number of runs
let minimumRunCount = 5                     // Minimum number of runs that we should have until we ask for review


func incrementAppRuns() {                   // counter for number of runs for the app. You can call this from App Delegate
    
    let usD = UserDefaults()
    let runs = getRunCounts() + 1
    usD.setValuesForKeys([runIncrementerSetting: runs])
    usD.synchronize()
    
}

func getRunCounts () -> Int {               // Reads number of runs from UserDefaults and returns it.
    
    let usD = UserDefaults()
    let savedRuns = usD.value(forKey: runIncrementerSetting)
    
    var runs = 0
    if (savedRuns != nil) {
        
        runs = savedRuns as! Int
    }
    
    print("Run Counts are \(runs)")
    return runs
    
}

func showReview() {
    
    let runs = getRunCounts()
    print("Show Review")
    
    if (runs > minimumRunCount) {
        
        if #available(iOS 10.3, *) {
            print("Review Requested")
            SKStoreReviewController.requestReview()
            
        } else {
            // Fallback on earlier versions
        }
        
    } else {
        
        print("Runs are now enough to request review!")
           
    }
    
}
