//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Roman Kobzarev on 08.03.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultForEveryFriend = ""
    var percentValueSelected = "10"
    var numberOfPeople = 2
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = resultForEveryFriend
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(percentValueSelected)% tip."
    }
    @IBAction func recalulatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
