//
//  ThirdScreenPresenter.swift
//  ThirdScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import Foundation

protocol ThirdScreenPresenterInterface: AnyObject {
    func viewDidLoad()

    func backButtonTapped()
    func requestButtonTapped()
    func logButtonTapped()
}

final class ThirdScreenPresenterImpl: ThirdScreenPresenterInterface {

    private let router: ThirdScreenRouterInterface
    private let loggerService: LoggerServiceInterface
    private let networkService: NetworkServiceInterface

    weak var view: ThirdScreenViewInterface?

    init(
        router: ThirdScreenRouterInterface,
        loggerService: LoggerServiceInterface,
        networkService: NetworkServiceInterface
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
