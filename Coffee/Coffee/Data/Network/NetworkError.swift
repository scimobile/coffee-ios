//
//  NetworkError.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation

enum NetworkError: Error {
    case INVALID_URL
    case DECODE_ERROR
    case EMPTY_RESPONSE
    case UNKNOWN
    case UNEXPECTED_STATUS_CODE(Int)
    
    var customMessage: String {
        switch self {
        case .INVALID_URL:
            return "Invalid Url"
        case .DECODE_ERROR:
            return "Decode Error"
        case .EMPTY_RESPONSE:
            return "Empty Response"
        case .UNKNOWN:
            return "Something went wrong"
        case .UNEXPECTED_STATUS_CODE:
            return "Invalid Status Code"
        }
    }
}
