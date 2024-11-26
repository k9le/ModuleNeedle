//
//  SecondScreenInterface.swift
//  SecondScreen
//
//  Created by Vasiliy Fedotov on 17.11.2024.
//

import UIKit

public protocol SecondScreenFactory {
    func makeSecondScreen() -> UIViewController
}
