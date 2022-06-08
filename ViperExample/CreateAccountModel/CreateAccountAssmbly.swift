//
//  CreateAccountAssmbly.swift
//  ViperExample
//
//  Created by Konstantin on 08.06.2022.
//

import UIKit


class CreateAccountAssmbly {
    static func assembleCreateAccoubtModule() -> UIViewController {
        
        let view = CreateAccountView()
        let interactor = CreateAccountInteractor()
        let router = CreateAccountRouter()
        
        let presenter = CreateAccountPresenter(view: view, interactor: interactor, router: router)
        
        interactor.output = presenter
        view.output = presenter
        
        router.rootVC = view
        return view
    }
}
