//
//  ResultState.swift
//  ModernNewsApp
//
//  Created by TextalkMedia-Emre on 2022-09-03.
//

import Foundation

enum ResultState {
  case loading
  case success(content: [Article])
  case failed(error: Error)
}
