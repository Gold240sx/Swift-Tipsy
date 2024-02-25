//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Michael Martell on 2/23/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var BillAmount: Double?
    var SplitAmount: Double?
    var Split: Double?
    var Tip: Double?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String("\(Split)")
        settingsLabel.text = String("Split between \(Split) people, with a \(Tip)% tip. Bill Total: \(BillAmount)")
    }
}
