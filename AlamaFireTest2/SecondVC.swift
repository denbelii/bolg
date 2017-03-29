//
//  SecondVC.swift
//  AlamaFireTest2
//
//  Created by Андрей on 28.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {
    @IBOutlet weak var labelSessionId: UILabel!
    var sessionId: String? = "OOPS"
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSessionId.text = sessionId
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
