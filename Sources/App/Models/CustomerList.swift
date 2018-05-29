import Foundation
import Vapor

struct CustomerList: Content {
    var count: Int
    var data: [Customer]
}
