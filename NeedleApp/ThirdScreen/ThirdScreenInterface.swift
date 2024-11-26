//
//  ThirdScreenInterface.swift
//  ThirdScreen
//
//  Created by Vasiliy Fedotov on 17.11.2024.
//

import UIKit

public protocol ThirdScreenFactory {
    func makeThirdScreen(with theme: UIUserInterfaceStyle) -> UIViewController
}
