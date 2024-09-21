//
//  MainViewController.swift
//  mvc
//
//  Created by Prachi Bharadwaj on 25/08/24.
//

import UIKit

class MainViewController: UIViewController, UpdateUserDelegate {

    @IBOutlet weak var userDetail: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private var presenter = LoginPresenter()
    
    @IBAction func saveButton(_ sender: UIButton) {
        if let text = textField.text {
                //model updating
            Task {
                await presenter.getUserName(name: text)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setDelegate(delegate: self)
    }
    
    func updateModel(name: String) {
        userDetail.text = "hello " + name
    }
}


