//
//  CoffeeEndPoint.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import Alamofire

enum CoffeeEndPoint: EndPoint {
    
    case Login(Encodable)
    case Register(Encodable)
    
    var path: String {
        switch self {
        case .Login:
            return "/auth/login"
        case .Register:
            return "/auth/register_user"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .Login, .Register:
            return .post
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .Login, .Register:
            return nil
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case let .Login(request), let .Register(request):
            return request.toDict()
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .Login, .Register:
            return JSONEncoding.default
        }
    }
}

extension Encodable {
    func toDict() -> [String: Any] {
        do {
            let requestData = try JSONEncoder().encode(self)
            let requestDict = try JSONSerialization.jsonObject(with: requestData, options: .allowFragments) as? [String: Any]
            return requestDict ?? [:]
        }
        catch {
            return [:]
        }
    }
}
