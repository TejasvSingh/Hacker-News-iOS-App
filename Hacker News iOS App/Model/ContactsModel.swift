//
//  ContactsModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 8/27/25.
//

struct ContactItems {
    let name: String
    let role: String
    let avatar: String
    let flag: String
    
    static func getContactsList() -> [ContactItems] {
        return [.init(name: "Mohammad Hussain cfgchgvgvy gyhjhbuhbhjbjnbjghvjhvbjhvbjghvbuvuygvyug", role: "SEO Specialist", avatar: "mAvatar", flag: "mFlag"),
                .init(name: "John Young", role: "Interactive Designer", avatar: "jAvatar", flag: "jFlag"),
                .init(name: "Tamilarasi Mohan", role: "Architect", avatar: "tAvatar", flag: "tFlag"),
                .init(name: "Kim Yu", role: "Economist", avatar: "kAvatar", flag: "kFlag"),
                .init(name: "Derek Fowler", role: "Web Strategist", avatar: "dAvatar", flag: "dFlag"),
                .init(name: "Shreya Nithin", role: "Product Designer", avatar: "sAvatar", flag: "sFlag"),
                .init(name: "Emily Adams", role: "Editor", avatar: "eAvatar", flag: "eFlag")
        ]
    }
}
