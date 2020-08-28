//
//  UIColorExtension.swift
//  flutter_math_view
//
//  Created by Paulo Alves on 27/08/20.
//

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        let start = hex.index(hex.startIndex, offsetBy: 1)
        let hexColor = String(hex[start...]).lowercased()

        if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0

            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat((hexNumber & 0x0000ff)) / 255
                a = CGFloat(1.0)

                self.init(red: r, green: g, blue: b, alpha: a)
                return
            }
        }
        
        return nil
    }
}
