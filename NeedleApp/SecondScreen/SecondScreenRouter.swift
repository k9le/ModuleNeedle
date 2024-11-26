//
//  SecondScreenRouter.swift
//  SecondScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import UIKit

protocol SecondScreenRouterInterface: AnyObject {
    func popBack()
    func goNext()
}

final class SecondScreenRouter: SecondScreenRouterInterface {
    private let thirdScreenFactory: ThirdScreenFactory
    weak var fromVC: UIViewController?

    init(thirdScreenFactory: ThirdScreenFactory) {
        self.thirdScreenFactory = thirdScreenFactory
    }

    func popBack() {
        fromVC?.navigationController?.popViewController(animated: true)
    }

    func goNext() {
        let vc = thirdScreenFactory.makeThirdScreen(with: .dark)
        fromVC?.navigationController?.pushViewController(vc, animated: true)
    }
}
