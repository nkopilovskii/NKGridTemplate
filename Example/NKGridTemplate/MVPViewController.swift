//
//  MVPViewController.swift
//  NKGridTemplate_Example
//
//  Created by Nick Kopilovskii on 7/5/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import NKAnyViewModel
import NKGridTemplate

class MVPViewController: NKGridViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override var gridConfigurator: NKGridConfigurator? { return presenter }
  
  override var contentCollectionView: UICollectionView? { return collectionView }
  
  lazy var presenter = Presenter(self)
  
  var viewModels: [NKAnyViewModel] = [  FirstViewModel(),
                                        SecondViewModel(),
                                        ThirdViewModel(),
                                        FirstViewModel(),
                                        FirstViewModel(),
                                        FirstViewModel(),
                                        SecondViewModel(),
                                        SecondViewModel(),
                                        SecondViewModel(),
                                        ThirdViewModel(),
                                        FirstViewModel(),
                                        SecondViewModel(),
                                        ThirdViewModel() ]
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return presenter.cellSize(for: indexPath)
  }

}


//MARK: - Presenter
class Presenter: NKGridConfigurator {
  
  weak var viewer: NKGridViewable?
  
  var viewModels: [NKAnyViewModel] = [  FirstViewModel(),
                                        SecondViewModel(),
                                        ThirdViewModel(),
                                        ThirdViewModel(),
                                        FirstViewModel(),
                                        ThirdViewModel(),
                                        SecondViewModel(),
                                        SecondViewModel(),
                                        ThirdViewModel(),
                                        ThirdViewModel(),
                                        FirstViewModel(),
                                        ThirdViewModel(),
                                        ThirdViewModel() ]
  
  init(_ viewer: NKGridViewable) {
    self.viewer = viewer
  }
  
  var isRefreshable: Bool = true
  
  var refreshTitle: String? { return nil }
  
  var cellViewModelTypes: [NKAnyViewModel.Type] {
    return [FirstViewModel.self, SecondViewModel.self, ThirdViewModel.self]
  }
  
  var headerViewModelTypes: [NKAnyViewModel.Type]? { return nil }
  
  var footerViewModelTypes: [NKAnyViewModel.Type]? { return nil }
  
  var numberOfSections: Int {
    return 1
  }
  
  func numberOfItems(in section: Int) -> Int {
    return viewModels.count
  }
  
  func cellViewModel(for indexPath: IndexPath) -> NKAnyViewModel? {
    return viewModels[indexPath.item]
  }
  
  func headerViewModel(for section: Int) -> NKAnyViewModel? {
    return nil
  }
  
  func footerViewModel(for section: Int) -> NKAnyViewModel? {
    return nil
  }
  
  func didSelectItem(at indexPath: IndexPath) {
    self.viewer?.beginRefresh()
  }
  
  func didMakeRefresh() {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
      self.viewer?.endRefresh()
      self.viewer?.reloadCollectionView()
    }
  }
  
  /**
   Additional method for calculating item cell size
   */
  func cellSize(for indexPath: IndexPath) -> CGSize {
    let side = UIScreen.main.bounds.width * 0.4
    return CGSize(width: side, height: side)
  }
  
}
