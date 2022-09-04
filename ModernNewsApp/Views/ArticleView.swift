//
//  ArticleView.swift
//  ModernNewsApp
//
//  Created by TextalkMedia-Emre on 2022-09-03.
//

import SwiftUI
import URLImage

struct ArticleView: View {
  
  let article: Article
  
  var body: some View {
    HStack {
      if let imgUrl = article.image,
         let url = URL(string: imgUrl) {
        
        URLImage(url, identifier: url.absoluteString) {
          // This view is displayed before download starts
          EmptyView()
        } inProgress: { progress in
          // Display progress
          ProgressView()
        } failure: { error, retry in
          // Display error and retry button
          Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
            .cornerRadius(10)
        } content: { image in
          // Downloaded image
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .environment(\.urlImageOptions,
                      .init(fetchPolicy: .returnStoreElseLoad(downloadDelay: nil)))
        
        //        URLImage(url: url,
        //                 options: URLImageOptions(
        //                  identifier: article.id.uuidString,
        //                  cachePolicy: .returnCac(downloadDelay: 0.25)
        //                 ),
        //                 content: { image in
        //          image.resizable()
        //            .aspectRatio(contentMode: .fill)
        //        })
      } else {
        PlaceholderImageView()
      }
      
      VStack(alignment: .leading, spacing: 4) {
        
        Text(article.title ?? "")
          .foregroundColor(.black)
          .font(.system(size: 18, weight: .semibold))
        Text(article.source ?? "")
          .foregroundColor(.gray)
          .font(.system(size: 12, weight: .regular))
      }
    }
  }
}

struct PlaceholderImageView: View {
  var body: some View {
    Image(systemName: "photo.fill")
      .foregroundColor(.white)
      .background(.gray)
      .frame(width: 100, height: 100)
      .cornerRadius(10)
  }
}

struct ArticleView_Previews: PreviewProvider {
  static var previews: some View {
    ArticleView(article: Article.dummyData)
      .previewLayout(.sizeThatFits)
  }
}
