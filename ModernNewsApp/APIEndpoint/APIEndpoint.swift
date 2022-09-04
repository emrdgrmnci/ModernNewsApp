//
//  APIEndpoint.swift
//  ModernNewsApp
//
//  Created by TextalkMedia-Emre on 2022-09-03.
//

import Foundation

protocol APIBuilder {
  var urlRequest: URLRequest { get }
  var baseURL: URL { get }
  var path: String { get }
}

enum NewsAPI {
  case getNews
}

extension NewsAPI: APIBuilder {
  
  var urlRequest: URLRequest {
    switch self {
    case .getNews:
      return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
  }
  
  var baseURL: URL {
    switch self {
    case .getNews:
      return URL(string: "https://api.lil.software")!
    }
  }
  
  var path: String {
    switch self {
    case .getNews:
      return "/news"
    }
  }
}
