module Favoritable
  extend ActiveSupport::Concern

  included do
    has_many :favorites, dependent: :destroy

    def favorite!
      favorite.create(user: current_user)
    end

    def unfavorite!
      favorite.destroy
    end

    def favorite(current_user)
      favorites.find_by(user: current_user)
    end
  end

end
