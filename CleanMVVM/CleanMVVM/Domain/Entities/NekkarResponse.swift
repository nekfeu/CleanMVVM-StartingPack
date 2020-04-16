//
//  NekkarResponse.swift
//  CleanMVVM
//
//  Created by Kévin Empociello on 16/04/2020.
//  Copyright © 2020 Kévin Empociello. All rights reserved.
//

struct NekkarResponse<T> {

    // MARK: Properties

    let success: Bool
    let error: Error?
    let data: T?
}
