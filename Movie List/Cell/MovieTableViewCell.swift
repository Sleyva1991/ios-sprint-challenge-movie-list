//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Steven Leyva on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


protocol MovieTableViewCellDelegate: class {
   func unseenButtonWasTapped(on cell: MovieTableViewCell)
}

class MovieTableViewCell: UITableViewCell {
    
 
   
    @IBOutlet weak var isSeenButton: UIButton!
    @IBOutlet weak var movieLabel: UILabel!
    
    weak var delegate: MovieTableViewCellDelegate?
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func notSeenButtonPressed(_ sender: Any) {
        self.delegate?.unseenButtonWasTapped(on: self)
    }
    func updateViews() {
        guard let movie = movie else { return }
        let isSeenString = movie.seen ? "Not Seen" : "Seen"
        isSeenButton.setTitle(isSeenString, for: .normal)
        movieLabel.text = movie.text
    }
    
}
