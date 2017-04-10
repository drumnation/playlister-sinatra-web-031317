module Slugifiable
  # use the slug method to retrieve a song/artist/genre from the database and return that entry

  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |object|
        object.slug == slug
      end
    end
    # iterate through all objects and return first object that matches slug argument
  end

  module InstanceMethods
    def slug
      name.strip.downcase.gsub(/[\s\.\/\\]/, '-').tr('$','s').gsub(/[^\w+-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')
    end
    # original filename example: A$AP Rocky - Peso [dance].mp3
    # remove all illegal symbols, brackets, +, dashes, periods, file extension(.mp3)
    # remove spaces and downcase all characters
  end

end
