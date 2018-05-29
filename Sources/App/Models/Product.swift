import Foundation
import Vapor

struct Product: Codable {
    /// Description of the product. Maximum characters: 500.
    var description: String?
    /// Link to the product image on the merchant's website. Maximum characters: 200.
    var image: String?
    /// Name of product. Maximum characters: 200.
    var name: String?
    /// Product price per unit. Maximum digits: 6.
    var price: Float?
    /// Units of the product to be shipped. Maximum digits: 3.
    var quantity: Int?
    /// Shipping costs. Maximum digits: 6.
    var shippingCost: Float?
    /// Stock Unit Identifier or unique product identifier. Maximum characters: 100.
    var sku: String?
    /// Third party tracking system URL. Maximum characters: 500.
    var trackingUrl: String?
}
