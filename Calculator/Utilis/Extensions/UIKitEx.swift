//
//  UIKitEx.swift
//  IOSCourse
//
//  Created by Huda M. A'abed on 05/08/2022.
//

import Foundation
import UIKit


class rView: UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2

    }
}

class rLabel: UILabel{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2

    }
}

class rButton: UIButton{
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2

    }
}

class rImage: UIImageView  {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2

    }
}
