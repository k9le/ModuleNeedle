//
//  FirstScreenAppearanceImpl.swift
//  FirstScreenImpl
//
//  Created by Vasiliy Fedotov on 17.11.2024.
//

import UIKit

public final class FirstScreenAppearanceImpl1: FirstScreenAppearance {
    public init() {}
    public var backgroundColor: UIColor { UIColor.red }
    public var button1Title: String { "Light" }
    public var button2Title: String { "Dark" }
}

public final class FirstScreenAppearanceImpl2: FirstScreenAppearance {
    public init() {}
    public var backgroundColor: UIColor { UIColor.green }
    public var button1Title: String { "Светлая тема" }
    public var button2Title: String { "Темная тема" }

}
