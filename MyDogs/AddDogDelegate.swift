//
//  AddDogDelegate.swift
//  MyDogs
//
//  Created by H on 9/18/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import Foundation

protocol AddDogDelegate: class {
    func addDog(by controller: AddDogViewController, name: String, color: String, treat: String, indexPath: NSIndexPath?)
}
