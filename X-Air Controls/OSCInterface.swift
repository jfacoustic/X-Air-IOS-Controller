//
//  OSCInterface.swift
//  X-Air Controls
//
//  Created by Joshua Mathews on 11/29/18.
//  Copyright © 2018 Joshua Mathews. All rights reserved.
//

import Foundation
import SwiftOSC

// Comm's setup:
let server = OSCServer(address: "", port: 10024)
let client = OSCClient(address: "192.168.1.1", port: 10024)

var muteChannel1 = false
var muteChannel2 = false
var muteChannel3 = false
var muteChannel4 = false
var muteMaster   = false
var channel1Volume = Float(0)
// This is really just for the future.  Have to edit some low level code
// in the SwiftOSC library to get it to work like I want it to.

class OSCHandler: OSCServerDelegate {
    func didReceive(_ message: OSCMessage) {
        print(message)
    }
}
