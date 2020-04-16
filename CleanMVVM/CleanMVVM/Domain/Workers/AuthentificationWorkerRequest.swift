//
//  AuthentificationWorkerRequest.swift
//  CleanMVVM
//
//  Created by Kévin Empociello on 16/04/2020.
//  Copyright (c) 2020 Zipline. All rights reserved.
//

import Foundation

/**
 Model of the request used by the `AuthentificationWorker`
 */
struct AuthentificationWorkerRequest: Codable {
    let email: String
    let password: String
}
