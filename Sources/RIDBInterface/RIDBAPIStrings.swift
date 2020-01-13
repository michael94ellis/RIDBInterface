//
//  APIStrings.swift
//  Rootspace
//
//  Created by Michael Ellis on 1/6/20.
//  Copyright © 2020 Rootspace. All rights reserved.
//

/// Set the apikey before using
struct RIDBAPI {
    init(apikey: String) { myAPIKey = apikey }
    static var myAPIKey = ""
    static var apikeyHeader: [String: String] { ["apikey": apikey] }
    static let BaseURL = "https://ridb.recreation.gov/api/v1/"
    enum Entities: String {
        case activities
        case attributes
        case campsites
        case events
        case facilities
        case facilityactivities
        case facilityaddresses
        case facilitycampsites
        case facilitypermitentrances
        case facilityrecareas
        case facilitytours
        case links
        case medias
        case organizations
        case permitentrances
        case permittedequipments
        case recreationareas
        case recreationareaactivities
        case recreationareaaddresses
        case recreationareafacilities
        case yours
        case zones
    }
}
