//
//  SecondScreenPresenter.swift
//  SecondScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import Foundation

protocol ISecondScreenPresenter: AnyObject {
    func viewDidLoad()

    func backButtonTapped()
    func makeRequestTapped()
    func nextScreenTapped()
}

final class SecondScreenPresenter: ISecondScreenPresenter {

    private let router: ISecondScreenRouter
    private let persistenceService: IPersistenceService
    private let networkService: INetworkService

    private let loggerService: ILoggerService

    init(
        router: ISecondScreenRouter,
        networkService: INetworkService,
        persistenceService: IPersistenceService,
        loggerService: ILoggerService
    ) {
        self.router = router
        self.networkService = networkService
        self.persistenceService = persistenceService
        self.loggerService = loggerService
    }

    func viewDidLoad() {
        loggerService.log("Second screen was load")
    }

    func backButtonTapped() {
        router.popBack()
    }

    func makeRequestTapped() {
        networkService.makeNetworkRequest()
    }

    func nextScreenTapped() {
        router.goNext()
    }
}
