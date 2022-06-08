//
//  CreateAccountView.swift
//  ViperExample
//
//  Created by Konstantin on 07.06.2022.
//

import UIKit

protocol CreateAccountViewInput {
    var output: CreateAccountViewOutput? { get set }
}

protocol CreateAccountViewOutput: AnyObject {
    func userSelectCreateAccount(withLogin login: String, password: String)
}

final class CreateAccountView: UIViewController, CreateAccountViewInput {
    var output: CreateAccountViewOutput?
    
    private let loginLabel: UILabel
    private let passwordLabel: UILabel
    private let acceptButton: UIButton

    init() {
        loginLabel = UILabel()
        passwordLabel = UILabel()
        acceptButton = UIButton()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginLabel)
        view.addSubview(passwordLabel)
        view.addSubview(acceptButton)
        
        loginLabel.text = "login123"
        loginLabel.textColor = .black
        passwordLabel.text = "abcd123"
        passwordLabel.textColor = .black
        acceptButton.setTitle("Создать аккаунт", for: .normal)
        acceptButton.backgroundColor = .gray
        acceptButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        print("tap")
        output?.userSelectCreateAccount(withLogin: loginLabel.text ?? "",
                                        password: passwordLabel.text ?? "")
    }
}

extension CreateAccountView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -16),
            
            passwordLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            acceptButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
            acceptButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            acceptButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            acceptButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
    

