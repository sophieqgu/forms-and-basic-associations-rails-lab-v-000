class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def genre_name
    self.genre.name
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def note_contents
    self.notes.map {|note| note.content}
  end

  def note_contents=(contents)
    contents.each.do |c|
      if !c.empty?
        note = Note.create(content: content, song_id: self.id)
        self.notes << note
      end
    end
  end
end
