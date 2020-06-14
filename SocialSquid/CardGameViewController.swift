//
//  CardGame View Controller.swift
//  SocialSquid
//
//  Created by Alley Pereira on 5/29/20.
//  Copyright © 2020 Alley Pereira. All rights reserved.
//

import UIKit

class CardGameViewController: UIViewController {

    lazy var drawAlert: DrawAlert = {
        DrawAlert()
    }()
    
    var cardGameView: CardGameView {
        self.view as! CardGameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func incresePlayerScore() {
        guard let playerScore = cardGameView.leftScoreLabel.text else {
            return
        }
        var scorePlayerIncremented = Int(playerScore) ?? 0
        scorePlayerIncremented += 1
        // atualizando a tela de pts
        cardGameView.leftScoreLabel.text = String(scorePlayerIncremented)
//        print("Player Win", playerScore)
        if scorePlayerIncremented == 10 {
//            print("Player ganhou ", scorePlayerIncremented)
            cardGameView.leftScoreLabel.text = "0"
            cardGameView.rightScoreLabel.text = "0"
            let alert = UIAlertController(title: "Player Win", message: "", preferredStyle: .alert)
            alert.view.backgroundColor = .systemYellow
            alert.view.layer.cornerRadius = 13
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
                alert.dismiss(animated: true, completion: nil)
            }

            
            self.present(alert, animated: true, completion: nil)
        }
                
    }
    
    func drawnPlayers() {
        self.view.addSubview(drawAlert)
        drawAlert.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            self.view.bottomAnchor.constraint(equalTo: drawAlert.bottomAnchor, constant: 200),
            self.view.centerXAnchor.constraint(equalTo: drawAlert.centerXAnchor, constant: 0)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) { [weak self] in
            self?.drawAlert.removeFromSuperview()
        }
    }
    
    func increseCPUscore() {
        guard let cpuScore = cardGameView.rightScoreLabel.text else {
            return
        }
        var scoreCPUIncremented = Int(cpuScore) ?? 0
        scoreCPUIncremented += 1
        // atualizando a tela de pts
        cardGameView.rightScoreLabel.text = String(scoreCPUIncremented)
//        print("CPU Win", cpuScore)
        if scoreCPUIncremented == 10 {
//            print("CPU Win", scoreCPUIncremented)
            cardGameView.rightScoreLabel.text = "0"
            cardGameView.leftScoreLabel.text = "0"
            let alert = UIAlertController(title: "CPU Win", message: "", preferredStyle: .alert)
            alert.view.backgroundColor = .systemYellow
            alert.view.layer.cornerRadius = 13
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
                alert.dismiss(animated: true, completion: nil)
            }

            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func dealTapped(_ sender: Any) {
        
        //random cards
        let playerNumber = Int.random(in: 2...14)
        let cpuNumber = Int.random(in: 2...14)
        
        
    /*  mocando o valor temporariamente pra drawn
                let playerNumber = 2
                let cpuNumber = 2   */
        
        // imageviews update
        cardGameView.leftImageView.image = UIImage(named: "card\(playerNumber)")
        cardGameView.rightImageView.image = UIImage(named: "card\(cpuNumber)")
        
        if playerNumber > cpuNumber {
            incresePlayerScore()
        } else if playerNumber == cpuNumber {
            drawnPlayers()
        } else {
            increseCPUscore()
        }
        
    
    }
}


