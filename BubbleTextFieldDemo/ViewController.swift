//
//  ViewController.swift
//  BubbleTextFieldDemo
//
//  Created by Chris Zielinski on 7/30/18.
//  Copyright © 2018 Big Z Labs. All rights reserved.
//

import Cocoa
import BubbleTextField

class ViewController: NSViewController {

    @IBOutlet var bubbleTextfield: BubbleTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bubbleTextfield.isContinuousSpellCheckingEnabled = true
    }

}

