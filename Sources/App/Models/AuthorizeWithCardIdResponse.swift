import Foundation
import Vapor

struct AuthorizeWithCardIdResponse: Content {
    let id: String
    let liveMode: Bool
    let chargeMode: Int
    let responseCode: String
    let redirectUrl: String
    let trackId: String?
    let enrolled: String?
}

