//
//  FirstScreenRouter.swift
//  FirstScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import UIKit

protocol IFirstScreenRouter: AnyObject {
    func showSecondScreen()
}

final class FirstScreenRouter: IFirstScreenRouter {
    private let secondScreenAssembly: ISecondScreenAssembly
    
    weak var fromVC: UIViewController?
    
    init(secondScreenAssembly: ISecondScreenAssembly) {
        self.secondScreenAssembly = secondScreenAssembly
    }
    
    func showSecondScreen() {
        let vc2 = secondScreenAssembly.createSecondScreen()
        fromVC?.navigationController?.pushViewController(vc2, animated: true)
    }
}
