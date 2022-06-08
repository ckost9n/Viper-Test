//
//  CreateAccountInteractor.swift
//  ViperExample
//
//  Created by Konstantin on 07.06.2022.
//

import Foundation

protocol CreateAccountInteractorInput {
    var output: CreateAccountInteractorOutput? { get set }
    func createAccount(withLogin login: String, password: String)
}

protocol CreateAccountInteractorOutput: AnyObject {
    func didReceive(error: String)
    func didCreateAccount(withLogin login: String)
}

final class CreateAccountInteractor: CreateAccountInteractorInput {
    weak var output: CreateAccountInteractorOutput?
    
    func createAccount(withLogin login: String, password: String) {
        print("tap2")
        let _ = Account(login: login, password: password)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            self.output?.didCreateAccount(withLogin: login)
        }
    }
}
