//
//  DogsDelegate.swift
//  MyDogs
//
//  Created by H on 9/18/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import Foundation

protocol EditDogDelegate: class {
    func cancelDog(by controller: EditDogViewController)
    func deleteDog(by controller: EditDogViewController, indexPath: NSIndexPath)
}
