//
//  ThirdScreenPresenter.swift
//  ThirdScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import Foundation

protocol IThirdScreenPresenter: AnyObject {
    func viewDidLoad()

    func backButtonTapped()
    func requestButtonTapped()
    func logButtonTapped()
}

final class ThirdScreenPresenter: IThirdScreenPresenter {

    private let router: IThirdScreenRouter
    private let loggerService: ILoggerService
    private let networkService: INetworkService

    init(
        router: IThirdScreenRouter,
        loggerService: ILoggerService,
        networkService: INetworkService
    ) {
        self.router = router
        self.loggerService = loggerService
        self.networkService = networkService
    }

    func viewDidLoad() {
        loggerService.log("Third screen was load")
    }

    func backButtonTapped() {
        router.popBack()
    }

    func logButtonTapped() {
        loggerService.log(">>>> OLOLO")
    }

    func requestButtonTapped() {
        print(">>> network request")
    }
}
