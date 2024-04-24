//
//  URLModel.swift
//  E learners
//
//  Created by Abdul Naffay on 25/07/2023.
//

import Foundation

// MARK: - GetURLModel
struct GetURLModel: Codable {
    let url, siteURL: String
    let appLogo, appPrimaryColorCode, appSecondaryColorCode, langCode: String
    let appVer: String

    enum CodingKeys: String, CodingKey {
        case url
        case siteURL = "site_url"
        case appLogo = "app_logo"
        case appPrimaryColorCode = "app_primary_color_code"
        case appSecondaryColorCode = "app_secondary_color_code"
        case langCode = "lang_code"
        case appVer = "app_ver"
    }
}
