//
//  ViewController.swift
//  CayugasoftTest2
//
//  Created by Alexander on 16.02.16.
//  Copyright © 2016 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var graphView: GraphView!
    override func viewDidLoad() {
        super.viewDidLoad()
        graphView.f = { 0.01 * $0 * $0 }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

