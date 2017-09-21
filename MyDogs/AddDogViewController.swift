//
//  AddDogViewController.swift
//  MyDogs
//
//  Created by H on 9/18/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import UIKit

class AddDogViewController: UIViewController {
    
    weak var addDelegate: AddDogDelegate?
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var colorLabel: UITextField!
    
    @IBOutlet weak var treatLabel: UITextField!
    
    @IBAction func addDogButtonPressed(_ sender: UIButton) {
        addDelegate?.addDog(by: self, name: nameLabel.text!, color: colorLabel.text!, treat: treatLabel.text!, indexPath: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
