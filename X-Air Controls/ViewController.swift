//
//  ViewController.swift
//  X-Air Controls
//
//  Created by Joshua Mathews on 11/9/18.
//  Copyright © 2018 Joshua Mathews. All rights reserved.
//

import UIKit
import SwiftOSC

let defaultBlue = UIColor.init(red: 0.0, green: 0.478, blue: 1.0, alpha: 0.0)

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var Ch1Vol: UISlider!
    @IBAction func changeCh1Vol(_ sender: Any) {
        channel1Volume = Ch1Vol.value
        let message = OSCMessage(
            OSCAddressPattern("/ch/01/mix"),
            muteChannel1 ? 0 : 1,
            Ch1Vol.value,
            1,
            0.5
        )
        client.send(message)
        //print(Ch1Vol.value)
    }
    
    @IBOutlet weak var MuteCh1Button: UIButton!
    @IBAction func MuteCh1(_ sender: Any) {
        muteChannel1 = !(muteChannel1)
        if muteChannel1 {
            MuteCh1Button.setTitleColor(UIColor.red, for: UIControl.State.normal)
        }
        else {
            MuteCh1Button.setTitleColor(defaultBlue, for: UIControl.State.normal)
        }
        let message = OSCMessage(
            OSCAddressPattern("/ch/01/mix"),
            muteChannel1 ? 0 : 1,
            Ch1Vol.value,
            1,
            0.5
        )
        client.send(message)
        print(muteChannel1)
    }
    
    
    @IBOutlet weak var Ch2Vol: UISlider!
    @IBAction func changeCh2Vol(_ sender: Any) {
        channel2Volume = Ch2Vol.value
        let message = OSCMessage(
            OSCAddressPattern("/ch/02/mix"),
            muteChannel2 ? 0 : 1,
            Ch2Vol.value,
            1,
            0.5
        )
        client.send(message)
    }
    @IBOutlet weak var MuteCh2Button: UIButton!
    @IBAction func MuteCh2(_ sender: Any) {
        muteChannel2 = !(muteChannel2)
        if muteChannel2 {
            MuteCh2Button.setTitleColor(UIColor.red, for: UIControl.State.normal)
        }
        else {
            MuteCh2Button.setTitleColor(defaultBlue, for: UIControl.State.normal)
        }
        let message = OSCMessage(
            OSCAddressPattern("/ch/01/mix"),
            muteChannel2 ? 0 : 1,
            Ch2Vol.value,
            1,
            0.5
        )
        client.send(message)
    }
    
    @IBOutlet weak var Ch3Vol: UISlider!
    @IBAction func changeCh3Vol(_ sender: Any) {
        channel3Volume = Ch3Vol.value
        let message = OSCMessage(
            OSCAddressPattern("/ch/03/mix"),
            muteChannel3 ? 0 : 1,
            Ch3Vol.value,
            1,
            0.5
        )
        client.send(message)
    }
    @IBOutlet weak var Ch4Vol: UISlider!
    @IBAction func changeCh4Vol(_ sender: Any) {
        channel4Volume = Ch4Vol.value
        let message = OSCMessage(
            OSCAddressPattern("/ch/04/mix"),
            muteChannel4 ? 0 : 1,
            Ch4Vol.value,
            1,
            0.5
        )
        client.send(message)
    }
    
    @IBOutlet weak var MasterVol: UISlider!
    @IBAction func changeMasterVol(_ sender: Any) {
        masterVolume = MasterVol.value 
        let message = OSCMessage(
            OSCAddressPattern("/lr/mix"),
            muteMaster ? 0 : 1,
            MasterVol.value,
            1,
            0.5
        )
        client.send(message)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Ch1Vol.value = channel1Volume
        Ch2Vol.value = channel2Volume
        Ch3Vol.value = channel3Volume
        Ch4Vol.value = channel4Volume
        MasterVol.value = masterVolume
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
}

