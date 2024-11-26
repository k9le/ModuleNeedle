//
//  ThirdScreenRouter.swift
//  ThirdScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import UIKit

protocol ThirdScreenRouterInterface: AnyObject {
    func popBack()
}

final class ThirdScreenRouter: ThirdScreenRouterInterface {
    weak var fromVC: UIViewController?

    func popBack() {
        fromVC?.navigationController?.popViewController(animated: true)
    }
}
