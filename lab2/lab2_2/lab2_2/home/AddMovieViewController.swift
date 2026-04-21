//
//  AddMovieViewController.swift
//  lab2_2
//
//  Created by Nemo on 18/04/2026.
//

import UIKit

class AddMovieViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieType: UITextField!
    @IBOutlet weak var movieYear: UITextField!
    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var movieRate: UITextField!
    
    var delegate: AddMovieDelegate?
    var selectedImage: UIImage?
    @IBAction func pickImageFromGallary(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                movieImageView.image = image
                selectedImage = image
            }
            
            dismiss(animated: true)
        }
        present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
            movieImageView.image = image
            selectedImage = image
        }
        dismiss(animated: true)
    }
    @IBAction func saveBtn(_ sender: UIButton) {
        guard
            let name = movieName.text, !name.isEmpty,
            let image = selectedImage
        else {
            let dialog = UIAlertController(title: "Error",
                                           message: "please, enter name and pick image",
                                           preferredStyle: .alert)
            dialog.addAction(UIAlertAction(title: "Ok", style: .default))
            present(dialog, animated: true)
            return
        }
        let rating = Float(movieRate.text ?? "") ?? 0.0
        let year   = Int(movieYear.text ?? "") ?? 0
        let genres = (movieType.text ?? "")
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespaces) }
        let newMovie = Movie(title: name,image: image,rating: rating,relaseYear: year,genre: genres)
        delegate?.addMovie(movie: newMovie)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Movie"
    }
}
