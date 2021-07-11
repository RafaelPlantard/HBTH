//
//  PageRepositoryFactory.swift
//  HBTH
//
//  Created by Rafael Ferreira on 7/10/21.
//

enum PageRepositoryFactory {
    static func make() -> PageRepositoryProtocol {
        PageRepository()
    }
}
