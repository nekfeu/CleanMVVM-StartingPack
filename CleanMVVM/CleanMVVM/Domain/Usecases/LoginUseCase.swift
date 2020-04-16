//
//  LoginUseCase.swift
//  CleanMVVM
//
//  Created by Kévin Empociello on 16/04/2020.
//  Copyright (c) 2020 Zipline. All rights reserved.
//

import RxSwift

/**
 Implementation of the `LoginUseCaseLogic` protocol
 */
class LoginUseCase: LoginUseCaseLogic {

    // MARK: Properties

    let authWorker: AuthentificationWorkerLogic

    // MARK: Initialisers
    
    init(authWorker: AuthentificationWorkerLogic) {
        self.authWorker = authWorker
    }
    
    // MARK: Functions

    func login(request: UCRequest) -> Single<UCResponse> {
        if checkForm(email: request.email, password: request.password) {
            guard let email = request.email, let password = request.password else {
                return Single.just(UCResponse(success: false, error: nil, data: nil))
            }

            let workerRequest = AuthentificationWorkerRequest(email: email, password: password)
            return authWorker.login(request: workerRequest)
        } else {
            return Single.just(UCResponse(success: false, error: nil, data: nil))
        }
    }

    /** Check form */
    private func checkForm(email: String?, password: String?) -> Bool {
        guard let email = email, let password = password else {
            return false
        }

        if email.count < 4 || !email.contains("@") { return false }
        if password.count < 4 { return false }

        return true
    }

}
