class Movie{
    var title:String
    var image:String
    var rating:Float
    var relaseYear:Int
    var genre:[String]
    init(title: String, image: String, rating: Float, relaseYear: Int, genre: [String]) {
        self.title = title
        self.image = image
        self.rating = rating
        self.relaseYear = relaseYear
        self.genre = genre
    }
}
