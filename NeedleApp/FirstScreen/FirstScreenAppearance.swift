//
//  IFirstScreenAppearance.swift
//  FirstScreenImpl
//
//  Created by Vasiliy Fedotov on 17.11.2024.
//

import UIKit

public protocol IFirstScreenAppearance {
    var backgroundColor: UIColor { get }
    var button1Title: String { get }
    var button2Title: String { get }
}

public final class FirstScreenAppearance1: IFirstScreenAppearance {
    public init() {}
    public var backgroundColor: UIColor { UIColor.red }
    public var button1Title: String { "Light" }
    public var button2Title: String { "Dark" }
}

public final class FirstScreenAppearance2: IFirstScreenAppearance {
    public init() {}
    public var backgroundColor: UIColor { UIColor.green }
    public var button1Title: String { "Светлая тема" }
    public var button2Title: String { "Темная тема" }

}
