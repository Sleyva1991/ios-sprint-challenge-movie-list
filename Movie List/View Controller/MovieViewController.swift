//
//  MovieViewController.swift
//  Movie List
//
//  Created by Steven Leyva on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movieController = MovieController()
    
    @IBOutlet var movieTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addMovieButtonPressed(_ sender: Any) {
        guard let text = movieTextField.text
        
            else { return }
        
        movieController.createMovie(with: text)
        navigationController?.popViewController(animated: true)
    }
    

 
}
