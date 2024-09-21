//
//  Presenter.swift
//  mvvm
//
//  Created by Prachi Bharadwaj on 08/09/24.
//

import Foundation
import UIKit

protocol UpdateUserDelegate {
    func updateModel(name: String)
}

typealias PresenterDelegate = UpdateUserDelegate & UIViewController

class LoginPresenter {
    
    weak var delegate: PresenterDelegate?
    var model = UserModel(name: "")
   
    public func setDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    func getUserName(name: String) async {
        //bussiness logic
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        if !name.isEmpty {
            model.name = name
            self.delegate?.updateModel(name: model.name)
        }
    }
}
