//
//  MovieTableViewController.swift
//  Movie List
//
//  Created by Steven Leyva on 7/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol MovieSelectionDelegate: AnyObject {
    func newMovieWasAdded(movie: Movie)
    
}

class MovieTableViewController: UITableViewController {
    
    var movieController = MovieController()
    weak var delegate: MovieSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        let movie = movieController.movies[indexPath.row]
        cell.movie = movie
        cell.delegate = self


        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = movieController.movies[indexPath.row]
        
        delegate?.newMovieWasAdded(movie: movie)
        
    }
    
  

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieSegue" {
            guard let destination = segue.destination as? MovieViewController else { return }
            destination.movieController = movieController
        }
   
    }


}
