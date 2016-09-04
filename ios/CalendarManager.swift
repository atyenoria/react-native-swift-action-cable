//
//  CalendarManager.swift
//  SwiftBridge
//
//  Created by Michael Schwartz on 12/11/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

import Foundation
import ActionCableClient



// CalendarManager.swift

@objc(CalendarManager)

class CalendarManager: NSObject {
  let client = ActionCableClient(URL: NSURL(string: "ws://localhost:4000/cable")!)
  override init() {
    
    client.origin = "localhost:4000"
    client.connect()
    client.onConnected = {
      print("Connected!")
    }
    
    client.onDisconnected = {(error: ErrorType?) in
      print("Disconnected!")
    }
    let roomChannel = client.create("RoomChannel")
    
    // Receive a message from the server. Typically a Dictionary.
    roomChannel.onReceive = { (JSON : AnyObject?, error : ErrorType?) in
      print("Received", JSON, error)
    }
    
    // A channel has successfully been subscribed to.
    roomChannel.onSubscribed = {
      print("Yay!")
    }
    
    // A channel was unsubscribed, either manually or from a client disconnect.
    roomChannel.onUnsubscribed = {
      print("Unsubscribed")
    }
    
    // The attempt at subscribing to a channel was rejected by the server.
    roomChannel.onRejected = {
      print("Rejected")
    }
    
    
    
    
  }
  
  @objc func addEvent(name: String, location: String, date: NSNumber) -> Void {
  let roomChannel = client.create("RoomChannel")
  roomChannel["speak"](["message": "Hello, World!"])
  }
  
  
}


