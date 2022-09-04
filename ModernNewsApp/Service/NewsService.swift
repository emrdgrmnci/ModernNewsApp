//
//  NewsService.swift
//  ModernNewsApp
//
//  Created by TextalkMedia-Emre on 2022-09-03.
//

import Foundation
import Combine

protocol NewsService {
  func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError>
}

struct NewsServiceImplementation: NewsService {
  
  func request(from endpoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> {
    
    let jsonDecoder = JSONDecoder()
    jsonDecoder.dateDecodingStrategy = .iso8601
    
    return URLSession
      .shared
      .dataTaskPublisher(for: endpoint.urlRequest) //Listen to result of service
      .receive(on: DispatchQueue.main)
      .mapError { _ in APIError.unknown}
      .flatMap { data, response -> AnyPublisher<NewsResponse, APIError> in
        guard let response = response as? HTTPURLResponse else {
          return Fail(error: APIError.unknown).eraseToAnyPublisher()
        }
        
        if (200...299).contains(response.statusCode) {
          return Just(data) /*You can use a Just publisher to start a chain of publishers. A Just publisher is also useful when replacing a value with Publishers.Catch.
                             In contrast with Result.Publisher, a Just publisher can’t fail with an error. And unlike Optional.Publisher, a Just publisher always produces a value.*/
            .decode(type: NewsResponse.self, decoder: jsonDecoder)
            .mapError { _ in APIError.decodingError }
            .eraseToAnyPublisher()
        } else {
          return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
        }
      }
      .eraseToAnyPublisher()
  }
}
