//
//  ViewController.swift
//  testApp
//
//  Created by Anantha Krishnan K G on 08/11/16.
//  Copyright © 2016 Ananth. All rights reserved.
//

import UIKit
import KGToggleButton
class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let toggleButton = KGToggleButton(frame: CGRect(x: 185, y: 100, width: 50 , height: 50))
        toggleButton.addTarget(self, action: #selector(action(_:)), for: .valueChanged)
        toggleButton.shapeCircle = false
        toggleButton.innerLineColor = UIColor.black
        
        self.view.addSubview(toggleButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func action(_ sender: KGToggleButton){
        
        print("turned \(sender.on ? "ON" : "OFF") programmatic button")
        
    }

    @IBAction func valueChange(_ sender: KGToggleButton) {
        
        print("turned \(sender.on ? "ON" : "OFF") Interface button")
    }

}

