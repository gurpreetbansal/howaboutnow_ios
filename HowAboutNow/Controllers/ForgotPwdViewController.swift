//
//  ForgotPwdViewController.swift
//  StrongHold
//
//  Created by iMarkPC on 26/08/19.
//  Copyright © 2019 iMark. All rights reserved.
//

import UIKit

class ForgotPwdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = false
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
