//
//  EndPoint.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import Alamofire

protocol EndPoint: URLConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var header: HTTPHeaders? { get }
    var parameter: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension EndPoint {
    var baseURL: URL {
        URL(string: ProcessInfo.processInfo.environment["BASE_URL"] ?? "")!
    }
    
    func asURL() throws -> URL {
        return baseURL.appending(path: path)
    }
}
