//
//  NewsResponse.swift
//  ModernNewsApp
//
//  Created by TextalkMedia-Emre on 2022-09-03.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
  let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
  let id = UUID()
  let author: String?
  let url: String?
  let source, title, articleDescription: String?
  let image: String?
  let date: Date?

  enum CodingKeys: String, CodingKey {
    case author, url, source, title
    case articleDescription = "description"
    case image, date
  }
}

extension Article {

  /**
   "author": "",
   "url": "https://www.cbssports.com/college-football/news/college-football-picks-schedule-predictions-against-the-spread-odds-for-top-25-games-saturday-in-week-1/",
   "source": "CBS Sports",
   "title": "College football picks, schedule: Predictions against the spread, odds for top 25 games Saturday in Week 1 - CBS Sports",
   "description": "A closer look at the top games for the first Saturday of the 2022 college football season",
   "image": "https://sportshub.cbsistatic.com/i/r/2022/08/28/f0f6d1ca-303e-4c8e-8948-fda764a195cf/thumbnail/1200x675/dcb32c9033306662111d931b391db723/ohio-state-stroud-usatsi.jpg",
   "date": "2022-09-03T14:34:00Z"
   */

  static var dummyData: Article {
    .init(author: "",
          url: "https://www.cbssports.com/college-football/news/college-football-picks-schedule-predictions-against-the-spread-odds-for-top-25-games-saturday-in-week-1/",
          source: "CBS Sports",
          title: "College football picks, schedule: Predictions against the spread, odds for top 25 games Saturday in Week 1 - CBS Sports",
          articleDescription: "A closer look at the top games for the first Saturday of the 2022 college football season",
          image: "https://sportshub.cbsistatic.com/i/r/2022/08/28/f0f6d1ca-303e-4c8e-8948-fda764a195cf/thumbnail/1200x675/dcb32c9033306662111d931b391db723/ohio-state-stroud-usatsi.jpg",
          date: Date())
  }
}
