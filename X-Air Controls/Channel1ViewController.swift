//
//  Channel1ViewController.swift
//  X-Air Controls
//
//  Created by Joshua Mathews on 11/29/18.
//  Copyright © 2018 Joshua Mathews. All rights reserved.
//

import Foundation
import UIKit
import SwiftOSC

class Channel1ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var volume: UISlider!
    @IBAction func changeVolume(_ sender: Any) {
        channel1Volume = volume.value
        let message = OSCMessage(
            OSCAddressPattern("/ch/01/mix"),
            1,
            volume.value,
            1,
            0.5
        )
        client.send(message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        volume.value = channel1Volume
    }
}

