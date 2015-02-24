import Foundation

struct LaunchMenuItem {
    let title: String
    let details: String
    let runAction: () -> ()
}

struct LaunchMenuSection {
    let title: String
    let items: [LaunchMenuItem]
}

struct LaunchMenu {
    let sections: [LaunchMenuSection]
}