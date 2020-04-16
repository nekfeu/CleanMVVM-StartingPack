//
//  UIViewController.swift
//  CleanMVVM
//
//  Created by Kévin Empociello on 16/04/2020.
//  Copyright © 2020 Kévin Empociello. All rights reserved.
//

import UIKit

extension UIViewController {

    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
