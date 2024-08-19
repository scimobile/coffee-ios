//
//  String.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import RegexBuilder

extension String? {
    var isEmail: Bool {
        let regex = Regex {
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
        
        guard let email = self,
              !email.isEmpty,
              email.wholeMatch(of: regex) != nil
        else { return false }
        return true
    }
    
    var isValidPassword: Bool {
        let regex = Regex {
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
        guard let password = self,
              !password.isEmpty,
              password.wholeMatch(of: regex) != nil
        else { return false }
        return true
    }
}
