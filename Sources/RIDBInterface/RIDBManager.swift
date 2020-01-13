//
//  RIDBManager.swift
//  Rootspace
//
//  Created by Michael Ellis on 1/8/20.
//  Copyright © 2020 Rootspace. All rights reserved.
//

import Foundation
import Alamofire
// TODO make something generic for this
class RIDBManager {
    /// Static accessor for this class
    static let shared: RIDBManager
    /// Static accessor for this class's networking needs
    static let ridbAPI: RIDBAPI
    /// Use the shared instance
    private init(apikey: String) {
        shared = RIBDManager()
        ridbAPI = RIDB(apikey: apikey)
    }
    /// Buffer of activities received from RIDB
    private var activityList = ActivityJSONCodable(activities: [])
    /// Stores all fetched facilities received from RIDB
    private var facilityList = FacilityJSONCodable(facilities: [])
    /// Stores facilities from the most recent Facility get request
    private var nearbyFacilityList = FacilityJSONCodable(facilities: [])
    
    func decodeRIDJson<T: Decodable>(from jsonData: Data, using: T.Type) -> T? {
        // Decode the result and store it
        guard let objectUnwrapped = try? JSONDecoder().decode(T.self, from: jsonData) else {
            print("Error parsing Activities JSON")
            return nil
        }
        return objectUnwrapped
    }
    
    func performGET(fromURL url: URL, params: [String: Any], completion: @escaping (Data) -> ()) {
        Alamofire.request(url, method: .get, parameters: params, headers: RIDBAPI.apikeyHeader)
            .validate()
            .response(completionHandler: { response in
                guard let statusCode = response.response?.statusCode,
                    200...299 ~= statusCode,
                    let recdata = response.data else {
                        print(response)
                        print("Error \(response.response?.statusCode ?? -1) in \(#function)")
                        return
                }
                print(response.request?.url?.absoluteURL ?? "No URL")
                completion(recdata)
            })
    }
}
// MARK: - Activities
extension RIDBManager {
    /// Provides a Codable interface for the GET Activities API call to RIDB
    struct ActivityJSONCodable: Codable {
        var activities: [RIDBEntity.Activity]
        private enum CodingKeys: String, CodingKey {
            case activities = "RECDATA"
        }
    }
    /// returns the list of fetched activities
    func getActivities() -> [RIDBEntity.Activity] {
        return activityList.activities
    }
    /// Gets a single activity based on ID
    func getActivity(byId activityId: Int, completion: @escaping (RIDBEntity.Activity?) -> ()) {
        guard let getActivityByIdURL = URL(string: RIDBAPI.BaseURL + RIDBAPI.Entities.activities.rawValue + "/\(activityId)") else {
            print("URL Error in \(#function)")
            return
        }
        performGET(fromURL: getActivityByIdURL, params: [:]) { jsonResponseData in
            // Decode the result and store it
            guard let activityObjectUnwrapped = self.decodeRIDJson(from: jsonResponseData, using: ActivityJSONCodable.self) else {
                print("Error parsing Activities JSON")
                return
            }
            completion(activityObjectUnwrapped.activities.first)
        }
    }
}
// MARK: Facilities
extension RIDBManager {
    /// Provides a Codable interface for the GET Facilities API call to RIDB
    struct FacilityJSONCodable: Codable {
        var facilities: [RIDBEntity.Facility]
        private enum CodingKeys: String, CodingKey {
            case facilities = "RECDATA"
        }
    }
    /// returns the list of fetched facilities
    var allFacilities: [RIDBEntity.Facility] {
        return facilityList.facilities
    }
    /// returns the list of fetched facilities
    var nearbyFacilities: [RIDBEntity.Facility] {
        return nearbyFacilityList.facilities
    }
    /// Stores all facilities on device, call getFacilities() to get results
    func fetchNearbyFacilities(latitude: Double, longitude: Double, radius: Int = 500, getFullResults full: Bool = false, limit: Int = 50, offset: Int = 0, completion: @escaping ([RootspaceDisplayItem]) -> ()) {
        guard let getFacilitiesURL = URL(string: RIDBAPI.BaseURL + RIDBAPI.Entities.facilities.rawValue) else {
            print("URL Error in \(#function)")
            return
        }
        let params: [String : Any] = ["full": "true",
                                      "latitude": String(latitude),
                                      "longitude": String(longitude)]
        performGET(fromURL: getFacilitiesURL, params: params) { jsonResponseData in
            // Reset the list of nearby Facilities if we get a successful response
            self.nearbyFacilityList = FacilityJSONCodable(facilities: [])
            // Decode the result and add to the list
            
            guard let fetchedFacilityList = self.decodeRIDJson(from: jsonResponseData, using: FacilityJSONCodable.self)?.facilities else {
                print("No Facilities Fetched")
                return
            }
            self.nearbyFacilityList.facilities += fetchedFacilityList
            // Remember all the facilities we get so we can easily use them again later
            self.facilityList.facilities += fetchedFacilityList
            var displayableFacilities = [RootspaceDisplayItem]()
            fetchedFacilityList.forEach { iteratedFacility in
                displayableFacilities.append(RootspaceDisplayItem(facility: iteratedFacility))
            }
            completion(displayableFacilities)
        }
    }
}
