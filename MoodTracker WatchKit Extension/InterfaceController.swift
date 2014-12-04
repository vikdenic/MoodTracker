//
//  InterfaceController.swift
//  MoodTracker WatchKit Extension
//
//  Created by Vik Denic on 12/3/14.
//  Copyright (c) 2014 vik. All rights reserved.
//

import WatchKit
import Foundation

class MoodContextData {
    let moodIndex : Int

    init(moodIndex: Int){
        self.moodIndex = moodIndex
    }
}

class InterfaceController: WKInterfaceController {

    @IBOutlet var moodImage: WKInterfaceImage!
    var currentMood: Int = 0

    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)
        
        // Configure interface objects here.
        NSLog("%@ init", self)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    func moodSliderChanged(value: Float)
    {
        updateMoodImage(Int(value))
    }

    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        if segueIdentifier == "RecordMoodSegue"
        {
            return MoodContextData(moodIndex: currentMood)
        }
        return nil
    }

    func updateMoodImage(value : Int)
    {
        moodImage.setImageNamed("rage\(value)")
        currentMood = value
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
}
