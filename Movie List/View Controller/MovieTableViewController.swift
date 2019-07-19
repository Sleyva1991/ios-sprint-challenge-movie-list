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
        cell.delegate = self as? MovieTableViewCellDelegate
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movie = movieController.movies[indexPath.row]
        
        delegate?.newMovieWasAdded(movie: movie)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let movie = movieController.movies[indexPath.row]
        if editingStyle == .delete {
            movieController.deleteMovie(movie: movie)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieSegue" {
            guard let destination = segue.destination as? MovieViewController else { return }
            destination.movieController = movieController
        }
        
    }
    
    
}

extension MovieTableViewController: MovieTableViewCellDelegate {
    func unseenButtonWasTapped(on cell: MovieTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else { return }
        let movie = self.movieController.movies[indexPath.row]
        self.movieController.toggleIsLiked(for: movie)
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
}
