import Foundation
import Vapor

struct ChargeResponse: Content {
    var id: String
    var liveMode: Bool
    var created: String
    var value: Int
    var currency: String
    var trackId: String?
    var description: String?
    var email: String
    var chargeMode: Int
    var transactionIndicator: Int
    var customerIp: String?
    var responseMessage: String
    var responseAdvancedInfo: String
    var responseCode: String
    var status: String
    var authCode: String
    var isCascaded: Bool
    var autoCapture: String
    var autoCapTime: Int
    var card: Card
    var riskCheck: Bool
//    var customerPaymentPlans: Any
    var metadata: [String: String]?
    var shippingDetails: Address
//    var products: Any
    var udf1: String?
    var udf2: String?
    var udf3: String?
    var udf4: String?
    var udf5: String?
}
