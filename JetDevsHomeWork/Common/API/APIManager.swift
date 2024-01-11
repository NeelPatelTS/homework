//
//  APIManager.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Alamofire
import RxSwift

class APIManager {
    
    static let shared = APIManager()
    
    private let disposeBag = DisposeBag()
    
    private func request<T: Decodable>(endpoint: APIEndpoint,
                                       method: HTTPMethod,
                                       parameters: Parameters? = nil) -> Observable<T> {
        return Observable<T>.create { observer in
            
            let jsonData = (parameters?.jsonStringRepresentation ?? "").data(using: .utf8, allowLossyConversion: false) ?? Data()
            guard let url = endpoint.url() else {
                observer.onError(ErrorModel.unknown(error: ErrorMessage.urlInvalid.value()))
                return Disposables.create {
                    return
                }
            }
            var urlrequest = URLRequest(url: url)
            urlrequest.httpMethod = HTTPMethod.post.rawValue
            urlrequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlrequest.httpBody = jsonData
            
            let request = AF.request(urlrequest)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(APIError.networkError(error))
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    func login(email: String, password: String) -> Observable<BaseModel<UserModel>> {
        let parameters: Parameters = [APIParameter.email.rawValue: email,
                                      APIParameter.password.rawValue: password]
        return request(endpoint: .login, method: .post, parameters: parameters)
    }
}
