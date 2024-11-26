//
//  LoggerServiceImpl.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import Foundation

final class LoggerService: LoggerServiceInterface {
    func log(_ str: String) {
        print(">>>> LOG: \(str)")
    }
}
