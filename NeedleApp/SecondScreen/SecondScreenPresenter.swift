//
//  SecondScreenPresenter.swift
//  SecondScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import Foundation

protocol SecondScreenPresenterInterface: AnyObject {
    func viewDidLoad()

    func backButtonTapped()
    func makeRequestTapped()
    func nextScreenTapped()
}

final class SecondScreenPresenterImpl: SecondScreenPresenterInterface {

    private let router: SecondScreenRouterInterface
    private let persistenceService: PersistenceServiceInterface
    private let networkService: NetworkServiceInterface

    private let loggerService: LoggerServiceInterface

    weak var view: SecondScreenViewInterface?

    init(
        router: SecondScreenRouterInterface,
        networkService: NetworkServiceInterface,
        persistenceService: PersistenceServiceInterface,
        loggerService: LoggerServiceInterface
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
