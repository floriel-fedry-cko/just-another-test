import Vapor

/// A single entry of a CardList list.
struct CardList: Codable {
    /// The unique identifier for this `CardList`.
    var id: Int?
    
    /// Number of cards
    var count: Int
    
    /// Cards associated to the customer
    var data: [Card]
}
