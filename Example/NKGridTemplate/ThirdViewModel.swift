//
//  ThirdViewModel.swift
//  NKGridTemplate_Example
//
//  Created by Nick Kopilovskii on 7/5/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import NKAnyViewModel

class ThirdViewModel: NKViewModel {
  func setup(view: AnotherCell) {
    view.lblText?.text = String(describing: type(of: self))
  }
}
