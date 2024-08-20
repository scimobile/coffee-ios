//
//  Regex.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/20/24.
//

import Foundation
import RegexBuilder

let emailRegex = Regex {
    /^/
    OneOrMore {
        CharacterClass(
            .anyOf("._%+-"),
            ("a"..."z"),
            ("A"..."Z"),
            ("0"..."9")
        )
    }
    "@"
    OneOrMore {
        CharacterClass(
            .anyOf(".-"),
            ("a"..."z"),
            ("A"..."Z"),
            ("0"..."9")
        )
    }
    "."
    Repeat(2...) {
        CharacterClass(
            ("a"..."z"),
            ("A"..."Z")
        )
    }
    /$/
}

let passwordRegex = Regex {
    /^/
    Lookahead {
        Regex {
            ZeroOrMore {
                /./
            }
            One(.digit)
        }
    }
    Lookahead {
        Regex {
            ZeroOrMore {
                /./
            }
            CharacterClass(
                ("A"..."Z"),
                ("a"..."z")
            )
        }
    }
    Lookahead {
        Regex {
            ZeroOrMore {
                /./
            }
            CharacterClass(
                .word,
                .whitespace
            )
            .inverted
        }
    }
    Repeat(8...) {
        /./
    }
    /$/
}
