//
//  LoginViewController.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import SVProgressHUD

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
    private lazy var emailErrorLabel = AppLabel(withInsets: 0, 0, 5, 5)
    private lazy var passwordErrorLabel = AppLabel(withInsets: 0, 0, 5, 5)
    
    private let disposeBag = DisposeBag()
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
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
        self.view.addSubview(emailErrorLabel)
        self.view.addSubview(passwordErrorLabel)
        setupLogoView()
        setupemailView()
        setupPasswordTextView()
        setupButtonsView()
        setupErrorLabel()
    }
    
    // MARK: - setupemailView
    private func setupemailView() {
        decorateTextFieldView(placeHolder: .email,
                              view: emailView,
                              textField: emailTextField,
                              label: emailLabel,
                              errorLabel: emailErrorLabel,
                              returnKeyType: .next,
                              keyBoardType: .emailAddress)
        emailTextField.snp.makeConstraints { make in
            make.centerYWithinMargins.equalTo(self.emailView.snp.centerY)
            make.trailingMargin.equalTo(self.emailView.snp.trailingMargin).offset(-20)
            make.leadingMargin.equalTo(self.emailView.snp.leadingMargin).offset(20)
        }
        emailView.snp.makeConstraints { make in
            make.height.equalTo(50.0)
            make.topMargin.equalTo(self.logoImage.snp.bottom).offset(50)
            make.trailingMargin.equalTo(self.view).inset(25)
            make.leadingMargin.equalTo(self.view).inset(25)
        }
        emailLabel.snp.makeConstraints { make in
            make.height.equalTo(20.0)
            make.centerY.equalTo(self.emailView.snp.topMargin).offset(-8)
            make.leftMargin.equalTo(self.emailView.snp.leftMargin).offset(15)
        }
        
    }
    
    // MARK: - SetupPasswordTextView
    private func setupPasswordTextView() {
        passwordTextField.isSecureTextEntry = true
        decorateTextFieldView(placeHolder: .password,
                              view: passwordView,
                              textField: passwordTextField,
                              label: passwordLabel,
                              errorLabel: passwordErrorLabel,
                              returnKeyType: .done,
                              keyBoardType: .default)
        passwordView.snp.makeConstraints { make in
            make.height.equalTo(50.0)
            make.topMargin.equalTo(self.emailView.snp.bottom).offset(60)
            make.trailingMargin.equalTo(self.view).inset(25)
            make.leadingMargin.equalTo(self.view).inset(25)
        }
        passwordLabel.snp.makeConstraints { make in
            make.height.equalTo(20.0)
            make.centerY.equalTo(self.passwordView.snp.topMargin).offset(-8)
            make.leftMargin.equalTo(self.passwordView.snp.leftMargin).offset(15)
        }
        passwordTextField.snp.makeConstraints { make in
            make.centerYWithinMargins.equalTo(self.passwordView.snp.centerY)
            make.trailingMargin.equalTo(self.passwordView.snp.trailingMargin).offset(-20)
            make.leadingMargin.equalTo(self.passwordView.snp.leadingMargin).offset(20)
        }
    }
    
    // MARK: - setupButtonsView
    private func setupButtonsView() {
        closeButton.setImage(UIImage(assetIdentifier: .closeButton), for: .normal)
        closeButton.addTarget(nil, action: #selector(closeButtonTap), for: .touchUpInside)
        closeButton.snp.makeConstraints { make in
            make.leftMargin.equalTo(self.view).inset(16)
            make.topMargin.equalTo(self.view).inset(16)
            make.height.equalTo(CGSize(width: 20, height: 20))
        }
        loginButton.backgroundColor = UIColor(named: .appBlue)
        loginButton.addTarget(nil, action: #selector(loginButtonTap), for: .touchUpInside)
        loginButton.layer.cornerRadius = 6
        loginButton.titleLabel?.font = UIFont.latoSemiBoldFont(size: 18.0)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle(Constants.TextConstant.login.value(), for: .normal)
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(50.0)
            make.topMargin.equalTo(self.passwordView.snp.bottom).offset(160)
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
    
    // MARK: - setupErrorLabel
    private func setupErrorLabel() {
        decorateErrorLabel(errorLabel: emailErrorLabel)
        decorateErrorLabel(errorLabel: passwordErrorLabel)
        emailErrorLabel.snp.makeConstraints { make in
            make.height.equalTo(20.0)
            make.topMargin.equalTo(self.emailView.snp.bottomMargin).offset(15)
            make.leftMargin.equalTo(self.emailView.snp.leftMargin).offset(5)
        }
        passwordErrorLabel.snp.makeConstraints { make in
            make.height.equalTo(20.0)
            make.topMargin.equalTo(self.passwordView.snp.bottomMargin).offset(15)
            make.leftMargin.equalTo(self.passwordView.snp.leftMargin).offset(5)
        }
    }
    
    // MARK: - decorateErrorLabel
    private func decorateErrorLabel(errorLabel: UILabel) {
        errorLabel.textColor = .red
        errorLabel.font = UIFont.latoMediumFont(size: 13.0)
        errorLabel.text = ErrorMessage.email.value()
        errorLabel.isHidden = true
    }
    
    // MARK: - decorateTextFieldView
    private func decorateTextFieldView(placeHolder: Constants.TextConstant,
                                       view: UIView,
                                       textField: UITextField,
                                       label: UILabel,
                                       errorLabel: UILabel,
                                       returnKeyType: UIReturnKeyType,
                                       keyBoardType: UIKeyboardType) {
        textField.returnKeyType = returnKeyType
        textField.keyboardType = keyBoardType
        textField.font = UIFont.latoRegularFont(size: 16.0)
        textField.placeholder = placeHolder.value()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 6
        label.textColor = UIColor.black
        label.bringSubviewToFront(view)
        label.text = placeHolder.value()
        if #available(iOS 13.0, *) {
            label.textColor = UIColor.label
            label.backgroundColor = UIColor.systemBackground
        } else {
            label.textColor = UIColor.black
            label.backgroundColor = UIColor.white
        }
        label.font = UIFont.latoMediumFont(size: 13)
    }
    
    // MARK: - Close Button Tap
    @objc private func closeButtonTap() {
        self.dismiss(animated: true)
    }
    
    // MARK: - Login Button Tap
    @objc private func loginButtonTap() {
        SVProgressHUD.show()
        viewModel.callLoginAPI().subscribe { value in
            SVProgressHUD.dismiss()
            switch value {
            case .completed:
                self.dismiss(animated: true)
            case .error(let error):
                let errorModel = error as? ErrorModel
                self.showAlert(title: Constants.TextConstant.appName.value(), message: errorModel?.description() ?? error.localizedDescription)
            case .next:
                break
            }
        }.disposed(by: disposeBag)
    }
    
    // MARK: - setupBindings
    func setupBindings() {
        emailTextField.rx.text.bind(to: viewModel.emailSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.bind(to: viewModel.passwordSubject).disposed(by: disposeBag)
        viewModel.isValidForm.bind(to: loginButton.rx.valid).disposed(by: disposeBag)
        
        emailTextField.rx.controlEvent(.editingChanged).subscribe { _ in
            if (self.viewModel.isValidEmail()) == true {
                self.emailView.layer.borderColor = UIColor.lightGray.cgColor
                self.emailErrorLabel.isHidden = true
            } else {
                self.emailView.layer.borderColor = UIColor.red.cgColor
                self.emailErrorLabel.isHidden = false
            }
        }.disposed(by: disposeBag)
        
        passwordTextField.rx.controlEvent(.editingChanged).subscribe { _ in
            if (self.viewModel.isValidPassword()) == true {
                self.passwordView.layer.borderColor = UIColor.lightGray.cgColor
                self.passwordErrorLabel.isHidden = true
            } else {
                self.passwordView.layer.borderColor = UIColor.red.cgColor
                self.passwordErrorLabel.isHidden = false
            }
        }.disposed(by: disposeBag)
        
        emailTextField.rx.controlEvent(.editingDidEndOnExit).subscribe { _ in
            self.emailTextField.resignFirstResponder()
            self.passwordTextField.becomeFirstResponder()
        }.disposed(by: disposeBag)
        
        passwordTextField.rx.controlEvent(.editingDidEndOnExit).subscribe { _ in
            self.passwordTextField.resignFirstResponder()
        }.disposed(by: disposeBag)
    }
}
