//
//  SecondScreenRouter.swift
//  SecondScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import UIKit

protocol ISecondScreenRouter: AnyObject {
    func popBack()
    func goNext()
}

final class SecondScreenRouter: ISecondScreenRouter {
    private let thirdScreenAssembly: IThirdScreenAssembly
    weak var fromVC: UIViewController?

    init(thirdScreenAssembly: IThirdScreenAssembly) {
        self.thirdScreenAssembly = thirdScreenAssembly
    }

    func popBack() {
        fromVC?.navigationController?.popViewController(animated: true)
    }

    func goNext() {
        let vc = thirdScreenAssembly.createThirdScreen()
        fromVC?.navigationController?.pushViewController(vc, animated: true)
    }
}
