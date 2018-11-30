//
//  Channel2ViewController.swift
//  X-Air Controls
//
//  Created by Joshua Mathews on 11/29/18.
//  Copyright © 2018 Joshua Mathews. All rights reserved.
//

import Foundation
import UIKit
import SwiftOSC

class Channel2ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var volume: UISlider!
    @IBAction func changeVolume(_ sender: Any) {
        channel2Volume = volume.value
        let message = OSCMessage(
            OSCAddressPattern("/ch/02/mix"),
            muteChannel2 ? 0 : 1,
            volume.value,
            1,
            0.5
        )
        client.send(message)
    }
    
    @IBOutlet weak var muteButton: UIButton!
    @IBAction func mute(_ sender: Any) {
       muteChannel2 = !(muteChannel2)
        if muteChannel2 {
            muteButton.setTitleColor(UIColor.red, for: UIControl.State.normal)
        }
        else {
            muteButton.setTitleColor(defaultBlue, for: UIControl.State.normal)
        }
        let message = OSCMessage(
            OSCAddressPattern("/ch/02/mix"),
            muteChannel2 ? 0 : 1,
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
        volume.value = channel2Volume
    }
}

