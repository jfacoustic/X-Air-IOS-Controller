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
            muteChannel1 ? 0 : 1,
            volume.value,
            1,
            0.5
        )
        client.send(message)
    }
    
    @IBOutlet weak var muteButton: UIButton!
    @IBAction func mute(_ sender: Any) {
        muteChannel1 = !(muteChannel1)
        if muteChannel1 {
            muteButton.setTitleColor(UIColor.red, for: UIControl.State.normal)
        }
        else {
            muteButton.setTitleColor(defaultBlue, for: UIControl.State.normal)
        }
        let message = OSCMessage(
            OSCAddressPattern("/ch/01/mix"),
            muteChannel1 ? 0 : 1,
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

