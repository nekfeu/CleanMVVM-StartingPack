//
//  LoginViewModel.swift
//  CleanMVVM
//
//  Created by Kévin Empociello on 16/04/2020.
//  Copyright (c) 2020 Zipline. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/**
 ViewModel used by `LoginViewController`
 */
class LoginViewModel {

    // MARK: Input/Output

    struct Input {
        let email: ControlProperty<String?>
        let password: ControlProperty<String?>
        let didTouchValidate: ControlEvent<Void>
    }

    struct Output {
        let loginDriver: Driver<Bool>
    }

    // MARK: Properties

    /** Usecase to login */
    let loginUseCase: LoginUseCaseLogic

    /** Dispose bag */
    private var disposeBag = DisposeBag()

    // MARK: Initializer

    init(loginUseCase: LoginUseCaseLogic) {
        self.loginUseCase = loginUseCase
    }

    // MARK: Functions

    /**
     Transforming `LoginViewModel.Input` given by the `LoginViewController`
     into `LoginViewModel.Output` get by the `LoginViewController`
     - parameter input: object which refers to the `LoginViewModel.Input` structure
     - returns: The output created from the input
     */
    func transform(input: Input) -> Output {

        /** Combine last version of email and password */
        let emailPassword = Observable.combineLatest(input.email, input.password)

        /**
         Get notified button validates tap, get the last version of the emailPassword
         Verify the email and password and call the usecase to login if it's okay
         */
        let loginDriver = input.didTouchValidate.withLatestFrom(emailPassword)
            .flatMapLatest { (form) -> Single<Bool> in
                let (email, password) = form

                return self.loginUseCase.login(request: LoginUseCaseRequest(email: email, password: password))
                    .map { (response) -> Bool in
                        print("User: \(String(describing: response.data))")
                        print("Success: \(response.success)")
                        print("Error: \(String(describing: response.error))")

                        return response.success
                }
        }.asDriver(onErrorJustReturn: false)

        /** Testing purpose */
        emailPassword.subscribe(onNext: { (form) in
            let (email, password) = form

            print("Email: \(email ?? "")")
            print("Password: \(password ?? "")")
        }).disposed(by: disposeBag)

        return Output(loginDriver: loginDriver)
    }
}
