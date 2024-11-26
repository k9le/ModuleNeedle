//
//  NetworkService.swift
//  NetworkService
//
//  Created by Vasiliy Fedotov on 17.11.2024.
//

import NeedleFoundation

public protocol INetworkService {
    func makeNetworkRequest()
}

final class NetworkService: INetworkService {

    func makeNetworkRequest() {
        print(">>>> Network request")
    }
}
