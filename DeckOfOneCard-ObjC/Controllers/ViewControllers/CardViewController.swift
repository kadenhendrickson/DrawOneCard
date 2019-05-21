//
//  CardViewController.swift
//  DeckOfOneCard-ObjC
//
//  Created by Kaden Hendrickson on 5/21/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        fetchAndSetCardInfo()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func generateCardButtonTapped(_ sender: Any) {
        fetchAndSetCardInfo()
    }
    
    fileprivate func fetchAndSetCardInfo() {
        KHECardController.fetchCard { (card) in
            DispatchQueue.main.async {
                guard let card = card else {return}
                self.valueLabel.text = card.value + " of " + card.suit
                
            }
            guard let cardImage = card?.imageUrl else {return}
            KHECardController.fetchImage(withUrlString: cardImage, andCompletion: { (image) in
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                }
            })
        }
    }
}
