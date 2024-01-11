//
//  AccountViewController.swift
//  JetDevsHomeWork
//
//  Created by Gary.yao on 2021/10/29.
//

import UIKit
import Kingfisher
import RxSwift

class AccountViewController: UIViewController {

	@IBOutlet weak var nonLoginView: UIView!
	@IBOutlet weak var loginView: UIView!
	@IBOutlet weak var daysLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var headImageView: UIImageView!
    
    let disposeBag = DisposeBag()
    
	override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationController?.navigationBar.isHidden = true
        setupBindings()
    }
    
    // MARK: - setupBindings
    private func setupBindings() {
        UserDefaults.standard.rx.observe(Bool.self,
                                         Constants.UserDefaultsKey.isLogin.rawValue).subscribe { value in
            self.nonLoginView.isHidden = ((value.element ?? false) ?? false)
            self.loginView.isHidden = !self.nonLoginView.isHidden
            if ((value.element ?? false) ?? false) == true {
                self.setUserData()
            }
        }.disposed(by: disposeBag)
    }
    
    // MARK: - setUserData
    private func setUserData() {
        if let userDetails = UserDefaultsManager().userDetails {
            nameLabel.text = (userDetails.userName ?? "")
            daysLabel.text = (userDetails.daysago ?? "")
            headImageView.setImage(with: (userDetails.userProfileURL ?? ""))
        }
    }
	
    // MARK: - loginButtonTap
	@IBAction func loginButtonTap(_ sender: UIButton) {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        self.navigationController?.present(loginVC, animated: true)
	}
}
