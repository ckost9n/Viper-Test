//
//  CreateAccountRouter.swift
//  ViperExample
//
//  Created by Konstantin on 07.06.2022.
//

import UIKit

protocol CreateAccountRouterInput {
    func openAuthScreen(withLogin login: String)
}

final class CreateAccountRouter: CreateAccountRouterInput {
    weak var rootVC: UIViewController?
    
    func openAuthScreen(withLogin login: String) {
        
        let newVC = UIViewController(nibName: nil, bundle: nil)
        newVC.view.backgroundColor = .orange
        rootVC?.present(newVC, animated: true)
        
        
    }
    
    
}
