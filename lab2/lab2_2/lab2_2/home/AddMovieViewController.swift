//
//  AddMovieViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//

import UIKit

class AddMovieViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var movieType: UITextField!
    @IBOutlet weak var movieYear: UITextField!
    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var movieRate: UITextField!
    @IBOutlet weak var movieImageView: UIImageView!
    
    var delegate: AddMovieDelegate?
    var selectedImagePath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Movie"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(pickImageFromGallary))
        movieImageView.addGestureRecognizer(tap)
        movieImageView.isUserInteractionEnabled = true
        movieImageView.image = UIImage(named: "placeholder")
    }
    
    @IBAction func pickImageFromGallary(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else { return }
        movieImageView.image = image
        selectedImagePath = saveImageToDocuments(image)
    }

    func saveImageToDocuments(_ image: UIImage) -> String {
        let fileName = UUID().uuidString + ".jpg"
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        if let data = image.jpegData(compressionQuality: 0.8) {
            try? data.write(to: fileURL)
        }
        return fileName
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        guard
            let name = movieName.text, !name.isEmpty,
            let year = movieYear.text, !year.isEmpty,
            let rating = movieRate.text, !rating.isEmpty,
            let genre = movieType.text, !genre.isEmpty,
            !selectedImagePath.isEmpty
        else {
            let dialog = UIAlertController(
                title: "Error",
                message: "Please fill all fields and select an image",
                preferredStyle: .alert
            )
            dialog.addAction(UIAlertAction(title: "OK", style: .default))
            present(dialog, animated: true)
            return
        }
        
        let newMovie = Movie(
            id: UUID().uuidString,
            title: name,
            year: year,
            genre: genre,
            imdbRating: rating,
            poster: selectedImagePath 
        )
        
        delegate?.addMovie(movie: newMovie)
        navigationController?.popViewController(animated: true)
    }
}
