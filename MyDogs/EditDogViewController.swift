//
//  EditDogViewController.swift
//  MyDogs
//
//  Created by H on 9/18/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import UIKit

class EditDogViewController: UIViewController {
    
    weak var editDelegate: EditDogDelegate?
    
    var name: String?
    var color: String?
    var treat: String?
    var index: NSIndexPath?
    
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var colorLabel: UITextField!
    
    @IBOutlet weak var treatLabel: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        editDelegate?.cancelDog(by: self)
    }
    
    
    @IBAction func deleteDogButton(_ sender: UIButton) {
        editDelegate?.deleteDog(by: self, indexPath: index!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        colorLabel.text = color
        treatLabel.text = treat

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
