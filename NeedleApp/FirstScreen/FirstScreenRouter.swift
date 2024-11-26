//
//  FirstScreenRouter.swift
//  FirstScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import UIKit

protocol FirstScreenRouterInterface: AnyObject {
    func showSecondScreen()
}

final class FirstScreenRouter: FirstScreenRouterInterface {
    private let secondScreenFactory: SecondScreenFactory
    
    weak var fromVC: UIViewController?
    
    init(secondScreenFactory: SecondScreenFactory) {
        self.secondScreenFactory = secondScreenFactory
    }
    
    func showSecondScreen() {
        let vc2 = secondScreenFactory.makeSecondScreen()
        fromVC?.navigationController?.pushViewController(vc2, animated: true)
    }
}
