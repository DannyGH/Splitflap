//
//  ViewController.swift
//  SplitflapExample
//
//  Created by Yannick LORIOT on 10/11/15.
//  Copyright © 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SplitflapDataSource, SplitflapDelegate {
  @IBOutlet weak var splitflap: Splitflap!
  @IBOutlet weak var actionButton: UIButton!

  private let words        = ["Cat \(String(UnicodeScalar(0x1F63B)))", "Bonsoir", "12h15", "Arrival"]
  private var currentIndex = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    FlapViewBuilder { builder in
      builder.backgroundColor = UIColor.whiteColor()
    }
    
    splitflap.datasource = self
    splitflap.delegate   = self
    splitflap.reload()
  }

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    //updateSplitFlapAction(actionButton)
  }

  // MARK: - Action Methods

  @IBAction func updateSplitFlapAction(sender: AnyObject) {
    splitflap.setText(words[currentIndex], animated: true)

    currentIndex = (currentIndex + 1) % words.count

    updateButtonWithTitle(words[currentIndex])
  }

  private func updateButtonWithTitle(title: String) {
    actionButton.setTitle("Say \(words[currentIndex])!", forState: .Normal)
  }

  // MARK: - Splitflap DataSource Methods

  func numberOfFlapsInSplitflap(splitflap: Splitflap) -> Int {
    return 5
  }

  func tokensInSplitflap(splitflap: Splitflap) -> [String] {
    return [" ", "C", "a", "t", String(UnicodeScalar(0x1F63B))] //SplitflapTokens.AlphanumericAndSpace
  }

  // MARK: - Splitflap Delegate Methods

  func splitflap(splitflap: Splitflap, rotationDurationForFlapAtIndex index: Int) -> Double {
    return 0.2
  }

  func splitflap(splitflap: Splitflap, builderForFlapAtIndex index: Int) -> FlapViewBuilder {
    return FlapViewBuilder { builder in
      builder.backgroundColor = UIColor(red: 251/255, green: 249/255, blue: 243/255, alpha: 1)
      builder.cornerRadius    = 5
      builder.font            = UIFont(name: "Avenir-Black", size:45)
      builder.textAlignment   = .Center
      builder.textColor       = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
      builder.lineColor       = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
  }
}

