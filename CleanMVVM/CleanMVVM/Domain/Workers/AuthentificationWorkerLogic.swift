//
//  AuthentificationWorkerLogic.swift
//  CleanMVVM
//
//  Created by Kévin Empociello on 16/04/2020.
//  Copyright (c) 2020 Zipline. All rights reserved.
//

import RxSwift

/**
 Authentification worker logic protocol to communicate between UseCase and Worker
 */
protocol AuthentificationWorkerLogic {

	// MARK: Alias

    typealias WRequest = AuthentificationWorkerRequest
    typealias WResponse = NekkarResponse<User>

    /** Login the user */
    func login(request: WRequest) -> Single<WResponse>
}
