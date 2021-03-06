//
//  LightError.swift
//  Floral
//
//  Created by LDD on 2019/7/18.
//  Copyright © 2019 文刂Rn. All rights reserved.
//

import UIKit
import Moya

public struct LightError: Error {
    
    public let code: Int
    public let reason: String
}

extension Error {
    
    var errorMessage: String {
        
        guard let error = self as? MoyaError else {return "未知错误"}
        
        switch error {
        case let .underlying(underlyingError, _):
            
            if let underlyingError = underlyingError as? LightError {
                return underlyingError.reason
            }
        default:
            break
        }
        return "未知错误"
    }
}

