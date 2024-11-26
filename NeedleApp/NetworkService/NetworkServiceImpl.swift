//
//  NetworkServiceFactoryImpl.swift
//  NetworkService
//
//  Created by Vasiliy Fedotov on 17.11.2024.
//

import NeedleFoundation

final class NetworkServiceImpl: NetworkServiceInterface {

    func makeNetworkRequest() {
        print(">>>> Network request")
    }
}
