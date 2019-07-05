//
//  MVCViewController.swift
//  NKGridTemplate
//
//  Created by nkopilovskii on 07/05/2019.
//  Copyright (c) 2019 nkopilovskii. All rights reserved.
//

import UIKit
import NKAnyViewModel
import NKGridTemplate

class MVCViewController: NKGridViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  override var gridConfigurator: NKGridConfigurator? { return self }
  
  override var contentCollectionView: UICollectionView? { return collectionView }
  
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
    let side = UIScreen.main.bounds.width * 0.4
    return CGSize(width: side, height: side)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return UIScreen.main.bounds.width * 0.01
  }
  
}

extension MVCViewController: NKGridConfigurator {
  
  var viewer: NKGridViewable? { return self }
  var isRefreshable: Bool { return true }
  
  var refreshTitle: String? { return nil }
  
  var cellViewModelTypes: [NKAnyViewModel.Type] {
    return [FirstViewModel.self, SecondViewModel.self, ThirdViewModel.self]
  }
  
  var headerViewModelTypes: [NKAnyViewModel.Type]? {
    return nil
  }
  
  var footerViewModelTypes: [NKAnyViewModel.Type]? {
    return nil
  }
  
  var numberOfSections: Int {
    return 1
  }
  
  func numberOfItems(in section: Int) -> Int {
    return viewModels.count
  }
  
  func cellViewModel(for indexPath: IndexPath) -> NKAnyViewModel? {
    return viewModels[indexPath.row]
  }
  
  func headerViewModel(for section: Int) -> NKAnyViewModel? {
    return nil
  }
  
  func footerViewModel(for section: Int) -> NKAnyViewModel? {
    return nil
  }
  
  func didSelectItem(at indexPath: IndexPath) { }
  
  func didMakeRefresh() {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
      self.viewer?.endRefresh()
      self.viewer?.reloadCollectionView()
    }
  }
  
  
}
