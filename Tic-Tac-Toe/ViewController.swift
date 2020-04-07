//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by David Fisher on 4/5/20.
//  Copyright © 2020 David Fisher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var game = TicTacToeGame()
  let xImage = UIDevice.current.userInterfaceIdiom == .phone ? UIImage(named: "iPhone_X.png") : UIImage(named: "iPad_X.png")
  let oImage = UIDevice.current.userInterfaceIdiom == .phone ? UIImage(named: "iPhone_O.png") : UIImage(named: "iPad_O.png")
  @IBOutlet weak var gameStateNavBar: UINavigationBar!

  @IBOutlet weak var gameBoardImageView: UIImageView!
  @IBOutlet var gameBoardButtons: [UIButton]!
  @IBOutlet weak var gameStateLabel: UILabel!


  override func viewDidLoad() {
    super.viewDidLoad()
    gameStateNavBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 34)]


    gameBoardImageView.image = traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact ?
      UIImage(named: "iPhone_board.png") : UIImage(named: "iPad_board.png")

    //    gameBoardImageView.image =
    //      UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ?
    //      UIImage(named: "iPhone_board.png") : UIImage(named: "iPad_board.png")
    print(game)

  }
  @IBAction func pressedNewGame(_ sender: Any) {
    game = TicTacToeGame()
    updateView()
  }

  @IBAction func pressedGameButton(_ sender: Any) {
    let button = sender as! UIButton
    game.pressedSquare(button.tag)
    updateView()
  }

  func updateView() {
    if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone {
      gameStateLabel.text = game.gameState.rawValue
    } else {
      gameStateNavBar.topItem?.title = game.gameState.rawValue
    }

    for button in gameBoardButtons {
      switch game.gameBoard[button.tag] {
      case .none:
        button.setImage(nil, for: .normal)
      case .x:
        button.setImage(xImage, for: .normal)
      case .o:
        button.setImage(oImage, for: .normal)
      }
    }
    



  }

}

