//
//  Settings.swift
//  BottleGame
//
//  Created by Anton Kondrashov on 30/11/2016.
//  Copyright © 2016 Anton Kondrashov. All rights reserved.
//

import UIKit

class SettingsController: UIViewController{
  
  
  @IBAction func numberButtonTap(_ sender: UIButton) {
    let title = sender.currentTitle ?? ""
    let number = Int(title)
    
    let ud = UserDefaults()
    ud.set(number, forKey: "players")
    performSegue(withIdentifier: "toGame", sender: nil)
  }
  
}
