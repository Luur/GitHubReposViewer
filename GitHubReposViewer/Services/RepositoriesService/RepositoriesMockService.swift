//
//  RepositoriesMockService.swift
//  GitHubReposViewer
//
//  Created by Svyat Zubyak on 27.12.2021.
//

import Foundation
import Combine

class RepositoriesMockService: RepositoriesServiceProtocol {
    
    // MARK: - Data
    
    static let page1: [Repository] = [
        Repository(id: 44838949, fullName: "apple/swift", description: "The Swift Programming Language", starsCount: 58309, htmlURL: "https://github.com/apple/swift"),
        Repository(id: 790019, fullName: "openstack/swift", description: "OpenStack Storage (Swift). Mirror of code maintained at opendev.org.", starsCount: 2256, htmlURL: "https://github.com/openstack/swift"),
        Repository(id: 130902948, fullName: "tensorflow/swift", description: "Swift for TensorFlow", starsCount: 6035, htmlURL: "https://github.com/tensorflow/swift"),
        Repository(id: 20965586, fullName: "SwiftyJSON/SwiftyJSON", description: "The better way to deal with JSON data in Swift.", starsCount: 21044, htmlURL: "https://github.com/SwiftyJSON/SwiftyJSON"),
        Repository(id: 20822291, fullName: "ipader/SwiftGuide", description: Optional("Swift Featured Projects in brain Mapping"), starsCount: 15615, htmlURL: "https://github.com/ipader/SwiftGuide"),
         Repository(id: 64705781, fullName: "SwifterSwift/SwifterSwift", description: Optional("A handy collection of more than 500 native Swift extensions to boost your productivity."), starsCount: 10728, htmlURL: "https://github.com/SwifterSwift/SwifterSwift"),
        Repository(id: 35732214, fullName: "realm/SwiftLint", description: Optional("A tool to enforce Swift style and conventions."), starsCount: 15541, htmlURL: "https://github.com/realm/SwiftLint"),
        Repository(id: 94066125, fullName: "iOS-Swift-Developers/Swift", description: Optional("🥇Swift基础知识大全,🚀Swift学习从简单到复杂,不断地完善与更新, 欢迎Star❤️,欢迎Fork, iOS开发者交流:①群:446310206 ②群:426087546"), starsCount: 1495, htmlURL: "https://github.com/iOS-Swift-Developers/Swift"),
         Repository(id: 27896005, fullName: "jaguar07/Swift", description: Optional("Sample Code"), starsCount: 47, htmlURL: "https://github.com/jaguar07/Swift"),
         Repository(id: 4276357, fullName: "facebookarchive/swift", description: Optional("An annotation-based Java library for creating Thrift serializable types and services."), starsCount: 886, htmlURL: "https://github.com/facebookarchive/swift")
    ]
    
    static let page2: [Repository] = [
        Repository(id: 63729462, fullName: "airbnb/swift", description: Optional("Airbnb\'s Swift Style Guide."), starsCount: 1384, htmlURL: "https://github.com/airbnb/swift"),
        Repository(id: 33569135, fullName: "ReactiveX/RxSwift", description: Optional("Reactive Programming in Swift"), starsCount: 21187, htmlURL: "https://github.com/ReactiveX/RxSwift"),
        Repository(id: 20682114, fullName: "JakeLin/SwiftLanguageWeather", description: Optional("Swift Language Weather is an iOS weather app developed in Swift 4. "), starsCount: 5191, htmlURL: "https://github.com/JakeLin/SwiftLanguageWeather"),
        Repository(id: 35143711, fullName: "malcommac/SwiftDate", description: Optional("🐔 Toolkit to parse, validate, manipulate, compare and display dates, time & timezones in Swift."), starsCount: 6667, htmlURL: "https://github.com/malcommac/SwiftDate"),
        Repository(id: 65219683, fullName: "SwiftKickMobile/SwiftMessages", description: Optional("A very flexible message bar for iOS written in Swift."), starsCount: 6370, htmlURL: "https://github.com/SwiftKickMobile/SwiftMessages"),
        Repository(id: 22458259, fullName: "Alamofire/Alamofire", description: Optional("Elegant HTTP Networking in Swift"), starsCount: 36914, htmlURL: "https://github.com/Alamofire/Alamofire"),
        Repository(id: 21696302, fullName: "matteocrippa/awesome-swift", description: Optional("A collaborative list of awesome Swift libraries and resources. Feel free to contribute!"), starsCount: 21460, htmlURL: "https://github.com/matteocrippa/awesome-swift"),
        Repository(id: 39166950, fullName: "SwiftGen/SwiftGen", description: Optional("The Swift code generator for your assets, storyboards, Localizable.strings, … — Get rid of all String-based APIs!"), starsCount: 7603, htmlURL: "https://github.com/SwiftGen/SwiftGen"),
        Repository(id: 50447720, fullName: "raywenderlich/swift-algorithm-club", description: Optional("Algorithms and data structures in Swift, with explanations!"), starsCount: 25771, htmlURL: "https://github.com/raywenderlich/swift-algorithm-club"),
        Repository(id: 41854508, fullName: "bizz84/SwiftyStoreKit", description: Optional("Lightweight In App Purchases Swift framework for iOS 8.0+, tvOS 9.0+ and macOS 10.10+ ⛺"), starsCount: 5804, htmlURL: "https://github.com/bizz84/SwiftyStoreKit")
    ]
    
    static let page3: [Repository] = [
        Repository(id: 20430314, fullName: "fullstackio/FlappySwift", description: Optional("swift implementation of flappy bird. More at fullstackedu.com"), starsCount: 9414, htmlURL: "https://github.com/fullstackio/FlappySwift"),
        Repository(id: 56840338, fullName: "NMAC427/SwiftOCR", description: Optional("Fast and simple OCR library written in Swift"), starsCount: 4461, htmlURL: "https://github.com/NMAC427/SwiftOCR"),
        Repository(id: 4044891, fullName: "realm/realm-swift", description: Optional("Realm is a mobile database: a replacement for Core Data & SQLite"), starsCount: 14803, htmlURL: "https://github.com/realm/realm-swift"),
        Repository(id: 45497910, fullName: "apple/swift-evolution", description: Optional("This maintains proposals for changes and user-visible enhancements to the Swift Programming Language."), starsCount: 12966, htmlURL: "https://github.com/apple/swift-evolution"),
        Repository(id: 190707613, fullName: "Juanpe/About-SwiftUI", description: Optional("Gathering all info published, both by Apple and by others, about new framework SwiftUI. "), starsCount: 5958, htmlURL: "https://github.com/Juanpe/About-SwiftUI"),
        Repository(id: 47025785, fullName: "SwiftyBeaver/SwiftyBeaver", description: Optional("Convenient & secure logging during development & release in Swift 3, 4 & 5"), starsCount: 5393, htmlURL: "https://github.com/SwiftyBeaver/SwiftyBeaver"),
        Repository(id: 66302557, fullName: "nicklockwood/SwiftFormat", description: Optional("A command-line tool and Xcode Extension for formatting Swift code"), starsCount: 5332, htmlURL: "https://github.com/nicklockwood/SwiftFormat"),
        Repository(id: 190082368, fullName: "Jinxiansen/SwiftUI", description: Optional("`SwiftUI` Framework  Learning and Usage Guide. 🚀 "), starsCount: 3999, htmlURL: "https://github.com/Jinxiansen/SwiftUI"),
        Repository(id: 130471182, fullName: "huri000/SwiftEntryKit", description: Optional("SwiftEntryKit is a presentation library for iOS. It can be used to easily display overlays within your iOS apps."), starsCount: 5711, htmlURL: "https://github.com/huri000/SwiftEntryKit"),
        Repository(id: 93580, fullName: "swiftmailer/swiftmailer", description: Optional("Comprehensive mailing tools for PHP"), starsCount: 9505, htmlURL: "https://github.com/swiftmailer/swiftmailer")
    ]
    
    // MARK: - Methods
    
    func fetchRepositories(searchText: String, page: Int) -> AnyPublisher<[Repository], Error> {
        Future<[Repository], Error> { promise in
            DispatchQueue.main.asyncAfter(deadline:.now() + 2) {
                switch page {
                case 1:
                    promise(.success(type(of: self).page1))
                case 2:
                    promise(.success(type(of: self).page2))
                case 3:
                    promise(.success(type(of: self).page3))
                default:
                    promise(.success([]))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
