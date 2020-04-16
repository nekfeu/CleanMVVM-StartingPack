//
//  AuthentificationWorker.swift
//  CleanMVVM
//
//  Created by Kévin Empociello on 16/04/2020.
//  Copyright (c) 2020 Zipline. All rights reserved.
//

import RxSwift

/**
 Implementation of the `AuthentificationWorkerLogic` protocol
 */
class AuthentificationWorker: AuthentificationWorkerLogic {

    // MARK: Properties

//    var alamofire: Alamofire

    // MARK: Initialisers
    
    init() {}
    
    // MARK: Functions

    func login(request: WRequest) -> Single<WResponse> {
        // TODO: Open the request and call alamofire for exemple
        // alamofire.request("login", request.email, request.password)
        // Get the response and map it into WResponse

        let user = User(firstName: "Adrien", lastName: "Carvalot", email: "nyoxide@gmail.com")
        let response = WResponse(success: true, error: nil, data: user)

        return Single.just(response)
    }
}
