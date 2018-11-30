//
//  OSCInterface.swift
//  X-Air Controls
//
//  Created by Joshua Mathews on 11/29/18.
//  Copyright © 2018 Joshua Mathews. All rights reserved.
//

import Foundation
import SwiftOSC

var server = OSCServer(address: "", port: 10024)
var client = OSCClient(address: "192.168.1.1", port: 10024)

class OSCHandler: OSCServerDelegate {
    func didReceive(_ message: OSCMessage) {
        print(message)
    }
}
