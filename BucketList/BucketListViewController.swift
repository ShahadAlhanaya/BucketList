//
//  ViewController.swift
//  BucketList
//
//  Created by Shahad Nasser on 12/12/2021.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    var items = ["go to moon", "swim in the amazon"]
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded!")
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AddItemSegue"){
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
        }else if(segue.identifier == "EditItemSegue"){
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
        }
        
   
    }
    
    func addItem(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        print("im hidden save")
        if let ip = indexPath {
            items[ip.row] = text
        }else{
            items.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        print("im hidden cancel")
        dismiss(animated: true, completion: nil)
    }
}

