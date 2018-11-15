import UIKit
import SwiftOSC

class OSCHandler: OSCServerDelegate {
    func didReceive(_ message: OSCMessage) {
        for argument in message.arguments {
            print(argument!)
        }
    }
}
var server = OSCServer(address: "", port: 8080)
server.delegate = OSCHandler()
server.start()

var client = OSCClient(address: "localhost", port: 8080)

var message = OSCMessage(
    OSCAddressPattern("/ch/04/eq/3"),
    2,
    0.665,
    0.5,
    0.464798
)

client.send(message)
