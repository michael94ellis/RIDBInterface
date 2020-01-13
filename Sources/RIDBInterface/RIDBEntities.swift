//
//  RIDBEntities.swift
//  Rootspace
//
//  Created by Michael Ellis on 1/7/20.
//  Copyright © 2020 Rootspace. All rights reserved.
//

import Foundation

/// Using the RIDB schema, © 2020 Recreation.gov. All Rights Reserved
struct RIDBEntity {
    enum AddressType: String, Codable {
        case Default
        case Mailing
        case Physical
    }
    struct Activity: Codable {
        /// Unique ID
        let ActivityID: Int
        /// ParentID of the related Actitvity
        let ActivityParentID: Int
        /// Name of the activity
        let ActivityName: String
        /// Amount of physical exertion to be expected for a given activity such as hiking, swimming, etc.
        let ActivityLevel: Int
    }
    struct Attribute: Codable {
        /// Attribute ID
        let AttributeID: Int
        /// Attribute Name Maximum Length 60
        let AttributeName: String
        /// Attribute Value MaximumLength 255
        let AttributeValue: String
    }
    struct Campsite: Codable {
        /// Campsite ID
        let CampsiteID: String
        /// Facility ID the campsite belongs to
        let FacilityID: String
        /// Campsite name Maximum Length 255
        let CampsiteName: String
        /// Campsite type  Maximum Length 255
        let CampsiteType: String
        /// Type of use Maxium Length 255
        let TypeOfUse: String
        /// Name of loop the campsite resides on Maximum Length 255
        let Loop: String
        /// Is the campsite accessible by vehicle
        let CampsiteAccessible: Bool
        /// Longitude of the permit, example: -118.0186111
        let CampsiteLongitude: Double
        /// Latitude of the permit, example: 44.6969444
        let CampsiteLatitude: Double
        /// Record creation date, example: 2018-10-01
        let CreatedDate: String
        /// Record last update date, example: 2018-10-01
        let LastUpdatedDate: String
        /// Array of Campsite Attributes
        let ATTRIBUTES: [Attribute]
        /// Array of Permitted Equipment allowed in the Campsite
        let PERMITTEDEQUIPMENT: [PermittedEquipment]
        /// Array of Media for the Campsite
        let ENTITYMEDIA: [Media]
    }
    struct Event: Codable {
        /// Event ID
        let EventID: String
        /// Full name of the Event Maximum Length 60
        let EventName: String
        /// Internet address (URL) to a web site providing details
        let ResourceLink: String
    }
    struct JSONGeoCoords: Codable {
        /// example: Point
        let TYPE: String
        /// Always 2 Doubles, example: List [ -103.4525186, 43.88037021 ]
        let COORDINATES: [Double]?
    }
    struct Facility: Codable {
        /// RIDB unique Facility ID, example: 233115
        let FacilityID: String
        /// Legacy Facility ID, example: 71992
        let LegacyFacilityID: String
        /// The agency's internal Facility ID provided to the RIDB by the agency, example: AN371992
        let OrgFacilityID: String
        /// The parent Organization ID, example: 131
        let ParentOrgID: String
        ///The parent RecArea ID, example: 1113
        let ParentRecAreaID: String
        /// Full name of the Facility, example: UNION CREEK CAMPGROUND, maxLength: 256
        let FacilityName: String
        /// HTML describing the main features of the Facility, maxLength: 4000
        let FacilityDescription: String
        /// Description of the type of Facility, example: Campground, maxLength: 1024
        let FacilityTypeDescription: String
        /// Text describing monetary charges associated with entrance to or usage of the Facility
        let FacilityUseFeeDescription: String
        /// Text that provides general directions and/or the general location of the Facility, maxLength: 4000
        /// example: From Baker City, Oregon, travel south on Highway 7 for about 18 miles. The campground and day-use entrance is signed on the left side of the road. Follow the signs in the Union Creek Recreation Area down to the various campground loops and areas.
        let FacilityDirections: String
        /// Phone number of the Facility, example: 541-894-2332, maxLength: 256
        let FacilityPhone: String
        /// Email address of the Facility, example: campgrounds@anthonylakes.com, maxLength: 60
        let FacilityEmail: String
        ///  Internet address (URL) for the web site hosting the reservation system, maxLength: 256
        let FacilityReservationURL: String
        /// Internet address (URL) that hosts the Facility map, maxLength: 256
        let FacilityMapURL: String
        /// Information about the Americans with Disabilities Act accessibility for the Facility, example: N, maxLength: 1024
        let FacilityAdaAccess: String
        let GEOJSON: JSONGeoCoords
        /// Longitude in decimal degrees -180.0 to 180.0, example: -118.0186111
        let FacilityLongitude: Double
        /// Latitude in decimal degrees -90.0 to 90.0, example: 44.6969444
        let FacilityLatitude: Double
        /// Details on the stay limits for the Facility, max 500
        let StayLimit: String
        /// List of keywords for the Facility, example: NW02,Phillips Reservoir, maxLength: 4000
        let Keywords: String
        /// Whether the Facility is reservable
        let Reservable: Bool
        /// Whether the Facility is enabled
        let Enabled: Bool
        /// Record last update date, example: 2018-10-01
        let LastUpdatedDate: String
        let CAMPSITE: [Campsite]
        let PERMITENTRANCE: [PermitEntrance]
        let TOUR: [Tour]
        let ORGANIZATION: [Organization]
        let RECAREA: [FacilityRecArea]
        let FACILITYADDRESS: [FacilityAddress]
        let ACTIVITY: [FacilityActivity]
        let EVENT: [Event]
        let LINK: [Link]
        let MEDIA: [Media]
    }
    struct FacilityActivity: Codable {
        /// Activity ID
        let ActivityID: Int
        /// Parent Facility ID of the Actitvity
        let FacilityID: String
        /// Name of the Activity, maxLength: 60
        let ActivityName: String
        ///Description of the Activity, maxLength: 1024
        let FacilityActivityDescription: String
        /// Text describing monetary charges associated with the Activity, maxLength: 1024
        let FacilityActivityFeeDescription: String
    }
    struct FacilityAddress: Codable {
        /// Facility Address ID, example: 10639
        let FacilityAddressID: String
        /// Facility ID, example: 203140
        let FacilityID: String
        /// Address type for the Facility, example: Default
        let FacilityAddressType: AddressType.RawValue
        /// Address line 1 of the Facility, example: P.O. Box 150153, maxLength: 256
        let FacilityStreetAddress1: String
        /// Address line 2 of the Facility, maxLength: 256
        let FacilityStreetAddress2: String
        /// Address line 3 of the Facility, maxLength: 256
        let FacilityStreetAddress3: String
        /// City where the Facility is located, example: Dallas, maxLength: 60
        let City: String
        /// Postal code for the Facility, example: 75315-0153, maxLength: 20
        let PostalCode: String
        /// State code for the Facility, example: TX, maxLength: 20
        let AddressStateCode: String
        /// Abbreviated country code for the Facility Address, example: USA, maxLength: 5
        let AddressCountryCode: String
        /// Record last update date, example: 2018-10-01
        let LastUpdatedDate: String
    }
    struct FacilityCampsite: Codable {
        /// Campsite ID
        let CampsiteID: String
        /// Campsite Name, maxLength: 255
        let CampsiteName: String
        /// Internet address (URL) to a web site providing details
        let ResourceLink: String
    }
    struct FacilityPermitEntrance: Codable {
        /// Permit Entrance ID
        let PermitEntranceID: String
        /// Permit Entrance name, maxLength: 512
        let PermitEntranceName: String
        /// Internet address (URL) to a web site providing details
        let ResourceLink: String
    }
    struct FacilityRecArea: Codable {
        /// RIDB unique RecArea ID, example: 1113
        let RecAreaID: String
        /// Full name of the RecArea, example: Wallowa Whitman National Forest, maxLength: 256
        let RecAreaName: String
        /// Internet address (URL) to a web site providing details
        let ResourceLink: String
    }
    struct FacilityTour: Codable {
        /// Tour ID
        let TourID: String
        /// Tour name, maxLength: 255
        let TourName: String
        /// Internet address (URL) to a web site providing details
        let ResourceLink: String
    }
    struct Link: Codable {
        /// Primary Key
        let EntityLinkID: String
        /// Type of link, e.g. Facebook, Twitter, official site, maxLength: 500
        let LinkType: String
        /// RecArea ID OR Facility ID
        let EntityID: String
        /// RecArea or Facility
        let EntityType: String
        /// Full text title
        let Title: String
        /// Text description of the entity link
        let Description: String
        /// Internet address (URL) to a web site, maxLength: 2000
        let URL: String
    }
    enum MediaType: String, Codable {
        case Image
        case Video
    }
    struct Media: Codable {
        /// Primary Key
        let EntityMediaID: String
        /// Type of Media, e.g. Image, Video, etc., maxLength: 500
        let MediaType: MediaType
        /// RecArea ID OR Facility ID OR Tour ID OR Permit Entrance ID OR Campsite ID
        let EntityID: String
        /// RecArea, Facility, Tour, Entrance, or Site
        let EntityType: String
        /// Full title of the entity media, maxLength: 500
        let Title: String
        /// Optional subtitle of the entity media, maxLength: 1000
        let Subtitle: String
        /// Optional description of the entity media
        let Description: String
        /// Optional embedded code for media entity
        let EmbedCode: String
        /// Height in pixels for media image
        let Height: Int
        /// Width in pixels for the media image
        let Width: Int
        /// Whether the image is a primary image
        let IsPrimary: Bool
        /// Whether the image is a preview image
        let IsPreview: Bool
        /// Whether the image is a gallery image
        let IsGallery: Bool
        /// Internet address (URL) to the entity media
        let URL: String
        /// Optional credit for entity media, maxLength: 1000
        let Credits: String
    }
    struct Organization: Codable {
        /// Organization ID
        let OrgID: String
        /// Full name of organization, example: National Park Service, maxLength: 60
        let OrgName: String
        /// Internet address (URL) that hosts the sample image or photo of the organization, example: nps.jpeg, maxLength: 256
        let OrgImageURL: String
        /// Optional Readable text that provides the URL address link, maxLength: 256
        let OrgURLText: String
        /// Internet address (URL) for web site of the organization responsible for submitting and maintaining the data to be exchanged, example: http://www.nps.gov
        let OrgURLAddress: String
        /// Internet address (URL) that hosts the sample image or photo of the organization, example: Department of the Interior
        let OrgType: String
        /// Abbreviated name of the organization, example: NPS
        let OrgAbbrevName: String
        /// Organization jurisdiction type, example: Federal
        let OrgJurisdictionType: String
        /// Parent Organization ID, example: 139
        let OrgParentID: String
        /// Record last update date, example: 2018-10-01
        let LastUpdatedDate: String
    }
    struct PermitEntrance: Codable {
        /// Permit Entrance ID
        let PermitEntranceID: String
        /// Facility ID the permit belongs to
        let FacilityID: String
        /// Permit Entrance name, max 512
        let PermitEntranceName: String
        /// Permit Entrance description, maxLength: 255
        let PermitEntranceDescription: String
        /// District the permit resides in, maxLength: 60
        let District: String
        /// Town the permit resides in
        let Town: String
        /// Is the permit accessible by vehicle
        let PermitEntranceAccessible: Bool
        /// Latitude of the permit location
        let Longitude: Double
        /// Longitude of the permit location
        let Latitude: Double
        
        let GEOSJON: JSONGeoCoords
        ///Record creation date, example: 2018-10-01
        let CreatedDate: String
        /// Record last update date, example: 2018-10-01
        let LastUpdatedDate: String
        let ATTRIBUTES: [Attribute]
        let ENTITYMEDIA: [Media]
        let ZONES: [Zone]
    }
    struct PermittedEquipment: Codable {
        /// Equipment name, example: RV, maxLength: 255
        let EquipmentName: String
        /// Maximum length of equipment, example: 27
        let MaxLength: Double
    }
    struct RecreationArea: Codable {
        /// RIDB unique RecArea ID, example: 2837
        let RecAreaID: String
        /// The agency's internal RecArea ID provided to the RIDB by the agency, example: MORU
        let OrgRecAreaID: String
        /// Parent Organization ID, example: 128
        let ParentOrgID: String
        /// Full name of the RecArea, example: Mount Rushmore National Memorial, maxLength: 256
        let RecAreaName: String
        /// Text that describes the RecAreamaxLength: 4000
        /// example: Majestic figures of George Washington, Thomas Jefferson, Theodore Roosevelt and Abraham Lincoln, surrounded by the beauty of the Black Hills of South Dakota, tell the story of the birth, growth, development and preservation of this country. From the history of the first inhabitants to the diversity of America today, Mount Rushmore brings visitors face to face with the rich heritage we all share.
        let RecAreaDescription: String
        /// Text describing monetary charges associated with entrance to or usage of a RecArea
        let RecAreaFeeDescription: String
        /// Directions to the RecArea, maxLength: 4000
        /// example: Visitors traveling by car from the East use Exit 61 off I-90 follow signs. Coming from the West use exit 57 exit at Rapid City and follow U.S. Highway 16 southwest to Keystone and then Highway 244 to Mount Rushmore. Visitors coming from the south should follow Highway 385 north to Highway 244, which is the road leading to the memorial.
        let RecAreaDirections: String
        /// Phone number for RecArea, example: (605) 574-2523, maxLength: 256
        let RecAreaPhone: String
        /// Email address of the RecArea, example: ed_menard@nps.gov, maxLength: 256
        let RecAreaEmail: String
        /// Internet address (URL) for the web site hosting the reservation system, maxLength: 256
        let RecAreaReservationURL: String
        /// Internet address (URL) that hosts the RecArea map, maxLength: 256
        let RecAreaMapURL: String
        let GEOJSON: [JSONGeoCoords]
        /// Longitude in decimal degrees -180.0 to 180.0, example: -103.4525186
        let RecAreaLongitude: Double
        /// Latitude in decimal degrees -90.0 to 90.0
        let RecAreaLatitude: Double        /// Details on the stay limits for the RecArea
        let StayLimit: String
        /// List of keywords for the RecArea, example: Mount Rushmore National Memorial, max 4000
        let Keywords: String
        /// Whether the RecArea is reservable
        let Reservable: Bool
        // Whether the RecArea is enabled
        let Enabled: Bool
        /// Record last update date, example: 2018-10-01
        let LastUpdatedDate: String
        let ORGANIZATION: [Organization]
        let FACILITY: [Facility]
        let RECAREAADDRESS: [RecreationAreaAddress]
        let ACTIVITY: [Activity]
        let EVENT: [Event]
        let MEDIA: [Media]
        let LINK: [Link]
    }
    struct RecreationAreaActivity: Codable {
        /// Activity ID
        let ActivityID: String
        /// Parent ID of the related Actitvity
        let ActivityParentID: String
        /// Parent RecArea ID of the Actitvity
        let RecAreaID: String
        /// Name of the Activity, maxLength: 60
        let ActivityName: String
        /// Description of the Activity, maxLength: 1024
        let RecAreaActivityDescription: String
        /// Text describing monetary charges associated with the Activity, maxLength: 1024
        let RecAreaActivityFeeDescription: String
    }
    struct RecreationAreaAddress: Codable {
        /// RecArea Address ID, example: 857423
        let RecAreaAddressID: String
        /// RecArea ID, example: 2820
        let RecAreaID: String
        /// Address type for the RecArea, example: Mailing, maxLength: 20
        let RecAreaAddressType: AddressType
        /// Address line 1 of the RecArea, example: 12521 Lee Highway, maxLength: 256
        let RecAreaStreetAddress1: String
        /// Address line 2 of the RecArea, maxLength 256
        let RecAreaStreetAddress2: String
        /// Address line 3 of the RecArea, maxLength: 256
        let RecAreaStreetAddress3: String
        /// City where the RecArea is located, example: Manassas, maxLength: 60
        let City: String
        /// Postal code for the RecArea, example: 20109, maxLength: 20
        let PostalCode: String
        /// State code for the RecArea, example: VA, maxLength: 20
        let AddressStateCode: String
        /// Abbreviated country code for the RecArea, example: USA, maxLength: 5
        let AddressCountryCode: String
        /// Record last update date, example: 2018-10-01
        let LastUpdatedDate: String
    }
    struct RecreationAreaFacility: Codable {
        /// RIDB unique Facility ID
        let FacilityID: String
        /// Full name of the Facility, maxLength: 256
        let FacilityName: String
        /// Internet address (URL) to a web site providing details
        let ResourceLink: String
    }
    struct Tour: Codable {
        /// Tour ID
        let TourID: String
        /// Facility ID the tour belongs to
        let FacilityID: String
        /// Facility ID the tour belongs to, maxLength: 255
        let TourName: String
        /// Tour Type, maxLength: 255
        let TourType: String
        /// Tour description, maxLength: 255
        let TourDescription: String
        /// Tour duration
        let TourDuration: Int
        /// Is the tour accessible by vehicle
        let TourAccessible: Bool
        /// Record creation date, example: 2018-10-01
        let CreatedDate: String
        /// Record last update date, example: 2018-10-01
        let LastUpdatedDate: String
        let ATTRIBUTES: [Attribute]
        /// Media records for Tour
        let ENTITYMEDIA: [Media]
        /// Related Tours, tours that are members of the same set of tours
        let MEMBERTOURS: [Tour]
    }
    struct Zone: Codable {
        let PermitEntranceZoneID: String
        let Zone: String
    }
}
