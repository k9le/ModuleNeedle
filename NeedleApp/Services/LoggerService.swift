//
//  LoggerService.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import Foundation

protocol ILoggerService {
    func log(_ str: String)
}

final class LoggerService: ILoggerService {
    func log(_ str: String) {
        print(">>>> LOG: \(str)")
    }
}
