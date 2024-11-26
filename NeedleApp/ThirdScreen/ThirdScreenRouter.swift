//
//  ThirdScreenRouter.swift
//  ThirdScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import UIKit

protocol IThirdScreenRouter: AnyObject {
    func popBack()
}

final class ThirdScreenRouter: IThirdScreenRouter {
    weak var fromVC: UIViewController?

    func popBack() {
        fromVC?.navigationController?.popViewController(animated: true)
    }
}
