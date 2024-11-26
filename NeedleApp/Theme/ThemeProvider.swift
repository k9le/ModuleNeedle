//
//  IThemeProvider.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import UIKit

protocol IThemeProvider {
    var theme: UIUserInterfaceStyle { get }
}

protocol IThemeContainer: AnyObject, IThemeProvider {
    var theme: UIUserInterfaceStyle { get set }
}

final class ThemeContainer: IThemeContainer, IThemeProvider {
    var theme: UIUserInterfaceStyle = .unspecified
}
