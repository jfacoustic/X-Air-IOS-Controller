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
    var server = OSCServer(address: "", port: 8080)
    var client = OSCClient(address: "localhost", port: 8080)
    
    @IBOutlet weak var Ch1Vol: UISlider!
    
    @IBAction func changeCh1Vol(_ sender: Any) {
        
        var message = OSCMessage(
            OSCAddressPattern("/ch/01/mix"),
            1,
            Ch1Vol.value,
            1,
            0.5
        )
        client.send(message)
        print(Ch1Vol.value)
    }
    @IBOutlet weak var Ch2Vol: UISlider!
    @IBAction func changeCh2Vol(_ sender: Any) {
        
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

