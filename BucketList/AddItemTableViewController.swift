//
//  AddItemTableViewController.swift
//  BucketList
//
//  Created by Shahad Nasser on 12/12/2021.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    weak var delegate: AddItemTableViewControllerDelegate?
    var item: String?
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let text = textField.text!
        delegate?.addItem(by: self, with: text, at: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = item
    }
}
