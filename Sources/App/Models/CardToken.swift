import Foundation
import Vapor

struct CardToken: Content {
    var cardToken: String
    var customerId: String
}
