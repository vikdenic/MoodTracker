//
//  MoodDetailsController.swift
//  MoodTracker
//
//  Created by Vik Denic on 12/4/14.
//  Copyright (c) 2014 vik. All rights reserved.
//

import WatchKit
import Foundation

class MoodDetailsController: WKInterfaceController {

    @IBOutlet var moodImage: WKInterfaceImage!
    @IBOutlet var moodNameLabel: WKInterfaceLabel!
    @IBOutlet var moodDescriptionLabel: WKInterfaceLabel!
    @IBOutlet var moodAdviceLabel: WKInterfaceLabel!

    var currentMood = 0
    let moodNames = ["OK", "Not Bad", "Hmmm", "Anger", "RARW"]

    override init(context: AnyObject?) {
        super.init(context: context)

        if let moodContextData = context as? MoodContextData {
            currentMood = moodContextData.moodIndex
        }
    }

    override func willActivate() {
        super.willActivate()
        moodImage.setImageNamed("rage\(currentMood)")
        let moodName = moodNames[currentMood]
        moodNameLabel.setText(moodName)
        moodDescriptionLabel.setText("You are feeling SO \(moodName), eh?")
    }
}
