//
//  ThemeProvider.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import UIKit

protocol ThemeProvider {
    var theme: UIUserInterfaceStyle { get }
}

protocol ThemeContainer: AnyObject, ThemeProvider {
    var theme: UIUserInterfaceStyle { get set }
}

final class ThemeContainerImpl: ThemeContainer, ThemeProvider {
    var theme: UIUserInterfaceStyle = .unspecified
}
