//
//  BiographyViewModel.swift
//  InspireMe
//
//  Created by Sameer  on 04/09/25.
//

import SwiftUI

class BiographyViewModel: ObservableObject {
    @Published var language: AppLanguage

    init(language: AppLanguage = .english) {
        self.language = language
    }

    var name: String {
        switch language {
        case .english:
            return "Dr. A. P. J. Abdul Kalam"
        case .hindi:
            return "डा. ए. पी. जे. अब्दुल कलाम"
        }
    }

    var title: String {
        switch language {
        case .english:
            return "Missile Man of India | 11th President of India"
        case .hindi:
            return "भारत के मिसाइल मैन | भारत के 11वें राष्ट्रपति"
        }
    }

    var imageName: String { "kalam" }

    var facts: [String] {
        switch language {
        case .english:
            return [
                "Born: 15 October 1931",
                "Birthplace: Rameswaram, Tamil Nadu, India",
                "Education: Physics, Aerospace Engineering",
                "President of India: 2002–2007",
                "Awards: Bharat Ratna, Padma Vibhushan, Padma Bhushan"
            ]
        case .hindi:
            return [
                "जन्म: 15 अक्टूबर 1931",
                "जन्मस्थान: रामेश्वरम, तमिलनाडु, भारत",
                "शिक्षा: भौतिकी, एयरोस्पेस इंजीनियरिंग",
                "भारत के राष्ट्रपति: 2002–2007",
                "पुरस्कार: भारत रत्न, पद्म विभूषण, पद्म भूषण"
            ]
        }
    }

    var biography: String {
        switch language {
        case .english:
            return """
            Dr. A. P. J. Abdul Kalam was an eminent scientist, educator, and the 11th President of India. Widely known as the "Missile Man of India," he played a pivotal role in India's civilian space program and military missile development. Born in Rameswaram, he rose from humble beginnings to become a symbol of inspiration for millions of Indians.

            He authored several books and inspired youth across India with his vision for the nation. Kalam emphasized education, innovation, and dedication to nation-building. His life remains a testament to perseverance, integrity, and service.
            """
        case .hindi:
            return """
            डा. ए. पी. जे. अब्दुल कलाम एक महान वैज्ञानिक, शिक्षक और भारत के 11वें राष्ट्रपति थे। व्यापक रूप से "भारत के मिसाइल मैन" के रूप में जाने जाने वाले, उन्होंने भारत के नागरिक अंतरिक्ष कार्यक्रम और सैन्य मिसाइल विकास में महत्वपूर्ण भूमिका निभाई। रामेश्वरम में जन्मे, उन्होंने विनम्र शुरुआत से उठकर लाखों भारतीयों के लिए प्रेरणा का प्रतीक बन गए।

            उन्होंने कई पुस्तकें लिखीं और भारत के युवाओं को अपने राष्ट्र के दृष्टिकोण से प्रेरित किया। कलाम ने शिक्षा, नवाचार और राष्ट्र निर्माण के लिए समर्पण पर जोर दिया। उनका जीवन perseverance, integrity और service का उदाहरण है।
            """
        }
    }

    var wikipediaURL: URL {
        switch language {
        case .english:
            return URL(string: "https://en.wikipedia.org/wiki/A._P._J._Abdul_Kalam")!
        case .hindi:
            return URL(string: "https://hi.wikipedia.org/wiki/ए._पी._जे._अब्दुल_कलाम")!
        }
    }
}


