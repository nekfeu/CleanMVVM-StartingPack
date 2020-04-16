//
//  LoginViewController.swift
//  CleanMVVM
//
//  Created by Kévin Empociello on 16/04/2020.
//  Copyright (c) 2020 Zipline. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

/** Login screen for the user to log into his account */
class LoginViewController: UIViewController {

    // MARK: Properties

    /** View model created by dependency injection */
    var viewModel: LoginViewModel?

    /** Dispose all observers subscribed in `bindViewModel` function */
    private var disposeBag = DisposeBag()

    // MARK: IBOutlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var validateButton: UIButton!

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        /** Need dependency injection elsewhere with Swinject for exemple */
        let worker = AuthentificationWorker()
        let usecase = LoginUseCase(authWorker: worker)
        viewModel = LoginViewModel(loginUseCase: usecase)

        bindViewModel()
    }

    // MARK: Functions

    /** Bind the viewModel to the UI  */
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }

        let input = LoginViewModel.Input(email: emailField.rx.text,
                                         password: passwordField.rx.text,
                                         didTouchValidate: validateButton.rx.tap)
        let output = viewModel.transform(input: input)

        /** Login response */
        output.loginDriver.drive(onNext: { [unowned self] (response) in
            self.errorLabel.textColor = response ? UIColor.green : UIColor.red
            self.errorLabel.text = response ? "Login succeed" : "Form invalid"
        }).disposed(by: disposeBag)
    }
}
