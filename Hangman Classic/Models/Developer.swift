//
//  Developer.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 24.04.2023.
//

enum Status: String {
    case teamlead = "Teamlead"
    case contributor = "Contributors"
}

struct Developer {
    let status: Status
    let person: [Person]
}

struct Person {
    let name: String
    let nickName: String
    let gitHubLink: String
    let photo: String
}

extension Developer {
    static func getDevInfo() -> [Developer] {
        [
            Developer(
                status: .teamlead,
                person: [
                    Person(
                        name: "Константин",
                        nickName: "dutysniper",
                        gitHubLink: "https://github.com/dutysniper",
                        photo: "Konstantin"
                    )
                ]
            ),
            Developer(
                status: .contributor,
                person: [
                    Person(
                        name: "Михаил",
                        nickName: "GE-Developer",
                        gitHubLink: "https://github.com/GE-Developer",
                        photo: "Mikhail"
                    ),
                    Person(
                        name: "Степан",
                        nickName: "qwezxcdegen",
                        gitHubLink: "https://github.com/qwezxcdegen",
                        photo: "Stepan"
                    )
                ]
            )
        ]
    }
}
