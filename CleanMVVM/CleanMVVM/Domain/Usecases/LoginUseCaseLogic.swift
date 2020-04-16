//
//  LoginUseCaseLogic.swift
//  CleanMVVM
//
//  Created by Kévin Empociello on 16/04/2020.
//  Copyright (c) 2020 Zipline. All rights reserved.
//

import RxSwift

/**
 Login usecase logic protocol to communicate between ViewModel and UseCase
 */
protocol LoginUseCaseLogic {

	// MARK: Alias

    typealias UCRequest = LoginUseCaseRequest
    typealias UCResponse = NekkarResponse<User>

    /** Verify and log in the user */
    func login(request: UCRequest) -> Single<UCResponse>
}
