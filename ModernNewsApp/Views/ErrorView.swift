//
//  ErrorView.swift
//  ModernNewsApp
//
//  Created by TextalkMedia-Emre on 2022-09-04.
//

import SwiftUI

typealias EmptyStateActionHandler = () -> Void

struct ErrorView: View {


  let error: Error
  let handler: EmptyStateActionHandler

  internal init(error: Error, handler: @escaping EmptyStateActionHandler) { //escaping added due to handler can be use out of this scope
    self.error = error
    self.handler = handler
  }

  var body: some View {
    VStack(spacing: 12) {

      Image(systemName: "exclamationmark.icloud.fill")
          .foregroundColor(.gray)
          .font(.system(size: 50, weight: .heavy))
      Text("Ooops...")
          .font(.system(size: 30, weight: .heavy))
      Text(error.localizedDescription)
          .font(.system(size: 15, weight: .regular))
          .foregroundColor(.gray)
          .multilineTextAlignment(.center)
          .padding(.bottom, 10)
      Button("Retry") {
          handler()
      }
      .padding(.horizontal, 22)
      .padding(.vertical, 10)
      .font(.system(size: 20, weight: .bold))
      .background(Color.blue)
      .foregroundColor(.white)
      .cornerRadius(10)
    }
  }
}

struct ErrorView_Previews: PreviewProvider {
  static var previews: some View {
    ErrorView(error: APIError.decodingError) {}
      .previewLayout(.sizeThatFits)
  }
}
