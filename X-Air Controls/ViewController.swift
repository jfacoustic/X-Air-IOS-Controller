//
//  ViewController.swift
//  X-Air Controls
//
//  Created by Joshua Mathews on 11/9/18.
//  Copyright © 2018 Joshua Mathews. All rights reserved.
//

import UIKit
import SwiftOSC

class OSCHandler: OSCServerDelegate {
    func didReceive(_ message: OSCMessage) {
        print(message)
    }
}

class ViewController: UIViewController {
    //MARK: Properties
    var server = OSCServer(address: "", port: 10024)
    var client = OSCClient(address: "192.168.1.1", port: 10024)
    
    @IBOutlet weak var Ch1Vol: UISlider!
    @IBAction func changeCh1Vol(_ sender: Any) {
        let xinfo = OSCMessage(OSCAddressPattern("/xinfo"))
        client.send(xinfo)
        let message = OSCMessage(
            OSCAddressPattern("/ch/01/mix"),
            1,
            Ch1Vol.value,
            1,
            0.5
        )
        client.send(message)
        //print(Ch1Vol.value)
    }
    
    @IBOutlet weak var Ch2Vol: UISlider!
    @IBAction func changeCh2Vol(_ sender: Any) {
        let message = OSCMessage(
            OSCAddressPattern("/ch/02/mix"),
            1,
            Ch2Vol.value,
            1,
            0.5
        )
        client.send(message)
    }
    
    @IBOutlet weak var Ch3Vol: UISlider!
    @IBAction func changeCh3Vol(_ sender: Any) {
        let message = OSCMessage(
            OSCAddressPattern("/ch/03/mix"),
            1,
            Ch3Vol.value,
            1,
            0.5
        )
        client.send(message)
    }
    @IBOutlet weak var Ch4Vol: UISlider!
    @IBAction func changeCh4Vol(_ sender: Any) {
        let message = OSCMessage(
            OSCAddressPattern("/ch/04/mix"),
            1,
            Ch4Vol.value,
            1,
            0.5
        )
        client.send(message)
    }
    
    @IBOutlet weak var MasterVol: UISlider!
    @IBAction func changeMasterVol(_ sender: Any) {
        let message = OSCMessage(
            OSCAddressPattern("/lr/mix"),
            1,
            MasterVol.value,
            1,
            0.5
        )
        client.send(message)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        server.delegate = OSCHandler()
        server.start()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
}

