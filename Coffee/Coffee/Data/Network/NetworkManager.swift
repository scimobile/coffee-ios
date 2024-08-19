//
//  NetworkManager.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private let session: Session
    static let shared: NetworkManager = .init()
    private let tokenExpiredErrorCode: Int = 401
    
    private init() {
        session = Session(interceptor: CoffeeRequestInterceptor())
    }
    
    func request<T: Codable>(
        endPoint: CoffeeEndPoint,
        onSuccess: @escaping (T) -> Void,
        onFailed: @escaping (NetworkError) -> Void
    ) {
        session.request(endPoint,
                        method: endPoint.method,
                        parameters: endPoint.parameter,
                        encoding: endPoint.encoding,
                        headers: endPoint.header)
            .validate({ [weak self] request, response, data in
                if response.statusCode == self?.tokenExpiredErrorCode {
                    return .failure(NetworkError.UNEXPECTED_STATUS_CODE(response.statusCode))
                }
                else {
                    return .success(())
                }
            })
            .response { afReponse in
                if let statusCode = afReponse.response?.statusCode {
                    if (200..<300) ~= statusCode {
                        if let data = afReponse.data {
                            let object = try? JSONDecoder().decode(T.self, from: data)
                            if let object = object {
                                onSuccess(object)
                            }
                            else {
                                onFailed(.DECODE_ERROR)
                            }
                        }
                        else {
                            onFailed(.EMPTY_RESPONSE)
                        }
                    }
                    else {
                        onFailed(.UNEXPECTED_STATUS_CODE(statusCode))
                    }
                }
                else {
                    onFailed(.EMPTY_RESPONSE)
                }
        }
    }
}
