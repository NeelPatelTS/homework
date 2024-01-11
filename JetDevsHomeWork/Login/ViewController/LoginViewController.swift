//
//  LoginViewController.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    private lazy var logoImage = UIImageView()
    private lazy var closeButton = UIButton()
    private lazy var emailView = UIView()
    private lazy var emailLabel = AppLabel(withInsets: 0, 0, 5, 5)
    private lazy var emailTextField = UITextField()
    private lazy var passwordView = UIView()
    private lazy var passwordLabel = AppLabel(withInsets: 0, 0, 5, 5)
    private lazy var passwordTextField = UITextField()
    private lazy var loginButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        if #available(iOS 13.0, *) {
            self.view.backgroundColor = .systemBackground
        } else {
            self.view.backgroundColor = .white
        }
        self.view.addSubview(closeButton)
        self.view.addSubview(logoImage)
        self.view.addSubview(emailView)
        self.emailView.addSubview(emailTextField)
        self.view.addSubview(emailLabel)
        self.view.addSubview(passwordView)
        self.passwordView.addSubview(passwordTextField)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(loginButton)
        setupLogoView()
        setupemailView()
        setupPasswordTextView()
        setupButtonsView()
    }
    
    // MARK: - setupemailView
    private func setupemailView() {
        emailTextField.returnKeyType = .next
        emailTextField.keyboardType = .emailAddress
        emailTextField.font = UIFont.latoRegularFont(size: 16.0)
        emailTextField.placeholder = Constants.email.value()
        
        emailTextField.snp.makeConstraints { make in
            make.centerYWithinMargins.equalTo(self.emailView.snp.centerY)
            make.trailingMargin.equalTo(self.emailView.snp.trailingMargin).offset(-20)
            make.leadingMargin.equalTo(self.emailView.snp.leadingMargin).offset(20)
        }
        
        emailView.layer.borderWidth = 1
        emailView.layer.borderColor = UIColor.lightGray.cgColor
        emailView.layer.cornerRadius = 5
        emailView.snp.makeConstraints { make in
            make.height.equalTo(50.0)
            make.topMargin.equalTo(self.logoImage.snp.bottom).offset(50)
            make.trailingMargin.equalTo(self.view).inset(25)
            make.leadingMargin.equalTo(self.view).inset(25)
        }
        
        emailLabel.textColor = UIColor.black
        emailLabel.bringSubviewToFront(self.emailView)
        emailLabel.text = Constants.email.value()
        if #available(iOS 13.0, *) {
            emailLabel.textColor = UIColor.label
            emailLabel.backgroundColor = UIColor.systemBackground
        } else {
            emailLabel.textColor = UIColor.black
            emailLabel.backgroundColor = UIColor.white
        }
        
        emailLabel.font = UIFont.latoMediumFont(size: 13)
        emailLabel.snp.makeConstraints { make in
            make.height.equalTo(20.0)
            make.centerY.equalTo(self.emailView.snp.topMargin).offset(-8)
            make.leftMargin.equalTo(self.emailView.snp.leftMargin).offset(15)
        }
    }
    
    // MARK: - SetupPasswordTextView
    private func setupPasswordTextView() {
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        passwordView.layer.cornerRadius = 5
        passwordView.snp.makeConstraints { make in
            make.height.equalTo(50.0)
            make.topMargin.equalTo(self.emailView.snp.bottom).offset(60)
            make.trailingMargin.equalTo(self.view).inset(25)
            make.leadingMargin.equalTo(self.view).inset(25)
        }
        
        if #available(iOS 13.0, *) {
            passwordLabel.textColor = UIColor.label
            passwordLabel.backgroundColor = UIColor.systemBackground
        } else {
            passwordLabel.textColor = UIColor.black
            passwordLabel.backgroundColor = UIColor.white
        }
        
        passwordLabel.bringSubviewToFront(self.emailView)
        passwordLabel.text = Constants.password.value()
        passwordLabel.font = UIFont.latoMediumFont(size: 13)
        passwordLabel.snp.makeConstraints { make in
            make.height.equalTo(20.0)
            make.centerY.equalTo(self.passwordView.snp.topMargin).offset(-8)
            make.leftMargin.equalTo(self.passwordView.snp.leftMargin).offset(15)
        }
        
        passwordTextField.returnKeyType = .done
        passwordTextField.keyboardType = .default
        passwordTextField.font = UIFont.latoRegularFont(size: 16.0)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = Constants.password.value()
        passwordTextField.snp.makeConstraints { make in
            make.centerYWithinMargins.equalTo(self.passwordView.snp.centerY)
            make.trailingMargin.equalTo(self.passwordView.snp.trailingMargin).offset(-20)
            make.leadingMargin.equalTo(self.passwordView.snp.leadingMargin).offset(20)
        }
    }
    
    // MARK: - setupButtonsView
    private func setupButtonsView() {
        closeButton.titleLabel?.font = .boldSystemFont(ofSize: 20.0)
        closeButton.setTitleColor(.black, for: .normal)
        closeButton.setImage(UIImage(assetIdentifier: .closeButton), for: .normal)
        closeButton.addTarget(nil, action: #selector(closeButtonTap), for: .touchUpInside)
        
        closeButton.snp.makeConstraints { make in
            make.leftMargin.equalTo(self.view).inset(16)
            make.topMargin.equalTo(self.view).inset(16)
            make.height.equalTo(CGSize(width: 30, height: 30))
        }
        loginButton.backgroundColor = UIColor(named: .appBlue)
        loginButton.addTarget(nil, action: #selector(loginButtonTap), for: .touchUpInside)
        loginButton.layer.cornerRadius = 6
        loginButton.titleLabel?.font = UIFont.latoSemiBoldFont(size: 18.0)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle(Constants.login.value(), for: .normal)
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(50.0)
            make.topMargin.equalTo(self.passwordView.snp.bottom).offset(100)
            make.trailingMargin.equalTo(self.view).inset(25)
            make.leadingMargin.equalTo(self.view).inset(25)
        }
    }
    
    // MARK: - setupLogoView
    private func setupLogoView() {
        logoImage.image = UIImage(assetIdentifier: .appLogo)
        logoImage.contentMode = .scaleAspectFit
        logoImage.snp.makeConstraints { make in
            make.topMargin.equalTo(self.view).inset(66)
            make.centerX.equalTo(self.view)
        }
    }
    
    // MARK: - Close Button Tap
    @objc private func closeButtonTap() {
        self.dismiss(animated: true)
    }
    
    // MARK: - Login Button Tap
    @objc private func loginButtonTap() {
        
    }

}
