//
//  PersistenceService.swift
//  PersistenceService
//
//  Created by Vasiliy Fedotov on 17.11.2024.
//

public protocol IPersistenceService {
    func makeDatabaseFetch()
}

final class PersistenceService: IPersistenceService {

    func makeDatabaseFetch() {
        print(">>>> Database fetch")
    }
}
