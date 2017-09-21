//
//  DogsCollectionViewController.swift
//  MyDogs
//
//  Created by H on 9/18/17.
//  Copyright © 2017 Harshada. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "DogCell"

class DogsCollectionViewController: UICollectionViewController, EditDogDelegate, AddDogDelegate {
    
    var dogList = [MyDogs]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    @IBAction func addDogButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddDogSegue", sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditDogSegue", sender: indexPath)
        print(indexPath)
    }
    
    func cancelDog(by controller: EditDogViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // For Edit Dog route
        if sender is NSIndexPath {
            let navigationController = segue.destination as! UINavigationController
            let editController = navigationController.topViewController as! EditDogViewController
            editController.editDelegate = self
            
            let index = sender as! NSIndexPath
            editController.index = sender as? NSIndexPath
            editController.name = dogList[index.row].name
            editController.color = dogList[index.row].color
            editController.treat = dogList[index.row].treat
        } else {
            let addController = segue.destination as! AddDogViewController
            addController.addDelegate = self
        }
    }
    
    func fetchAllItems() {
        let request:NSFetchRequest<MyDogs> = MyDogs.fetchRequest()
        do {
            let result = try managedObjectContext.fetch(request)
            dogList = result
        } catch {
            print("\(error)")
        }
    }
    
    func addDog(by controller: AddDogViewController, name: String, color: String, treat: String, indexPath: NSIndexPath?) {
        if let ip = indexPath {
            dogList[ip.row].name = name
            dogList[ip.row].color = color
            dogList[ip.row].treat = treat
        } else {
            let dog = MyDogs(context: managedObjectContext)
            dog.name = name
            dog.color = color
            dog.treat = treat
        }
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        
        fetchAllItems()
        collectionView?.reloadData()
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func deleteDog(by controller: EditDogViewController, indexPath: NSIndexPath) {
        let dog = dogList[indexPath.row]
        managedObjectContext.delete(dog)
        
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        
        dogList.remove(at: indexPath.row)
        collectionView?.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(dogList.count)
        return dogList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DogCell
    
        // Configure the cellDog
        
        cell.dogImage.image = #imageLiteral(resourceName: "Pomimo-Puppy")
        cell.dogName.text = dogList[indexPath.row].name
//        print(dogList[indexPath.row].name!)
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
